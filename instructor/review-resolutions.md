# Source review decisions used in this prototype

Physical PDF page numbers follow CONTENT_MAP.md. The original PDFs and approved planning files are unchanged.

| Issue | Prototype decision |
|---|---|
| A 73–74 / 121–122: ambiguous replication hierarchy | Explicit preparation → randomized vessel → lysate → assay-aliquot provenance. Distinguish 36 readings, 12 assigned vessels and six paired contrasts. Do not treat the number of days alone as biological N. |
| R 45 / A 63: sample size and representativity | Slides 16–19 distinguish population scope from allocation and technical sample count. Large N does not repair a restricted sampling frame. |
| A 191–192 / R 62: universally “ideal” blocking | Slide 9 gives the additive-shift case and speaker notes state the no-day-by-treatment-interaction assumption. A source comment flags this boundary for review. No claim of universal superiority. |
| R 10–11 / 69–70: negative characterization of exploration | Slide 15 treats exploration as valuable and separates discovery from prospective confirmation without a blanket irreproducibility claim. |
| R 61: design eliminates all biases | Slide 19 says random allocation protects against systematic assignment choices, with notes explaining that chance imbalance and other bias sources remain. |
| A 74: automatic outlier removal | No exclusions or outlier exercise are implemented in this opening prototype. The numerical plots are not displayed in this revision; the authoring dataset retains all 36 values. |
| CI/p-value/power/multiplicity definitions flagged elsewhere in CONTENT_MAP.md | Not used here. Remain unresolved for the later course stages; this prototype does not silently approve them. |

Definitions are conditional on the fictional protocol. “Biological replicate” means an independently initiated preparation of one cell line; it does not mean an independently sampled donor. The assigned vessel is an experimental unit, while the preparation defines a paired contrast. Outcome independence cannot be established just by inspecting labels or plots.

No real biological efficacy claims, copied source figures, journal policy statements or embedded paper results are reused. All visual diagrams are rebuilt as editable HTML/CSS in the Quarto sections; numerical plots remain reproducible R exports in the authoring project and are not displayed in this revision. The wet-lab concentration and timing are illustrative, not verified for a real compound/cell line.

The revised opening deliberately withholds the hierarchy. A triplicate-interpretation interaction precedes the single-preparation reveal, and the count/day details arrive later. The penultimate slide retrieves all six pre-inference questions, with no new analysis method.


## Descriptive continuation

Mean and median answer different location questions; skewness alone does not choose the scientific target. SD describes spread of preparation-level changes, not precision of their mean. Variance uses n−1 and squared units. Boxplot quartiles use type 7; whisker rules do not authorize exclusion. The hypothetical extreme and same-summary constructions are separately labelled and never replace original observations. See DESCRIPTIVE_BLOCK_NOTES.md and data/derived/README.md.


## Repeated experiments and uncertainty

CI wording in A59/R42/D14 is replaced by explicit repeated-sampling coverage, followed by compatibility shorthand and its limit. The n=6 interval uses t with five degrees of freedom, not a generic two-SE margin. The source flags the independent, approximately normal differences assumption and the inability of n=6 to verify it. SD, SE and CI width have different roles; A70’s SEM-overlap rule is not reused. Known simulation truth is distinguished from the observed estimate. No generic error-bar plotting recommendation or overlap decision rule is taught.


## Null model and p-values

The paired analysis uses six independent differences, not 36 readings. Mean-only simulations precede the studentized statistic; the actual p-value uses the t distribution with df=5 and both tails. The null probability is not inverted into a probability of H0 or chance explanation. CI equivalence is limited to matching two-sided t procedures, including endpoint equality. Alpha is a prespecified repeated-use rule; significant does not mean biologically important or guaranteed to replicate. Original data and CI are unchanged. See NULL_BLOCK_NOTES.md for conditional model assumptions and current timing.


## Session 2: power and prospective design

Power is evaluated under a specified effect, not estimated retrospectively from the observed effect/p-value. Beta is the probability of non-rejection under that stipulated nonzero truth; the actual non-significant result is not labelled a known Type II error. Pairing benefits are demonstrated with balanced conditions and shared baseline covariance, not asserted universally. Planning uses the SD of paired responses and biological units; technical repeats do not inflate N. A sensitivity grid replaces one scientifically unsupported recommended N; target power/alpha are explicitly conventional choices. See SESSION2_POWER_NOTES.md.


## Session 2: multiplicity and selection

Per-test rate, any-error probability and expected false count are separated. The independent-family formula is not generalized to correlated markers; Bonferroni/Holm do not require independence. FDR is an expectation with zero for an empty list, illustrated with mixed truth rather than conflated with all-null FWER. BH’s independence/PRDS assumptions and adjusted-p terminology are explicit. Ordered examples show Holm step-down versus BH step-up. Selection and forking paths are treated as properties of the inferential procedure; no generic correction for all analytical choices is claimed. Ordinary versus multiplicity-aware intervals remain labelled. See SESSION2_MULTIPLICITY_NOTES.md.
