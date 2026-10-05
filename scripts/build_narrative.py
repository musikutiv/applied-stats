"""Rebuild narrative.md from the speaker notes in the section files.

Run from the project root:  python3 scripts/build_narrative.py
The parsing and rendering functions are reused by scripts/build_crc205.py.
"""
import re

SESSIONS = [
    ("SESSION 1", [
        ("BLOCK 1 · The Experiment", ["_01-my-experiment"]),
        ("BLOCK 2 · The Question", ["_02-question", "_03-sample-to-claim"]),
        ("BRIDGE · Response and Break", ["_03b-response-and-break"]),
        ("BLOCK 3 · Reading the Data", ["_04-read-the-data"]),
        ("BLOCK 4 · Effect and Uncertainty", ["_05-effect-and-uncertainty"]),
        ("BLOCK 5 · The Null Model", ["_06-null-model"]),
    ]),
    ("SESSION 2", [
        ("BLOCK 1 · Power and Design", ["_s2-01-power-and-design"]),
        ("BLOCK 2 · Multiple Testing", ["_s2-02-multiplicity"]),
        ("BLOCK 3 · Tests From Design", ["_s2-03-tests-from-design"]),
        ("BLOCK 4 · Common Issues", ["_s2-04-common-issues"]),
        ("BLOCK 5 · Final Workshop — Compound R", ["_s2-05-final-workshop"]),
    ]),
]

# Extra instructor reminders that are not part of a Say: block.
EXTRAS = {
    "population-question": '*(Note: The takeaway "What would you need to know before choosing A?" is a fragment — it does not appear until you advance. Do not read it aloud at the start of the discussion.)*',
    "no-effect-fallacy": "*(Takeaway: Absence of evidence is not evidence of absence. — Altman & Bland 1995)*",
}

TIME = re.compile(r"\*\*Time: (\d\d:\d\d)–(\d\d:\d\d)")
SAY = re.compile(r"\*\*Say:\*\*\s*(.+)")
CONTEXT = re.compile(r"\*\*Context \(not yet revealed\):\*\*\s*(.+)")
PROVENANCE = re.compile(r"\s*Instructor-only provenance:(.*?Do not reveal this yet\.)")


def split_slides(text):
    """Return the raw text of each '## ' slide in a section file."""
    return [b.strip("\n") for b in re.split(r"\n(?=## )", "\n" + text) if b.strip().startswith("## ")]


def parse_slide(block):
    head = block.split("\n", 1)[0]
    time, say, context = TIME.search(block), SAY.search(block), CONTEXT.search(block)
    return dict(id=re.search(r"\{#([\w-]+)", head).group(1),
                title=re.sub(r"\s*\{#.*\}\s*$", "", head[3:]).strip(),
                interaction=".interaction" in head,
                start=time[1] if time else "", end=time[2] if time else "",
                say=say[1].strip() if say else "",
                context=context[1].strip() if context else "")


def slides(fname):
    return [parse_slide(b) for b in split_slides(open(f"sections/{fname}.qmd", encoding="utf-8").read())]


def render(title, intro, sessions):
    """sessions: [(session heading, [(block name, [parsed slides])])]"""
    out = [f"# {title}", "", intro, "", "---", ""]
    for s_i, (session, blocks) in enumerate(sessions):
        if s_i:
            out += ["---", ""]
        out += [f"## {session}", "", "---", ""]
        for name, items in blocks:
            out += [f"### {name} ({items[0]['start']}–{items[-1]['end']})", "", "---", ""]
            for sl in items:
                tag = " [INTERACTION]" if sl["interaction"] else ""
                out += [f"**{sl['title']} — {sl['start']}–{sl['end']}**{tag}", ""]
                say = sl["say"]
                prov = PROVENANCE.search(say)
                if prov:
                    say = PROVENANCE.sub("", say).strip()
                if say:
                    out += [say, ""]
                if prov:
                    out += [f"*Instructor-only provenance:{prov[1]}*", ""]
                if sl["context"]:
                    out += [f"*(Context not yet revealed: {sl['context']})*", ""]
                if sl["id"] in EXTRAS:
                    out += [EXTRAS[sl["id"]], ""]
                out += ["---", ""]
    out += ["*End of narrative.*", ""]
    return "\n".join(out)


INTRO = "*Verbatim script extracted from all `:::notes` blocks. Slides are listed in presentation order with elapsed time. Interaction slides are marked* **[INTERACTION]***.*"

if __name__ == "__main__":
    sessions = [(name, [(b, [sl for f in files for sl in slides(f)]) for b, files in blocks])
                for name, blocks in SESSIONS]
    text = render("Applied Statistics Workshop — Full Instructor Narrative", INTRO, sessions)
    open("narrative.md", "w", encoding="utf-8").write(text)
    print("narrative.md rebuilt")
