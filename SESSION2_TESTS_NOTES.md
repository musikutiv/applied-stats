> Completed Session 2: 03:00 including the 15-minute break, with the final redesign workshop and course landing. See FINAL_WORKSHOP_NOTES.md and workshop-design-canvas.html. Earlier scope descriptions below document preceding stages.

# Analysis follows the experiment

## Scope and timing

18 core slides add 45 minutes, from 01:50 to 02:35. Session 2 now has 54 core slides plus the existing break screen. The 01:20–01:35 break and preceding 110 minutes are unchanged. A 25-minute workshop would finish at 03:00 (a 20-minute version would leave five minutes for closing). The workshop is not built.

The final retrieval and workshop bridge share one slide, reducing the requested 19 conceptual steps to 18 screens without omitting a topic. Predictions precede method labels on the independent/paired examples, ANOVA introduction, interaction, and normality-gate discussion. Protect the final three-minute retrieval and three-minute analysis checklist. The compact orientation table is a reference, not a reading exercise or decision tree.

| New screens | Content | Elapsed |
|---|---|---|
| 38–41 | Missing information, quantity, outcome, independent information | 01:50–01:59 |
| 42–44 | Welch, pairing, same values under different designs | 01:59–02:08 |
| 45–47 | Multiple means, contrasts, interaction | 02:08–02:16 |
| 48–52 | Clustering, normality gate, mean assumptions, ranks, extreme values | 02:16–02:27 |
| 53–55 | Analysis framework, orientation, retrieval and workshop bridge | 02:27–02:35 |

## Examples and reproduction

Run `Rscript scripts/generate_tests.R`, then `quarto render session-2.qmd`. R runs offline only. All generated figures are exported PNGs embedded in the HTML; no audience code or software UI is included. Data and numerical results are saved in `data/tests/`. Seed: 20261011. Random draws are consumed in the script's declared order.

- **Independent cultures:** eight per group, normal populations with means 100/control and 85/Q, SDs 10 and 17. Randomized assignment is a teaching design assumption. Observed Q−control is −11.1222, Welch 95% CI [−24.9487, 2.7043], p=.1050603. Group bars are means, not intervals.
- **Original L1 pairing:** unchanged technical measurements are averaged per vessel, then differenced within preparation. Six paired changes give mean −10.4067, CI [−23.1516, 2.3382], p=.08987058. Shared day effects cancel under the original simplified additive model; uncancelled day dependence would need another model/design.
- **Same values, different design:** reusing these numbers under a counterfactual unrelated-culture design gives a Welch interval [−33.6190, 12.8057]. This is not an alternative analysis to choose for the actual paired experiment. The point estimate is identical; positive within-pair association improves precision here, not universally.
- **Doses:** four independent groups, eight cultures each, normal means 100/96/88/76 and common SD 9. Raw observations and mean bars motivate the group linear model. No omnibus p-value is needed to choose a scientific contrast. Multiplicity is not automatically removed by fitting one model.
- **Genotype × treatment:** eight independent cultures per design cell, normal SD 8; generator means WT control/Q=100/75, knockout control/Q=100/96. Fitted WT Q effect −27.8760, knockout Q effect −4.8497; difference of effects +23.0263. This illustrates interaction on the additive activity scale; separate significance labels are not compared. Genotype mechanism claims would require appropriate backgrounds and design beyond this simulation.
- **Extreme value:** constructed activities 91,95,97,99,101,102,105,164. No observation is deleted or test selected. Its unknown provenance is the audience's investigative task.

The generator checks Welch's statistic against a direct variance/SE calculation, verifies paired-test equivalence to the one-sample differences test, and checks interval ordering. `scripts/check_tests.R` supplies additional reproducibility, model and interval checks.

## Statistical boundaries

Welch is the default t procedure for independent groups here; ordinary homoscedastic linear-model standard errors are not silently substituted for it. Paired inference is about the independently replicated differences. Normality of those differences gives the exact small-sample t reference; Welch's unequal-variance reference is approximate. Robustness beyond normal populations depends on the sample/design and distribution, with no universal minimum-N rule. A normality-test p-value neither verifies normality nor establishes independence, and plots cannot prove assumptions.

Classical group ANOVA is presented as a linear-model restriction on means, with its equal-error-variance assumption discussed in notes. Specific contrasts and their family follow scientific intent. Planned contrasts need not be chosen only after an omnibus test. Interaction is explicitly a difference of effects on a chosen scale.

Mann–Whitney uses ranks with an identical-distributions null in its usual independent-sample formulation. Its rank statistic relates to pairwise dominance; it is not an omnibus detector of every distribution difference, an unconditional test of medians, or a generally valid test of only probability-of-superiority=.5 under arbitrary unequal distributions. A common-shape location-shift interpretation needs additional assumptions. Nonparametric does not remove independence requirements.

Clustering can be addressed by scientifically suitable unit-level summaries or an explicit dependence model, often mixed effects. Neither creates biological replication from one culture or repairs confounding. Binary, count and time-to-event outcomes are acknowledged without attempting to teach all their models. The orientation table is deliberately non-exhaustive.

Exploratory model changes and sensitivity analyses must be reported transparently. The original quantity, independent information, sampling space and multiplicity remain central. No outlier deletion rule, test-selection flowchart or workshop is introduced.

## Sources and open decisions

Conceptual source reuse follows CONTENT_MAP.md, especially the unit/technical-replication material (A pp. 121–122), paired effect examples (A pp. 136–144), sampling/design (R pp. 45–62) and planning (D pp. 45–46, 52). All plots were rebuilt. Old source ordering and software screenshots are not reused.

Method conventions were checked against official R documentation: [t.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/t.test.html), [wilcox.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/wilcox.test.html), and [lm](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/lm.html).

Open pedagogical decisions: the orientation table is intentionally denser than other slides and should remain a brief reference. Real outcome-specific model advice requires actual distributions, cluster counts, metadata and the inferential target. The exact mixed model and count/survival analysis are outside this block. Preserve interaction time rather than turning these examples into computation exercises. Session 1's prior timing overrun is unchanged by this work.

## Final validation

Quarto 1.8.27 rendered successfully. All 18 new screens were visually reviewed; no slide overflow was found. The paired plot → independent differences → named test reveal and final workshop bridge were checked. The full presentation has 55 screens with notes, 28 embedded images, zero broken images, zero audience code elements and no browser warnings/errors. Timing is continuous through 02:35. Numerical checks passed.
