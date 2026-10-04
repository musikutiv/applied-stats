# Course outline: 2 × 3 hours

All timings include questions and activities. Each session includes a 15-minute break. Source abbreviations: **A** = AppliedStats_2026.pdf; **R** = Stats_PhD_MR_CVS_2024.pdf; **D** = DoctaMed.pdf. Page references are physical PDF pages, starting at 1. Reuse is subject to the review register in CONTENT_MAP.md.

## Delivery constraint

Every demonstration below uses figures and visual sequences prepared in advance. Neither instructor nor participants run R during the sessions. Audience-facing slides and handouts contain no code, console output, code-folding controls or code appendix. Exercises involve interpretation, discussion and experimental design. Simulation and sample-size scenarios are precomputed; the instructor reveals their results in the slides.

## Timetable

### Session 1 — What can I claim from this experiment?

| Elapsed time | Section | Minutes | Core slides |
|---|---|---:|---:|
| 00:00–00:35 | 1. My experiment: what is N? | 35 | 7 |
| 00:35–00:55 | 2. What question was it meant to answer? | 20 | 4 |
| 00:55–01:20 | 3. From my samples to a general claim | 25 | 5 |
| 01:20–01:35 | Break | 15 | 0 |
| 01:35–02:10 | 4. What do my data actually say? | 35 | 7 |
| 02:10–02:50 | 5. Effect and uncertainty | 40 | 8 |
| 02:50–03:00 | Exit task and discussion | 10 | 1 |
| **Total** | **165 learning + 15 break** | **180** | **32** |

### Session 2 — What should I do next?

| Elapsed time | Section | Minutes | Core slides |
|---|---|---:|---:|
| 00:00–00:10 | Retrieval and return to the assay | 10 | 2 |
| 00:10–00:40 | 6. Could this happen if there were no effect? | 30 | 7 |
| 00:40–01:05 | 7. Why didn't it reach significance? | 25 | 5 |
| 01:05–01:20 | 8. Design beats rescue statistics: diagnose | 15 | 3 |
| 01:20–01:35 | Break | 15 | 0 |
| 01:35–01:55 | 8. Design beats rescue statistics: improve | 20 | 4 |
| 01:55–02:25 | 9. I looked at many things and found something | 30 | 7 |
| 02:25–03:00 | 10. Design the next experiment | 35 | 4 |
| **Total** | **165 learning + 15 break** | **180** | **32** |

## Section specifications

### 1. My experiment: what is N? — 35 minutes / 7 slides

- **Motivating problem:** An assay has 36 readings. Does it have 36 independent treatment replications?
- **Concepts:** treatment/control, endpoint, assignment unit, observation unit, biological versus technical replication, independence, pairing, batch and confounding.
- **Learning outcome:** Draw the preparation → vessel → lysate → reading hierarchy and report 12 assigned vessels, six paired biological contrasts and 36 technical readings with appropriate qualifications.
- **Candidate material:** A pp. 12, 17, 68, 73–74, 121–122; R pp. 4–8, 13, 53; D pp. 5–7, 21–22.
- **New material:** explicit assay protocol, simulated data dictionary, staged provenance reveal and a fully confounded alternative plate/day layout.
- **Demonstration/exercise:** 10 minutes to annotate the experiment in pairs and vote on N; 5 minutes to compare layouts. Ask “What does this control control for?” and “Are these observations independent?” Explain that vehicle controls do not by themselves exclude every mechanism or measurement artifact.
- **Remaining time:** 20 minutes for opening, explanation and debrief. Do not compute a p-value yet.

### 2. What question was it meant to answer? — 20 minutes / 4 slides

- **Motivating problem:** An observed difference has become a much broader biological claim after the experiment.
- **Concepts:** observation → question → hypothesis/model → prediction → experiment; endpoint as a proxy; estimand; exploratory versus confirmatory work.
- **Learning outcome:** State a testable prediction and an effect quantity, and distinguish a discovery from independent confirmation of it.
- **Candidate material:** R pp. 4, 10–11, 66–70; A p. 189; D pp. 19–21, 52.
- **New material:** a claim-to-prediction worksheet for the assay; explicit contrast direction, incubation time and assay scale.
- **Demonstration/exercise:** 7 minutes to rewrite “the compound works” into a scoped question and prediction. Ask which choices were made before seeing the observations.
- **Remaining time:** 13 minutes for the scientific cycle and debrief. Exploration is valuable; findings selected in exploration require appropriately designed confirmation.

### 3. From my samples to a general claim — 25 minutes / 5 slides

