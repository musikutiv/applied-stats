"""Re-chain slide timestamps in speaker notes: each slide starts when the
previous one ends; durations are kept. Run from the project root."""
import re

SESSIONS = {
    "S1": ["_01-my-experiment", "_02-question", "_03-sample-to-claim",
           "_03b-response-and-break", "_04-read-the-data",
           "_05-effect-and-uncertainty", "_06-null-model"],
    "S2": ["_s2-01-power-and-design", "_s2-02-multiplicity",
           "_s2-03-tests-from-design", "_s2-04-common-issues",
           "_s2-05-final-workshop"],
}
PAT = re.compile(r"Time: (\d\d):(\d\d)–(\d\d):(\d\d) \((\d+) (minutes?)\)")


def fmt(m):
    return f"{m // 60:02d}:{m % 60:02d}"


for sess, files in SESSIONS.items():
    t = 0
    for f in files:
        path = f"sections/{f}.qmd"
        text = open(path, encoding="utf-8").read()

        def rep(m):
            global t
            d = int(m[5])
            new = f"Time: {fmt(t)}–{fmt(t + d)} ({d} {m[6]})"
            t += d
            return new

        open(path, "w", encoding="utf-8").write(PAT.sub(rep, text))
    print(sess, "ends", fmt(t))
