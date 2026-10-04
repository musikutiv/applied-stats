# Multiplicity teaching exports

All results are fictional. Generate using `scripts/generate_multiplicity.R`; validate using `scripts/check_multiplicity.R`.

- `all_null_p.csv`: 10,000 × 20 valid paired t p-values, seed 20261009; each test has six iid normal mean-zero differences, SD 1 in standardized outcome units. Tests are independent for the initial example.
- `adjusted_example.csv`: first crossing marker from the first family with any crossing, including its estimate and ordinary unadjusted CI; this selection is disclosed in notes.
- `holm_example.csv`, `bh_example.csv`: explicitly constructed ordered examples, not measured marker data. Adjusted p-values computed with R and checked by independent cumulative-max/min formulas.
- `mixed_p.csv`: seed 20261010; four outcomes with standardized true effect 1.5 and sixteen true nulls, still independent, six changes each.
- `mixed_performance.csv`: discoveries, false discoveries, realized false-discovery proportion and any-false indicator for each repeated family and each method. No discoveries means proportion zero.
- `selection_illustration.csv`: first prespecified test versus minimum of first five valid null tests from the same families. It is an illustration of selection, not a model of all real scientific workflows.
- `metrics.csv`: empirical per-test rate, FWER, expected false count, mixed FDR/FWER and minimum-p behavior.

The 20,000-gene figure shows an expected count rather than a simulated dataset. All panels use unselected prefixes except the explicitly documented adjusted-value example. Family sizes of 5 and 8 for algorithm demonstrations are visible on the slides. Original L1 enzyme data and preceding power simulations are untouched. See SESSION2_MULTIPLICITY_NOTES.md for statistical limitations and reproducibility details.