- **Motivating problem:** Repeated cultures of one cell line are being used to support a claim about all patients or all cell types.
- **Concepts:** sample, target population, accessible sampling space, representativity, biological replication, reproducibility and generalizability.
- **Learning outcome:** Name the population actually addressed and one missing source of variation needed for a broader claim.
- **Candidate material:** R pp. 16–33, 45–47; A pp. 54–58, 63, 71; D pp. 9–20.
- **New material:** a culture/preparation/day/donor/laboratory map and three progressively broader claim cards.
- **Demonstration/exercise:** 8 minutes to choose which claim the assay supports and what new sampling would be needed. Ask “What exactly is the population?”
- **Remaining time:** 17 minutes for discussion and synthesis. Random treatment allocation and random sampling solve different problems; larger N cannot repair a systematically restricted sampling frame.

### 4. What do my data actually say? — 35 minutes / 7 slides

- **Motivating problem:** A bar chart hides preparation differences, pairing and a suspicious technical reading.
- **Concepts:** raw observations, distributions, mean/median, quantiles, variance, SD, IQR, outliers, metadata and summary statistics.
- **Learning outcome:** Choose a plot that preserves the experimental structure and explain what a summary hides.
- **Candidate material:** A pp. 25–41, 50, 65–80, 123; D pp. 7–8.
- **New material:** linked technical-reading and preparation-summary plots with batch colours; one distribution/spread panel; a documented QC scenario.
- **Demonstration/exercise:** 10 minutes to compare raw plots with bars and propose a handling rule for a suspect reading. Ask “What does the plot tell you before we calculate anything?”
- **Remaining time:** 25 minutes for demonstration and debrief. Do not delete a point simply because it is extreme. Distinguish sample variance (n−1 denominator) from a descriptive population variance; no hand-calculation drill.

### 5. Effect and uncertainty — 40 minutes / 8 slides

- **Motivating problem:** The assay difference is visible, but its precision and biological meaning remain unclear.
- **Concepts:** mean paired difference, ratio/fold change, log transformation, sampling variability, SE, confidence intervals; spread versus precision.
- **Learning outcome:** Report an effect and its interval on a stated scale and explain repeated-sampling coverage without assigning a 95% probability to the fixed parameter in the observed interval.
- **Candidate material:** A pp. 11, 56–62, 67, 75–80, 136–141; R pp. 37–44; D pp. 10–17, 35.
- **New material:** repeated simulation of independent preparation pairs; interval-coverage figure; paired contrast plot; positive-data log-ratio inset. Label all simulation assumptions.
- **Demonstration/exercise:** 10 minutes predicting how technical repeats versus new preparations change precision, plus 5 minutes translating a log ratio back to a fold change.
- **Remaining time:** 25 minutes for explanation and debrief. Use a paired t interval for the simplified approximately normal independent contrasts; avoid presenting it as a cure for dependence or biased sampling.

### Session 1 exit — 10 minutes / 1 slide

- **Problem/concepts:** How should the assay result be communicated? Integrate unit, claim, effect and uncertainty.
- **Outcome:** A three-sentence result stating contrast, effect/CI, replication structure and population limitation.
- **Candidates:** A pp. 50, 69, 81, 136; D p. 53.
- **New material/exercise:** one results template; 6 minutes individual writing and 4 minutes discussion. Instructor checks for pseudo-replication and CI misconceptions.

### Session 2 retrieval — 10 minutes / 2 slides

- **Problem/concepts:** Recover the experiment and the interpretation of its interval before adding a testing decision.
- **Outcome:** Explain why 36 readings do not give 36 independent contrasts, and distinguish SD from SE.
- **Candidates:** A pp. 62, 73, 121–122; R p. 40.
- **New material/exercise:** 4-minute retrieval poll using the same case, followed by a 6-minute debrief and return to the effect plot.

### 6. Could this happen if there were no effect? — 30 minutes / 7 slides

- **Motivating problem:** The observed contrast may reflect sampling variation under a no-effect model.
- **Concepts:** null hypothesis, test statistic, null distribution, p-value, alpha, Type I error, CI/test relationship.
- **Learning outcome:** Interpret a p-value conditionally on the null and model assumptions; distinguish it from the probability that the null is true or that the result is “just chance.”
- **Candidate material:** A pp. 89–99, 106–114, 136, 142–146; R pp. 50–55; D pp. 30–39.
- **New material:** simulated null distribution of a standardized mean paired contrast, observed statistic and two tails; claim-sorting cards.
- **Demonstration/exercise:** 8 minutes sorting correct and incorrect interpretations; simulate the null with the same pairing structure rather than shuffling all technical readings.
- **Remaining time:** 22 minutes for explanation and debrief. Introduce the paired t-test as the named tool for this case. A genuinely independent-group variant motivates Welch's test. State that matching two-sided tests and 95% CIs agree at alpha 0.05 when based on the same procedure; separate group intervals are not the interval for their difference.

### 7. Why didn't it reach significance? — 25 minutes / 5 slides

