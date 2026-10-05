"""Build the CRC205 one-afternoon version (13:30–18:30) from the main slides.

Part 1 13:30–15:30 · break 15:30–16:00 · Part 2 16:00–18:30.
Slides are copied from sections/*.qmd by id, so fixes to the main deck
reach CRC205 when this script is re-run. Clock times replace elapsed time.

Run from the project root:  python3 scripts/build_crc205.py
then:                        quarto render crc205.qmd
"""
import re
import sys

sys.path.insert(0, "scripts")
from build_narrative import split_slides, parse_slide, render  # noqa: E402

SECTION_FILES = ["_01-my-experiment", "_02-question", "_03-sample-to-claim",
                 "_03b-response-and-break", "_04-read-the-data",
                 "_05-effect-and-uncertainty", "_06-null-model",
                 "_s2-01-power-and-design", "_s2-02-multiplicity",
                 "_s2-03-tests-from-design", "_s2-04-common-issues",
                 "_s2-05-final-workshop"]

START, BREAK_START, BREAK_END, END = "13:30", "15:30", "16:00", "18:30"

PART1 = [
    ("1 · My experiment", ["is-my-result-real", "six-of-what", "what-did-we-do", "assignment-unit",
                           "what-is-n", "replication", "data-points-concept", "independence",
                           "day-layout", "confounding"]),
    ("2 · Question and claim", ["claim", "target-quantity", "sample-population",
                                "population-question", "response-unit"]),
    ("3 · Reading the data", ["data-look", "six-changes", "mean-and-median", "variance-and-sd",
                              "paired-or-box", "describe-result"]),
    ("4 · Effect and uncertainty", ["one-sample-estimate", "new-preparations-new-mean",
                                    "sampling-distribution", "sd-versus-se", "estimate-the-se",
                                    "from-se-to-interval", "meaning-of-confidence", "report-se-not-sd"]),
    ("5 · p-values", ["could-this-arise", "build-null-distribution", "our-paired-t",
                      "two-sided-p-value", "interpret-p-value", "alpha-type-one",
                      "threshold-neighbours", "p-not-effect"]),
]
PART2 = [
    ("6 · Power and design", ["p09-advice", "specified-effect", "same-biology", "power-as-frequency",
                              "no-effect-fallacy", "power-factors", "minimum-relevant-effect",
                              "pairing-design", "six-more-wells", "planning-sensitivity",
                              "advice-revisited"]),
    ("7 · Many outcomes, many choices", ["one-among-twenty", "twenty-chances", "define-family",
                                         "twenty-thousand", "introduce-fdr", "fwer-versus-fdr",
                                         "what-else-tried", "one-sided-after-peeking",
                                         "explore-then-confirm", "selective-reporting"]),
    ("8 · The design chooses the analysis", ["test-name-late", "rows-and-units", "metadata-matters",
                                             "same-columns-different-design", "paired-design-power",
                                             "four-doses", "genotype-interaction", "simple-design-power",
                                             "timecourse-problem", "timecourse-analysis", "hundred-cells",
                                             "normality-gate", "extreme-observation"]),
    ("9 · Figures", ["log-scale-multiplicative", "truncated-axis", "wide-range-log", "log-measurements",
                     "error-bars-which", "honest-figure"]),
    ("10 · Workshop: compound R", ["r-lab-meeting", "r-information-first", "r-hierarchy", "r-exclusion",
                                   "r-all-days", "r-reanalysis", "r-cytokines", "r-claim", "less-exciting",
                                   "r-redesign", "r-one-redesign", "r-what-changed", "plan-before-pipetting",
                                   "r-real", "key-messages-recap", "course-landing"]),
]

