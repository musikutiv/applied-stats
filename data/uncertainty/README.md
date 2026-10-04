# Repeated-experiment exports

All values are simulated except in the sense that `observed_interval.csv` summarizes the existing, unchanged fictional assay dataset. No real biological evidence is claimed.

- `repeated_changes.csv`: 10,000 experiments × six paired preparation changes; seed 20261003.
- `repeated_intervals.csv`: one mean, sample SD, estimated SE and t-based 95% interval per experiment; coverage against fixed true mean −14.
- `observed_interval.csv`: interval from the six original Q-minus-vehicle changes, no point removed.
- `precision_scenarios.csv`: original n=6, increased biological-effect SD 18 at n=6 (seed 20261004), and original variability at n=24 (seed 20261005).
- `simulation_metrics.csv`: realized coverage and sampling variability, plus theoretical response SD before assay rounding.

`R/simulate_intervals.R` preserves the original marginal data-generating process with vectorized draws. New preparation baselines have SD 15, additive day shifts are −9, 4, 11 (cycled for the n=24 illustration), effects have mean −14 and SD 9, each vessel adds independent SD 3 error, and three aliquots add independent SD 2.5 errors before readings are rounded to two decimals. Two pairs are assigned to each day. Vehicle/compound allocation labels are omitted because exchanging identically distributed vessel errors does not change the paired-contrast law. This changes random-number ordering, not the generating process. The original seed and original file are untouched.

Before rounding, independent paired changes are Gaussian with variance 9² + 2×3² + 2×2.5²/3. The response SD is about 10.16 U/mg and the true SE for n=6 is about 4.15 U/mg. The sample SD and SE from the original six need not equal these quantities. There is no treatment-by-day variation; shared additive day and preparation baselines cancel in contrasts. Real dependencies would invalidate a blind use of SD/√n.

The t interval is mean ± qt(0.975,n−1) × sample SD/√n. Rounding is negligible relative to these noise scales, but nominal coverage is described as approximate for the exported process. Simulated coverage is not forced to exactly 95%; no seeds or examples are selected for an attractive outcome. Figure prefixes show the first 3, first 10/100, and first 60 repetitions as labelled.

`unc-width.png` and `unc-magnitude.png` are constructed 95% interval illustrations with explicit centers/endpoints in `R/plot_uncertainty.R`; they are not sampled study results. No probabilities or conclusions are computed from their overlap.
