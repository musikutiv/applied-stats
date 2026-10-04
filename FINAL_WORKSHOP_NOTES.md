# Final redesign workshop and course landing

## Timing and facilitation

The workshop adds 14 screens and 25 minutes, from **02:35 to 03:00**. Session 2 now has 69 screens: 68 core/activity/landing screens and one 15-minute break. Total teaching/activity time is 165 minutes, plus the break at 01:20–01:35. No earlier teaching time has been compressed.

| Activity | Elapsed | Minutes |
|---|---|---:|
| Lab-meeting result and participant questions | 02:35–02:39 | 4 |
| Hierarchy, days, claim, multiplicity, exclusion, full data | 02:39–02:46 | 7 |
| Small-group redesign | 02:46–02:52 | 6 |
| Compare designs and identify improvements | 02:52–02:57 | 5 |
| Return to researcher, course synthesis and landing | 02:57–03:00 | 3 |

Facilitator notes contain more material than should be spoken. Let participants supply the reasoning; use notes to answer questions and correct misconceptions. Protect six minutes for group work and five for comparison. The information-request slide is deliberately blank except for a prompt. The hierarchy, multiplicity audit and response to the researcher reveal progressively. Do not show the canvas or facilitator answer before participants have diagnosed the case. This is a conversation with a colleague, not an exam.

The optional `workshop-design-canvas.html` is a printable A4 page with fourteen short prompts and space for keywords/sketches. The on-screen canvas combines related fields into eight boxes. It requires no calculations or software.

## Fictional experimental protocol and audit

The new compound R case is separate from the existing L1/compound Q example. Two established lines, A and B, undergo the same inflammatory stimulation and matched solvent handling. On each of three days, one fresh preparation per line is initiated. Available conditions receive separate treated culture vessels. Allocation within a day is randomized. One lysate per vessel is measured in three multiplex assay wells, each reporting five proteins P1–P5. The three wells are technical aliquots, not independently treated biological replicates.

Both lines use the same incomplete block layout:

- Day 1: vehicle, low, medium.
- Day 2: vehicle, high.
- Day 3: vehicle, low, medium, high.

There is one vessel per condition per preparation. There are 18 vessels, 54 assay wells and 270 protein readings; the full-data graphic has 90 vessel/protein means. Each nonzero dose has two preparation/day repeats per line. Conditions within preparation, proteins within lysate and cultures on a shared day are not all independent. Preparation and day are inseparable within a line here. Contemporary vehicle controls exist on every day; treatment and day are not perfectly confounded. Pooled comparisons that ignore day mix different day compositions, while some within-day contrasts remain supported. The screen is limited, not cartoonishly impossible.

The researcher inspected 60 day-specific dose-versus-vehicle technical-well Welch calculations: (2+1+3) contrasts × 2 lines × 5 proteins. There are 30 line/dose/protein combinations of scientific interest, observed on different day subsets. Tests are dependent, so neither count is an independent-opportunity probability model. Broad exploration was legitimate, but no primary endpoint or analysis was specified before inspection. The displayed panel is a selected promising finding, not necessarily the minimum p-value.

One P3 assay-well value for Line A/day 3/low dose equals 190 and was excluded without a documented assay failure, prior QC rule or established cause. The choice occurred after viewing the screen; whether its p-value influence was inspected is unknown. This excluded reading is **not** in the opening .032 panel. The full-data plot includes it, and rings the affected vessel mean. It therefore differs transparently from the researcher’s two-retained-well summary. No malicious intent is invented; defensible exclusions remain possible.

The opening claim exceeds the measured evidence: a selected protein signal does not establish a general inflammatory mechanism, cell-wide suppression or patient benefit. Matched vehicle controls do not by themselves exclude cell loss or assay interference. Participants can request appropriate controls and narrow their claims using earlier course concepts.

## Data generation and numerical consistency

Run `Rscript scripts/generate_workshop.R`, then `Rscript scripts/check_workshop.R`. Seed **20261012**. Data are saved in `data/workshop/`; finished PNGs in `figures/generated/`. No R is executed in the presentation.