BREAK_SLIDE = """## Break {#crc-break .break-slide}

<p class="big">30-minute break</p>
<p class="small keyline">Then: is the experiment big enough — and what happens with many outcomes?</p>

::: notes
**Time: 15:30–16:00 (30 minutes).**

**Say:** Pause for the full 30 minutes and resume at 16:00. Any time left before 15:30 is buffer for questions from the first part. Do not use the break to add teaching content.

**Conceptual point:** Preserve the break and attention for the second part.

**Likely misconception:** The scheduled break is optional overflow time.

**Optional follow-up:** No audience task during the break.

**Sources:** CRC205 schedule: 13:30–15:30, break, 16:00–18:30.
:::"""

TIME = re.compile(r"\*\*Time: \d\d:\d\d–\d\d:\d\d \((\d+) (minutes?)\)\.\*\*")


def to_min(hhmm):
    h, m = map(int, hhmm.split(":"))
    return h * 60 + m


def clock(m):
    return f"{m // 60:02d}:{m % 60:02d}"


# CRC205-specific wording where a slide referred to a dropped slide or break.
SLIDE_EDITS = {
    "response-unit": [
        ("Use the five minutes before the planned break to connect", "Use these five minutes to connect"),
        (" No result is revealed until after the break.", " The data follow on the next slide."),
        ("Bridge completes the population block before the break.", "Bridge from design to data."),
    ],
    "could-this-arise": [
        ("Reconnect to the unanswered question.",
         "Pose the question: suppose there were no average treatment effect — how unusual would our estimate be?"),
    ],
}


def adapt(sid, text):
    """Wording changes for a single afternoon instead of two sessions."""
    for old, new in SLIDE_EDITS.get(sid, []):
        if old not in text:
            sys.exit(f"CRC205 edit for {sid} no longer matches: {old!r}")
        text = text.replace(old, new)
    return text.replace("Session 1", "Part 1").replace("Session 2", "Part 2")


def main():
    bank = {}
    for f in SECTION_FILES:
        for raw in split_slides(open(f"sections/{f}.qmd", encoding="utf-8").read()):
            bank[parse_slide(raw)["id"]] = raw

    out, narrative_parts, t = [], [], to_min(START)
    for part, blocks, limit in (("PART 1 (13:30–15:30)", PART1, BREAK_START),
                                ("PART 2 (16:00–18:30)", PART2, END)):
        if part.startswith("PART 2"):
            out.append(BREAK_SLIDE)
            t = to_min(BREAK_END)
        nblocks = []
        for name, ids in blocks:
            items = []
            for sid in ids:
                raw = bank[sid]

                def stamp(m):
                    nonlocal t
                    d = int(m[1])
                    s = f"**Time: {clock(t)}–{clock(t + d)} ({d} {m[2]}).**"
                    t += d
                    return s

                raw = adapt(sid, TIME.sub(stamp, raw, count=1))
                out.append(raw)
                items.append(parse_slide(raw))
            nblocks.append((name, items))
        slack = to_min(limit) - t
        if slack < 0:
            sys.exit(f"{part} overruns by {-slack} min")
        print(f"{part}: content ends {clock(t)}, {slack} min buffer")
        narrative_parts.append((part, nblocks))

    open("sections/_crc205-generated.qmd", "w", encoding="utf-8").write(
        "<!-- Generated by scripts/build_crc205.py. Do not edit; edit the main sections instead. -->\n\n"
        + "\n\n".join(out) + "\n")

    intro = ("*CRC205 · one afternoon, 13:30–18:30 (Part 1 13:30–15:30, break 15:30–16:00, Part 2 16:00–18:30). "
             "Verbatim script extracted from the speaker notes; times are clock times. Interaction slides are marked* "
             "**[INTERACTION]***. Unused minutes at the end of each part are buffer for discussion.*")
    narrative_parts.insert(1, ("BREAK (15:30–16:00)", [("Break", [parse_slide(BREAK_SLIDE)])]))
    text = render("CRC205 — Applied Statistics for Life Scientists · Instructor Narrative", intro, narrative_parts)
    open("narrative-crc205.md", "w", encoding="utf-8").write(text)
    print(f"{len(out)} slides written to sections/_crc205-generated.qmd; narrative-crc205.md rebuilt")


if __name__ == "__main__":
    main()
