# Scope update

This records the previously delivered uncertainty block. The next requested block is now built; see NULL_BLOCK_NOTES.md for current scope and the cumulative timing overrun. References below to the testing block being unbuilt describe that earlier delivery.

# Repeated experiments and uncertainty

The new block contains 14 core slides over 35 minutes, from 02:15 to 02:50. It continues the existing six paired L1 changes and the question about precision. Earlier audience content is retained; the preceding transition notes now lead into this block. The deck contains 49 core slides plus the existing break screen. Ten minutes remain in the original three-hour Session 1 budget; they are not built here.

## Timing and progression

| Screens | Question | Minutes | Elapsed time |
|---|---|---:|---|
| 37–39 | One estimate; predict and see new experiments | 7 | 02:15–02:22 |
| 40 | Accumulate means: 10 → 100 → 10,000 experiments | 3 | 02:22–02:25 |
| 41–42 | SD versus SE, then the independent-preparation formula | 5 | 02:25–02:30 |
| 43 | More biological variation or more preparations? | 3 | 02:30–02:33 |
| 44–46 | Interval motivation, repeated coverage, interpretation | 9 | 02:33–02:42 |
| 47–48 | Width versus magnitude | 4 | 02:42–02:46 |
| 49–50 | Return to Q, then the unanswered final question | 4 | 02:46–02:50 |

Prediction and discussion are included in these times. Notes on every slide specify delivery, the concept, a misconception and an optional question. The title question about repetition replaces a textbook section heading. No testing procedure, p-value, threshold, Type I error or power material is developed. The deck stops at the requested no-average-effect question.

## Simulation and method

`R/simulate_intervals.R` generates new independent paired experiments from the original assay mechanism: true mean −14 U/mg, preparation-effect SD 9, vessel SD 3 and technical-reading SD 2.5. The preparation baseline, additive day shift, three technical readings and two-decimal measurement rounding are retained. See `data/uncertainty/README.md` for seeds and exported data.

One contrast per preparation is formed after technical averaging. Additive shared baselines cancel; there is no treatment-by-day variation in this teaching model. A real assay with dependent contrasts needs an analysis that models that structure. The true mean is known only in simulation. It is not inferred from the observed −10.4 estimate or information available to a real investigator.

Each repetition receives its own t interval, using its own estimated SD and n=6 (five degrees of freedom). Exact t coverage is a normal independent-differences result; assay rounding makes the simulated differences discrete but has negligible practical impact here. Approximate normality cannot be established from six observations. This model limitation is flagged in a source comment and speaker notes.

The observed result is mean −10.4067 U/mg, estimated SE 4.9580 U/mg, and 95% CI [−23.1516, 2.3382]. Full precision is retained in CSVs and one decimal is used on slides. The repeated procedure covered the fixed true mean in 95.3% of 10,000 experiments. The coverage display shows the first 60 in order, without selection. The first three repetition examples and successive mean histograms also use unselected prefixes.

The SD-versus-SE figure uses two distributions from the same simulation process. The original experiment’s sample SD and estimated SE are introduced on the following slide, so model variability and sample estimates are not conflated. Normalized histogram heights permit comparison at common scales. SEM error bars are not proposed as a generic display convention.

## Interpretation and adaptation

The literal frequentist claim concerns repeated-procedure coverage. “Values reasonably compatible with the data and model” is explicitly identified as practical shorthand, not a 95% probability assigned to a fixed parameter in the realized interval. Interval width describes precision; magnitude and biological importance are separate. The two width/magnitude illustrations are constructed examples, labelled on screen, and not additional assay results. No overlap rule is taught.

Concepts follow the approved content map: A pp. 56–62, 67, 75–80; R pp. 37–44; D pp. 10–17. Figures and language are rebuilt. The CI wording flags in A59/R42/D14 and the SEM-overlap flag in A70 are addressed. The interval construction and coverage interpretation were checked against the [NIST/SEMATECH handbook](https://www.itl.nist.gov/div898/handbook/eda/section3/eda352.htm).

## Review question

No validated biological relevance threshold has been invented. The audience is asked whether the interval is narrow enough for its biological question; deciding that requires biological context. The suitability of the independent, approximately normal contrast model for a real assay remains conditional.

## Reproduce and validate

Run `Rscript scripts/generate_uncertainty.R`, then `Rscript scripts/check_uncertainty.R`, then `quarto render session-1.qmd`. R is preparation-only; presentation requires no code or software demonstration. See `instructor/validation.json` for the current build and browser checks.

Final validation: Quarto rendered without errors. All 14 new slides were visually reviewed in the local HTTP preview at 1280×720, with no detected overflow. The three sampling-distribution reveals and the precision prediction reveal were verified. Global checks found 50 notes, no audience code and no broken images. The preceding extreme-value layered plot was also checked after correcting Pandoc paragraph wrapping in the shared layer CSS.
