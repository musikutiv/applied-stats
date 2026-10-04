# Prototype assay data

All values are simulated for teaching. Cell line L1 and compound Q are fictional. The concentration, timing and solvent choices specify the case; they are not a recommended experimental protocol.

From the project root, `Rscript scripts/generate_data.R` regenerates the CSVs and finished PNG plots with seed 20261002. Run `Rscript scripts/check_examples.R` to verify the hierarchy and reproducibility. All R work is preparation-only; the presentation itself has no executable chunks.

Six independently initiated culture preparations are each split into two vessels. Within a preparation, randomly assign one vessel to vehicle and one to Q. Each vessel supplies one lysate and three assay aliquots. Two preparations are run on each of three days. Vehicle and Q both contain 0.1% DMSO; Q is 10 µM. Incubation is 24 hours.

The preparation baseline is 100 + a day shift + normal variation with SD 15 U/mg protein. The fixed day shifts are −9, 4 and 11. The Q effect for each preparation is −14 + independent normal variation with SD 9. Vessels add independent variation with SD 3; technical aliquots add independent variation with SD 2.5. Values are rounded to two decimals. There is no seed search, selected p-value, deletion or significance annotation.

These are additive teaching assumptions. In particular there is no shared day-by-treatment interaction. The shared day shift cancels in each paired contrast, and contrast errors are independent across preparations under this generator. That does not establish independence for a real experiment. A shared treatment response within day would invalidate that simplified assumption.

Raw plots retain all 36 observations. The second plot groups the same values by preparation and joins vessel means. Position offsets are fixed solely for legibility; horizontal distance within a condition has no quantitative meaning. Simulated values describe activity per mg protein on an illustrative assay scale.

`assay_metadata.csv` has one row per vessel; `assay_readings.csv` has one row per assay aliquot. Source concepts are adapted from AppliedStats_2026.pdf pp. 73–74 and 121–122, but no source data or old numerical results are copied. Generation environment details are recorded in simulated/generation-session.txt.
