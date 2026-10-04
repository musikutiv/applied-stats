> Completed Session 2: 03:00 including the 15-minute break, with the final redesign workshop and course landing. See FINAL_WORKSHOP_NOTES.md and workshop-design-canvas.html. Earlier scope descriptions below document preceding stages.

> Current continuation: Session 2 now ends at 02:35 after the analysis-from-design block. See SESSION2_TESTS_NOTES.md; the workshop remains unbuilt. Earlier block timings below are retained.

# Multiplicity and analytical flexibility

## Scope and timing

18 new core slides provide 45 teaching minutes. A separate 15-minute break retains the approved Session 2 position at 01:20–01:35. The existing 50-minute opening and all Session 1 content remain unchanged. Session 2 now has 36 core slides plus one break screen, ending at **01:50**. The common-tests section is unbuilt.

| Screens | Content | Elapsed | Teaching minutes |
|---|---|---|---:|
| 19–22 | One p among twenty, null repetitions, family error, family definition | 00:50–01:00 | 10 |
| 23–25 | Bonferroni, adjusted p-values, Holm | 01:00–01:07 | 7 |
| 26–29 | 20,000 genes, FDR, BH, choice of criterion | 01:07–01:17 | 10 |
| 30 | Visible and less visible analytical opportunities | 01:17–01:20 | 3 |
| 31 | Break | 01:20–01:35 | 0 |
| 32–35 | Selection/forking paths, exploration, reporting, prespecification | 01:35–01:45 | 10 |
| 36–37 | Return and synthesis; unanswered test-choice bridge | 01:45–01:50 | 5 |

Two requested topic pairs share slides to stay at 18 core slides: researcher degrees of freedom with the garden of forking paths, and the return to the opening question with the synthesis. All substantive screens have timing, delivery guidance, conceptual point, misconception and optional follow-up. Predictions precede the family-frequency reveal; terminology follows the simulation.

## Simulation assumptions and results

**All-null family:** seed 20261009, 10,000 independent experiments, each with 20 independent outcomes and six independent normal paired changes per outcome. Standardized marker units have SD 1 and mean 0. Each outcome receives a two-sided paired t p-value with 5 df. This is a new hypothetical marker expansion; the original enzyme observations and p=.090 are unchanged. Correlation among real markers is not assumed away in the general teaching claims.

The simulated per-test rate is 5.0115%, average false count 1.0023 per family, and probability of any false rejection 64.27%. The exact independent-family expression gives 1−.95^20 = 64.1514%. Its independence requirement is explicit. First-three p-value panels and first-hundred family decisions are unselected prefixes.

**Adjusted-value illustration:** first crossing marker in the first family with any crossing is repeat 2, M03: mean .7276, SE .1314, ordinary CI [.3897,1.0655], raw p=.002639, Bonferroni p=.052779. This selection is documented. The interval is explicitly ordinary/unadjusted, with no simultaneous coverage claim. The opening hypothetical p=.03 is a separate narrative example; its Bonferroni-adjusted value for m=20 is .60.

**Constructed algorithm examples:** Holm uses five ordered raw p-values [.006,.011,.016,.030,.200], with Bonferroni adjusted [.030,.055,.080,.150,1] and Holm [.030,.044,.048,.060,.200]. At .05 they reject one and three, respectively. Holm stops at the first failed raw step. The BH example uses eight ordered values [.002,.009,.018,.024,.055,.150,.400,.800], largest qualifying rank four, adjusted [.016,.036,.048,.048,.088,.200,.457143,.800]. BH selects all ranks through the largest qualifying rank, rather than stopping at the first failure. These examples are labelled constructed, not additional observed L1 findings. The BH plot zooms to .085 and explicitly lists the three values above its range.

**Mixed truth for FDR:** seed 20261010, 10,000 independent 20-marker screens, four true effects of 1.5 paired-change SD units and sixteen true nulls, n=6 each. This model change is stated on screen. The BH target is .05. The realized FDR is 4.1312%; its FWER is 10.16%. Holm FWER in this scenario is 4.21%. FDR is computed as mean(V/max(R,1)), with zero discoveries assigned fraction zero. The plot shows the first 80 realized fractions and the mean across all 10,000. These are simulation results, not universal equalities or guarantees for each list. Under all nulls FDR equals FWER; the mixed example avoids obscuring that distinction.

**Selection illustration:** take the minimum of the first five independent true-null p-values, compared with the first fixed p-value. The below-.05 frequency of the minimum is 23.07%, close to 1−.95^5 = 22.6219%. This is explicitly a simplified selection example, not a model of all analysis choices or a generic correction recipe.

**Gene-count picture:** each dot represents 100 genes; highlighted dots depict the expectation of 1,000 raw false positives among 20,000 exact-size .05 true-null tests. It is not an observed RNA-seq dataset. Expected count uses linearity of expectation and does not require independence; the probability of any false positive is a different quantity.

## Interpretation safeguards and decisions

Bonferroni and Holm give strong FWER control with valid individual p-values without independence. BH’s classical guarantee assumes independent valid p-values or suitable positive dependence (PRDS on true nulls), as explained in notes and flagged in a source comment. BH-adjusted p-values are named explicitly; they are not equated with every definition of a q-value.

The choice of family and error criterion is a scientific decision, not a way to retain a selected result. Corrections do not automatically account for data-driven exclusions, transformations, analysis switching, stopping or selective reporting. The selection/forking-paths slide distinguishes explicitly running many analyses from data-dependent decisions leading to one final test. Exploration is presented as legitimate; independent confirmation and honest reporting reconnect to Session 1.

The reporting examples retain effect estimates and ordinary CI labels where available. Transparency is necessary but not itself a statistical correction. Prespecification is framed as a clear analysis plan, not a universal formal-preregistration requirement.

**Open pedagogical decisions:** defining the family for a real set of L1 markers needs their scientific purpose and dependence structure; neither is invented. Four-minute retrieval at the end should be protected if method discussion expands. The brief Holm/BH demonstrations are conceptual, not manual algorithm exercises. The original Session 1 remains 25 minutes over its initial budget; no timing compression was attempted here.

## Reproduce and validate

`Rscript scripts/generate_multiplicity.R` produces CSVs and PNGs; `Rscript scripts/check_multiplicity.R` validates seed reproduction, marginal and family behavior, library-versus-direct t calculation, adjusted values, independent manual Holm/BH calculations, zero-discovery convention, mixed performance and the selection illustration. `quarto render session-2.qmd` renders without running R.

Method conventions were checked against the official [R p.adjust documentation](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/p.adjust.html) and its original Holm/BH/dependence references. Source ideas and corrections follow CONTENT_MAP.md: A pp. 167–173 and 178–184, R pp. 63–70, D p. 44. See `instructor/session-2-validation.json` for the final browser and render checks.

Final validation: Quarto rendered successfully. All 19 added screens were visually reviewed at 1280×720; no slide overflow, missing images or browser errors. The three null examples and prediction/frequency/formula reveals were checked in presentation order. A crowded p-axis tick was removed and the final plot rechecked. The full deck contains 37 note sets and no audience code elements. Session 1 and the existing Session 2 opening were verified unchanged by SHA-256.
