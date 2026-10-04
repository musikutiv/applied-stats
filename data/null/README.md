# Zero-mean simulation exports

Generate with `Rscript scripts/generate_null.R`; verify with `Rscript scripts/check_null.R`.

`repeated_changes.csv` contains 10,000 experiments × six preparation-level Q-minus-vehicle changes, seed 20261006. It calls the existing vectorized assay generator with `true_mean=0`, leaving all variance components and the assay hierarchy unchanged. Random allocation labels have no effect on the contrast distribution because vessel errors are iid. As before, additive shared preparation/day baselines cancel apart from negligible rounding, and no treatment-by-day response variation is included.

`repeated_statistics.csv` contains each experiment’s mean, sample SD, estimated SE, t statistic, two-sided p-value and 95% interval. Each t uses that experiment’s own SD; the reference distribution has five degrees of freedom. `observed_test.csv` is the actual paired t calculation on the existing fictional L1 observations. `metrics.csv` records the realized two-sided tail fraction and Type I rate, without searching for a favorable seed.

The two-sided analytical p-value is 2 × pt(−abs(t), df=5). The raw-mean histogram is an intermediate teaching illustration under known generating variability, not a source of the reported t-test p-value. The shaded t figure shows finite axes, but numerical probabilities include the entire tails. Exact calibration assumes independent normal differences; the rounded simulation is an approximation to that model.

The first three, first 10/100 and first 100 testing decisions are displayed without selection. Hypothetical equal-mean/different-SE illustrations are explicitly constructed and labelled; they are not new biological observations. The original −14-mean simulation and original observed CSV are not modified.
