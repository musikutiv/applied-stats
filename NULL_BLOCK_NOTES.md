# No-average-effect model and p-values

This continuation adds 14 core slides over 35 minutes, from 02:50 to 03:25. The deck now contains 63 core slides and the existing break screen. **The cumulative Session 1 timing is 205 minutes, 25 minutes beyond the original three-hour budget.** This reflects the explicitly requested continuation; earlier teaching time has not been compressed or relocated. A future timing revision is needed before advertising this assembled deck as a three-hour session.

The block stops at “What if the experiment was simply too small to give a clear answer?” It does not develop the next topics or extend Session 2.

## Sequence and timing

| Screens | Purpose | Minutes | Elapsed |
|---|---|---:|---|
| 51–54 | Concrete zero-mean model, repetitions, distribution, observed mean | 9 | 02:50–02:59 |
| 55–57 | Why standardize; observed t; t reference distribution | 7 | 02:59–03:06 |
| 58–59 | Two-sided p-value and interpretation activity | 7 | 03:06–03:13 |
| 60–62 | CI connection, alpha/Type I rule, neighboring p-values | 8 | 03:13–03:21 |
| 63–64 | Scoped report and unanswered final bridge | 4 | 03:21–03:25 |

The no-effect scenario precedes the term “null hypothesis.” Means accumulate in 10/100/10,000 stages, then terminology is revealed. The uncertainty demonstration explains why the raw mean is not the final testing statistic. The p-value interpretation exercise retains four minutes for choice, discussion and correction. Every substantive slide includes timing, delivery guidance, conceptual point, misconception and optional follow-up.

## Numerical result and simulation

The six observed paired changes remain unchanged. The paired t result, calculated independently both as a paired analysis and a one-sample analysis of differences, is:

- Mean −10.4066667 U/mg; SE 4.9579861 U/mg.
- t(5) = −2.098971; two-sided p = 0.08987058.
- 95% CI [−23.1515756, 2.3382423] U/mg, identical to the previous block.

Seed 20261006 generates 10,000 experiments with six independent paired changes each. Only the generating mean is changed to zero. Preparation-effect, vessel and technical variability, additive shared baselines, three technical readings and rounding retain the previous mechanism. The shared simulator now has an optional `true_mean` argument defaulting to −14; a reproducibility check confirms previous exports are unchanged.

Each null experiment uses its own sample mean and estimated SE. The standardized tail fraction is 9.07%, close to the analytical p-value 8.987%. The p<0.05 rule rejects in 4.98% of repetitions under the true null. Neither percentage is forced, and all illustrative prefixes are unselected. Rounding of readings has negligible impact; exact t calibration is a result for independent normal differences before rounding. A source comment flags model adequacy for real n=6 assays as conditional.

The raw-mean histogram retains the preceding sequence’s 36-unit horizontal span, one-unit bins, density/frequency style and U/mg units; it is recentered from −14 to zero. The observed-mean view uses exactly the same axes as the null accumulation. The standardized plot changes units explicitly. Its two shaded tails start at ±|t observed|; the reported probability integrates the complete tails beyond the plotted window.

## Interpretation decisions

The p-value is conditional on H0 and model assumptions. It is neither the probability of H0 nor a probability the result happened by chance. The four misconception choices are explicitly marked incorrect on reveal. The CI/test correspondence is limited to the matching two-sided paired t procedure with the same contrast and assumptions; endpoints count as included. No rule about overlap of separate group intervals is used.

Alpha is introduced after p-value interpretation, as a prespecified decision rule. Type I error is conditional on H0 being true, not the fraction of all rejected claims that are false. Nearby p-values have no discontinuous scientific meaning at 0.05. Statistical significance does not quantify effect magnitude, biological relevance or replication probability. The report retains the effect, interval, t statistic and p-value together without a works/does-not-work conclusion.

The preceding source-map corrections to A110/A114/D33 (chance language), A70 (overlap), and A125–129/A143/A146/R54–55 (difference-level assumptions) are carried forward. Figures are rebuilt rather than copied. Formula/calibration reference: [R Student t documentation](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/TDist.html). Interpretation reference: [ASA statement](https://www.amstat.org/asa/files/pdfs/p-valuestatement.pdf).

## Reproduction and validation

Run `Rscript scripts/generate_null.R`, `Rscript scripts/check_null.R`, then `quarto render session-1.qmd`. R remains preparation-only. The numerical checks verify the unchanged original assay, matching paired/one-sample analyses, the CI, fixed-seed reproducibility, six changes per repetition, every statistic and p-value, CI/test equivalence and Monte Carlo behavior. See `instructor/validation.json` for the final render/browser record.

Final validation: Quarto rendered successfully. All 14 new slides were visually checked through the local HTTP preview; no overflow or browser errors were found. The staged simulation/terminology sequence and misconception-answer reveal were verified. Global checks found 64 speaker-note sets, no visible code elements and no broken images. The final tail annotations were reviewed after the last render.