Most values are generated from preparation/protein baselines (mean 100, SD 12), day shifts −8/+7/0, dose effects per ordinal step of −5/−2/−1/−3/0 for P1–P5, vessel/protein variability SD 4 and technical SD 3. These are illustrative arbitrary signal units, not estimated biological parameters or calibrated comparability across proteins.

The opening result is an explicitly **constructed teaching sub-example**, not an unselected simulation realization. In Line B/day 2/P1, vehicle readings are 95,100,105. High-dose readings are those values minus delta, where delta = t(0.984, df=4) × sqrt(50/3) = 13.18313. Both sample SDs are 5. Their two-sided technical-well Welch calculation has df=4 and **p=0.032 exactly**, with mean signals 100 and 86.81687. The figure uses these same six readings and their means. The intentionally altered exclusion value and this calibrated subset are documented rather than portrayed as natural draws. No fabricated confidence interval or biological p-value is shown.

The reported .032 is **not valid evidence for a biological treatment effect**: each group is one treated culture-vessel lysate, assayed three times. Technical measurement repeatability cannot substitute for independent culture replication. Notes state this explicitly. A technical-noise calculation can reproduce the number but not validate the researcher's biological inference. Multiplicity adjustment does not cure that problem.

Checks independently reconstruct all plotted vessel means, verify the exact .032 calculation using direct SE/df arithmetic and R, check all 60 screen p-values, and validate hierarchy counts and exclusion location. Full data retain missing design cells as missing; connecting lines indicate shared preparation/day, not time series or fitted trends.

## Defensible prospective repeat

The example redesign independently confirms the exploratory Line B/P1/high-dose signal. New preparations each contribute vehicle and high R; conditions are balanced within day, allocation and assay positions randomized, technical repeats retained for measurement precision, QC set prospectively, and primary inference targets the mean within-preparation effect. Independent N needs a biologically relevant minimum effect, plausible biological SD, desired precision/power, alpha and attrition assumptions. No numerical N can responsibly be supplied from the case alone. Shared day-dependent treatment effects would need suitable design and modelling rather than automatic independent-pair assumptions.

Other lines/proteins/doses may remain exploratory or be incorporated into an explicitly planned family and model. Appropriate controls should be included for the intended biological mechanism. Report estimates and confidence intervals with any p-values and all relevant outcomes. Choosing the primary target now does not retroactively make the original screen confirmatory. Other defensible questions may require different designs.

Correctable reporting/analysis issues include provenance, displaying full data, auditing exclusions, modelling supported within-day contrasts and labelling selection. New independent replication, missing controls and broader population coverage require new data. The final message is constructive: involve statistical reasoning before collection, while still learning appropriately from imperfect exploratory data.

## Sources and open decisions

This workshop retrieves existing course concepts rather than adding procedures. It follows CONTENT_MAP.md's design-capstone sources (A pp. 189–192; R pp. 47, 62, 73–75; D pp. 45, 52–53). The case, layout, data, graphics and canvas are newly constructed.

The protocol intentionally leaves dose concentrations and stimulus identity unspecified: they are not needed for the statistical diagnosis, and a real prospective protocol must define them. The relevance threshold, biological variance, sample size and cause of the unusual technical reading remain unresolved. Participants should state what information they need rather than invent certainty. The rapid reveal slides are facilitator prompts, not seven miniature lectures. The complete Session 1 timing remains outside this update.

## Final render and validation

Quarto 1.8.27 rendered the complete Session 2 successfully. All 14 new screens and the 14-field printable canvas were visually reviewed. Full-data axis labels were shortened and rechecked; no slide overflow remains. Progressive hierarchy disclosure was verified. The presentation has 69 note sets, 31 embedded images, no broken images, no audience code and no browser warnings/errors. Source timing is continuous from 00:00 to 03:00, including the 15-minute break. Numerical checks passed. The final slide ends the course; no further section follows.
