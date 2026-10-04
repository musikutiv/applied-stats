# Revision Notes

## Terminology

- **vessel → tube** (done, 2026-10-04): Replaced throughout all `.qmd` files and `styles/course.css`.
  CSS classes renamed `.vessel`/`.vessels` → `.tube`/`.tubes`.

---

## Design inconsistencies — fixed (2026-10-04)

| # | File | Issue | Fix |
|---|------|-------|-----|
| 1 | `_05-effect-and-uncertainty.qmd` | SE shown as `5.0` on formula slide, then `4.96` two slides later (both are roundings of 4.958) | Changed formula slide to `4.96` throughout |
| 2 | `_s2-03-tests-from-design.qmd` line 87 | Independent-cultures slide used `a.u.` while rest of presentation uses `U/mg` | Changed to `U/mg` |
| 3 | `_s2-03-tests-from-design.qmd` line 112 | Fine-print CI showed `−23.2 to 2.3` (missing `+`) and `a.u.` instead of `U/mg` | Fixed to `−23.2 to +2.3 U/mg` |
| 4 | `_s2-04-final-workshop.qmd` (9 places) | `(1 minutes)` — grammar | Changed to `(1 minute)` |
| 5 | `_s2-04-final-workshop.qmd` lines 3, 62 | Trailing space in `class="data-plot workshop-plot "` | Removed trailing space |

---

## Design inconsistencies — open (need editorial decision)

### 1. Session 1 overruns by 25 minutes

Session 1 ends at **03:25**; target is 03:00. Session 2 ends cleanly at 03:00.

The overrun is in the final two blocks:
- `_05-effect-and-uncertainty.qmd`: 02:15–02:50 (35 min)
- `_06-null-model.qmd`: 02:50–03:25 (35 min)

To bring Session 1 to 3:00, 25 minutes must be cut or moved. Candidates (from the earlier review):
- The t-distribution explainer slide (`#why-t-five`, 2 min) — could be cut or merged
- The Type I error decision-grid (`#alpha-type-one`, 3 min) — could be compressed
- The p = 0.049 vs 0.051 slide is high-value, keep
- Several 3-min descriptive stats slides in `_04` could be compressed by 1 min each

### 2. `.interaction` slides missing `.prompt-tag` — resolved (2026-10-04)

Added prompt-tags to all 27 `.interaction` slides that lacked one. Three workshop slides
(`#r-information-first`, `#r-exclusion`, `#r-real`) were left without a separate prompt-tag
because each already has a `<p class="question">` element that serves the same visual role.

Also noted: `#power-factors` in `_s2-01` has a prompt-tag but lacks the `.interaction` class,
so it won't show the teal top-border. Low priority but consistent to add `.interaction` there.

### 3. Orphaned `.synthesis` class on one slide heading

`_03-sample-to-claim.qmd:47`: `## What must we know before drawing an inference? {#before-inference .synthesis}`

The `.synthesis` class has no CSS rules (only `.synthesis-grid` does). All other synthesis-pattern slides don't carry it. Either remove it or define a visual style for it and apply consistently.

---

## Content review notes (from 2026-10-04 review)

### Strengths
- Consistent running example (L1 assay / compound Q) throughout both sessions
- Strong opening ("triplicate" ambiguity)
- Exploration vs confirmation handled with nuance
- Pairing advantage concretely demonstrated (SE 9.6 → 4.2 U/mg)
- Final workshop (compound R) is a strong integrative exercise
- Facilitation notes are high quality

### Areas to address in next revision
- **"Paired t-test as the primary tool" message is implicit** — add one explicit framing sentence (e.g. at `#pairing-design`)
- **Session 2 Block 3 (`_s2-03`) is too dense** for the stated audience — consider cutting/merging Mann-Whitney (2 slides) and the normality-gating critique (2 slides)
- **Confidence interval / null model sequence at end of Session 1** is cognitively demanding after 2.5 hours — fatigue risk
- **Instructor notes sometimes too long for live delivery** — some "Say:" sections could be trimmed to 3 sentences
