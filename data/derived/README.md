# Derived descriptive data

Generate with `Rscript scripts/generate_descriptive.R`; validate with `Rscript scripts/check_descriptive.R`. Input is the unchanged `data/simulated/assay_readings.csv`. The generation script reads that export; it does not resimulate or select a seed.

Three aliquot measurements are averaged within each assigned vessel. Twelve vessel summaries form six paired changes (Q minus vehicle), one per independently initiated preparation. Units are U/mg protein. Calculations use full precision; presentation labels use one decimal. P2 is +0.003333… and is therefore described as almost unchanged, even though its label rounds to +0.0.

`descriptive_summaries.csv` records mean, median, observed range, quartiles, IQR, sample variance and sample SD of the six changes. Quartiles use R type 7, the ggplot2 boxplot convention; whiskers extend to the most extreme observations within 1.5 IQR of the hinges. Variance uses denominator n−1 and squared activity units. SD returns to activity units. See the official R documentation for [quantiles](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html) and [SD](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/sd.html).

`hypothetical_extreme_readings.csv` is a separate hypothetical copy: 60 U/mg is added to each of P5’s three Q aliquot values. Its paired change rises by 60; the six-change mean rises by 10 while the median remains unchanged. Original observations are never changed.

`constructed_same_summaries.csv` contains explicitly constructed illustrations with six values each. Two vectors with different structure are standardized and scaled to the original mean and sample SD. They are not simulated additional preparations, and tied values are stacked visibly in the plot.

Six preparations are the replication count. They share three run days; interpreting independence requires the design and assumptions described in the opening notes.
