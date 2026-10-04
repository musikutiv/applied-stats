# Prospective power/design teaching exports

All data are fictional. Generate with `scripts/generate_power.R`; validate with `scripts/check_power.R`.

- `repeated_changes.csv`: seed 20261007, 10,000 experiments × six paired changes, true mean −14; original variance components and rounding.
- `repeated_experiments.csv`: mean, SD, SE, t-based CI, two-sided p and p<.05 decision for each repetition.
- `illustrative_experiments.csv`: first rejection and first non-rejection. Selection is intentional and disclosed, not an estimate of frequency.
- `factor_curves.csv`: analytic two-tail paired t probabilities varying one of effect magnitude, biological effect SD, independent pair count or alpha; other assumptions fixed.
- `precision.csv`: total paired-change SD / sqrt(n), for 3/6/12/24 independent pairs.
- `design_comparison.csv`: original paired means and separately simulated unrelated-preparation means (seed 20261008). Both designs balance conditions over days; no false pairing or treatment/day confounding is introduced. Extra between-preparation baseline variance remains in the unrelated contrast.
- `assay_well_options.csv`: current SE versus six additional technical readings spread over three pairs, versus one additional biological pair with six assay readings. Only precision is calculated; culture costs are not equated.
- `planning_sensitivity.csv`: smallest integer completed-pair N reaching 80% at each illustrative effect/SD combination, with two-sided alpha .05. Counts include no attrition allowance.
- `metrics.csv`: seed, empirical power/beta, exact normal-model power, design SEs and selected example identifiers.

No observed-power calculation is made from the actual −10.4 estimate or p=.090. The original true −14 teaching model and illustrative scientifically relevant planning magnitudes are explicitly separate from that observed estimate. See SESSION2_POWER_NOTES.md for assumptions and numerical checks.