- **Motivating problem:** An inconclusive assay is being described as proof that the compound has no effect.
- **Concepts:** Type II error, power at a specified alternative, relevant effect, between-preparation variation, independent N, precision.
- **Learning outcome:** Distinguish an interval allowing important effects from an interval narrow enough to exclude prespecified important effects; identify factors governing prospective power.
- **Candidate material:** A pp. 92–95, 99, 147–148, 161–164; R pp. 56–58; D pp. 37–42.
- **New material:** three effect/interval scenarios and a power plot varying relevant effect, SD of paired differences and number of pairs.
- **Demonstration/exercise:** 8 minutes choosing among more technical repeats, more independent pairs and better blocking for a stated variance scenario. Ask what each choice can improve.
- **Remaining time:** 17 minutes for explanation/debrief. Do not calculate observed post-hoc power. A negligible-effect claim requires a prespecified relevance range and suitable interval/equivalence reasoning, not p > 0.05 alone.

### 8. Design beats rescue statistics — 35 minutes / 7 slides, split around break

- **Motivating problem:** Day effects and avoidable measurement variation make the answer less clear; treatment/day confounding can make it unidentifiable.
- **Concepts:** randomization, blocking, pairing, blinding, prospective exclusions, allocation balance, biological replication, power/sample-size planning.
- **Learning outcome:** Propose a blocked allocation and justify a candidate number of independent pairs using explicit planning assumptions.
- **Candidate material:** A pp. 137–144, 187–192; R pp. 8, 47, 59–62; D pp. 45–46, 52.
- **New material:** allocation cards, additive batch simulation and a small prospective planning table with plausible low/central/high SD scenarios. Any relevance threshold is an illustrative teaching assumption to be replaced by biological judgment.
- **Demonstration/exercise:** before break: 7-minute layout diagnosis + 8-minute explanation. After break: 8-minute redesign exercise + 12-minute planning demonstration/debrief.
- **Planning inputs:** relevant mean difference, SD of paired differences, two-sided alpha, target power, number of independent pairs, expected attrition and feasible costs. Show sensitivity to uncertain pilot SD and round required N upward. Account for clustering if pairs are not independent.
- **Boundary:** pairing can improve precision when it removes useful shared variation; it is not automatically superior for every covariance structure. More technical repeats do not replace biological replication.

### 9. I looked at many things and found something — 30 minutes / 7 slides

- **Motivating problem:** One promising endpoint was selected from many assays, comparisons, exclusions or interim looks.
- **Concepts:** multiplicity, analysis flexibility, selective reporting, sequential testing, FWER, Bonferroni/Holm, FDR and Benjamini–Hochberg; discovery versus confirmation.
- **Learning outcome:** Identify the family of claims and choose whether protection against any false rejection or expected false-discovery proportion fits the scientific objective.
- **Candidate material:** A pp. 78–80, 167–173, 178–184; R pp. 63–70; D p. 44.
- **New material:** repeated 20-endpoint all-null simulation; a mixed null/non-null omics-style panel; one comparison of unadjusted, Holm and BH results; a stopping-rule cartoon.
- **Demonstration/exercise:** 8 minutes deciding the claim family and error criterion for a confirmatory assay versus a discovery screen.
- **Remaining time:** 22 minutes for demonstration and debrief. Give Bonferroni's alpha/m rule; introduce Holm as a step-down FWER method and BH as an FDR method without manual algorithm practice. FDR is an expectation over repeated experiments, not a guarantee about this one list. State dependence conditions in notes. An ANOVA omnibus test does not authorize unlimited unadjusted follow-up comparisons. Ordinary fixed-sample tests do not justify repeated optional looks.

### 10. Design the next experiment — 35 minutes / 4 slides

- **Motivating problem:** The lab needs a defensible next step, not a more flattering analysis of the old data.
- **Concepts:** integrate question, estimand, population, unit, endpoint, variation, allocation, N and prospective analysis/reporting.
- **Learning outcome:** Produce and defend a one-page design with a clear path from question to evidence.
- **Candidate material:** A pp. 3, 189–192; R pp. 47, 62, 73–75; D pp. 45, 52–53.
- **New material:** one-page design canvas, a worked facilitator answer and a peer-review rubric.
- **Exercise:** 3-minute brief, 15-minute small-group redesign, 8-minute peer challenge, 7-minute debrief, 2-minute individual commitment. Use the recurring assay or a participant's own experiment if its structure can be stated quickly.
- **Required output:** question/prediction; estimand and meaningful effect; population and limits; endpoint/time; assignment unit and independent replication; batches and other variation; randomization/blocking/blinding; N rationale; exclusions/missingness/stopping rule; prespecified analysis, multiplicity and reporting plan.
- **Success criteria:** no technical pseudo-replication; claim matches sampling; allocation supports the contrast; N assumptions are explicit; analysis respects the design; exploration is labelled. End with “What would you change if you repeated the experiment?”

## Pacing protection

The 64-slide target is a ceiling for the core narrative, not a demand to fill every slot with text. Include opening and exercise slides in the stated counts. Keep backup explanations outside the timed route. If running late, reduce ratio arithmetic and multiplicity algorithm detail; do not consume the break or capstone. Questions beyond the six-hour scope go into a follow-up list.
