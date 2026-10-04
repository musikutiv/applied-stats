> Completed Session 2: 03:00 including the 15-minute break, with the final redesign workshop and course landing. See FINAL_WORKSHOP_NOTES.md and workshop-design-canvas.html. Earlier scope descriptions below document preceding stages.

# Scope update

This records the retained 50-minute opening. Session 2 now continues through the multiplicity block; see SESSION2_MULTIPLICITY_NOTES.md for current scope and break timing.

# Session 2 opening: power and prospective design

**Scope:** 18 core slides, 50 minutes, in `session-2.qmd` and `sections/_s2-01-power-and-design.qmd`. Session 1's source, sections and rendered HTML are unchanged (SHA-256 comparison). Shared configuration now renders either presentation; Session 2 uses an additional CSS file so its layout adjustments do not change Session 1.

The opening asks “My p-value is 0.09. What should I do?” The final slide asks about 20 outcomes and one p<0.05, then stops. No multiple-testing explanation or correction is built.

## Timing

| Slides | Content | Minutes | Elapsed |
|---|---|---:|---|
| 1–3 | Advice, possible explanations, specified −14 population | 8 | 00:00–00:08 |
| 4–6 | Contrasting repetitions, power frequency, Type II error | 8 | 00:08–00:16 |
| 7–9 | Actual uncertainty, four power factors, relevant effect | 11 | 00:16–00:27 |
| 10–13 | Variation, independent N, pairing, six assay wells | 11 | 00:27–00:38 |
| 14–16 | Planning inputs, sensitivity, revised advice | 9 | 00:38–00:47 |
| 17–18 | Synthesis and unanswered bridge | 3 | 00:47–00:50 |

Interaction time is included. Every slide has delivery notes, conceptual point, misconception and optional follow-up. The four factor curves appear sequentially with a prediction before each. The simulation result appears before the term power.

## Simulation and numerical results

- Seed **20261007**, 10,000 repetitions, six preparation pairs each. The original generator is called unchanged: mean −14 U/mg, biological effect SD 9, vessel SD 3, technical SD 2.5, three assay readings per vessel, two-decimal rounding, fixed additive shared day shifts. No treatment-by-day response variation is assumed.
- Each repetition uses a paired t analysis of the six differences, its own estimated SD and two-sided alpha 0.05. There are 7,800 rejections: empirical power 78%, beta 22%. The ideal normal-model calculation is 76.9149%; the finite simulation differs by about 1.1 percentage points (Monte Carlo SE about 0.4 percentage points). No seed was searched to obtain a desired result.
- The two illustrative outcomes are deliberately selected: the first rejection (repeat 1: mean −16.4, CI [−28.5,−4.3], p=.018) and the first non-rejection (repeat 8: mean −9.5, CI [−19.2,+0.3], p=.054). Selection is disclosed on the slide. These examples illustrate contrasting outcomes; frequencies use all repetitions. The decision grid uses the unselected first 100.
- The original observed mean −10.4, interval [−23.2,+2.3] and p=.090 remain unchanged. No observed-power calculation or retrospective false-negative probability is made.
- Paired-difference SD before rounding is sqrt(9² + 2×3² + 2×2.5²/3) = 10.1571 U/mg. At n=3,6,12,24, expected SE is 5.86,4.15,2.93,2.07 U/mg. Doubling N reduces SE by about 29%, not 50%.
- Factor curves use the noncentral t distribution and include both rejection tails. One factor changes at a time. The biological-variability curve varies the preparation-effect SD while retaining vessel and technical variation. Alpha is a prospective choice, never a suggested repair to the observed result.
- The sensitivity grid uses illustrative effect magnitudes 6/10/14 and SDs of paired changes 8/12/16. With two-sided alpha .05 and target .80, minimum integer pair counts are respectively [16,8,5], [34,14,8], [58,23,13] for the three SD rows. Both .80 and .05 are conventions for illustration, not universal requirements. Ns count completed pairs, with no attrition or logistical block allowance. The effect values are not validated biological relevance thresholds.

## Design and resource comparisons

The design figure compares six paired split preparations with twelve unrelated preparations (six per condition). Both have 12 culture vessels, 36 assay readings and conditions balanced over days. This isolates the benefit of removing a meaningful shared baseline, rather than comparing a valid design with a deliberately confounded one. Unrelated cultures retain baseline SD 15 in the treatment contrast; seed 20261008 gives SE about 9.61 versus 4.16 U/mg for matching. The figure compares precision, not alternative-test power or a test catalogue. Matching is not claimed universally optimal; covariance, meaningful pairs and costs matter.

“Six additional wells” is explicitly six **assay wells**. Option A adds one technical reading to each vessel in three existing pairs (36→42 readings). Option B adds one new independent preparation pair with three readings per vessel (36→42). Under this model the SE is 99.7% versus 92.6% of baseline. This is a variance/precision comparison, not a t-power calculation for the unequal technical-count option. The biological option also needs new culture work; equal assay-well counts do not imply equal total resources. Technical replication can improve measurement precision and diagnose reliability, but creates no new biological units.

## Limits and pedagogical decisions

- All calibration is conditional on independent, approximately normal paired changes and a correct design/model. A source comment flags that six real observations cannot verify those assumptions. High power is not a replication guarantee; low planned power does not automatically invalidate a significant result.
- The initial suggestions are elicited without judgment, then revisited as prospective improvements versus threshold-driven changes. Justified method corrections and established QC exclusions are distinguished from changing choices solely for significance.
- Minimum relevant effect and credible SD remain biological/planning judgments. No single recommended N is supplied. The grid estimates the probability of rejecting zero if an effect of the stated magnitude exists; it does not establish that an observed effect exceeds the relevance threshold.
- The four-factor sequence has four minutes. If discussion is slow, prioritize the audience predictions over detailed curve reading; preserve the distinction between prospective evaluation and interpretation of the actual result.
- Source ideas follow the approved sections 7–8 and review register, including correction of the old beta/power reversal and overgeneralized pairing claims. Calculation was checked against the official [R power.t.test documentation](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/power.t.test.html), using `strict=TRUE` for the two-sided comparison.

## Reproduce and check

`Rscript scripts/generate_power.R` exports data and PNGs. `Rscript scripts/check_power.R` checks original-data preservation, reproduction, every simulation p/CI, selection disclosure, analytic agreement with R, minimal integer Ns, and precision/design/resource calculations. `quarto render session-2.qmd` creates the standalone HTML without running R. See `instructor/session-2-validation.json` for render and browser validation.

Final validation: Quarto rendered successfully; all 18 slides were reviewed through the local HTTP preview. No layout overflow, broken images, audience code or browser errors were found. Power terminology and four-factor reveals were checked in forward order. Final figure-label corrections were re-inspected. Source timing is continuous from 00:00 to 00:50. Session 1 source and HTML hashes remained unchanged.
