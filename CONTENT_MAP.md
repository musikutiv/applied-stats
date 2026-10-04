# Source content map and review register

## Inspection and conventions

Inspected all pages by text extraction: **AppliedStats_2026.pdf (A), 192 pages; Stats_PhD_MR_CVS_2024.pdf (R), 112 pages; DoctaMed.pdf (D), 55 pages**. Selected pages A 73–74, R 30–31 and D 33–35 were rendered; the case layouts and wording on A 73–74, R 30–31 and D 33/35 were visually checked. Image-only pages and embedded papers have not received an exhaustive scientific audit. Extracted text and temporary renders are in `tmp/pdfs/`; these are inspection aids, not course assets.

All references below use **physical PDF page numbers (1-based)**, not potentially different numbers printed on slides. A range means candidate material within that range, not a recommendation to import every page. Reuse means adapt the teaching idea; it does not establish the validity of a biological claim or permission to redistribute third-party images.

All proposed R work is preparation-only. Reuse finished figures and conceptual explanations; exclude code, software screenshots and console output from audience-facing materials.

## Map to the new narrative

| New section | AppliedStats_2026.pdf | Stats_PhD_MR_CVS_2024.pdf | DoctaMed.pdf | Adaptation and new work |
|---|---|---|---|---|
| 1. My experiment | 12: pooled RNA/technical replicates; 17: data provenance; 68: replicate-reporting example; 73–74: day/triplicate assay; 121–122: biological/technical measurements | 4–8: controlled experiments, endpoint and batches; 13: metadata; 53: biological replication | 5–7: data/metadata; 21–22: controlled study and observations | Retain the replicate puzzle; create explicit preparation/vessel/reading metadata. Old “day” labels alone do not establish independence. Rebuild batch diagrams for the same assay. |
| 2. Intended question | 189: experiment flowchart | 4, 10–11: exploration/confirmation; 66–70: experiment in the research project, screening and confirmation | 19–21: intervention and population; 52: experimental flowchart | Move the scientific cycle to the start. Replace judgments about exploration with a distinction between discovering and independently testing a prediction. Add a concrete estimand. |
| 3. Sample to claim | 54–58: nonrepresentative sample and population/sample diagrams; 63: representativity; 71: scope of replication | 16–26: colour-sampling/M&M exercise; 27–33: reproducibility, sampling space, NaCl ranges and sources of variation; 45–47: sampling and exclusions | 9–20: sample/population and repeated BMI examples | R is the strongest conceptual source. Translate its sampling-space question into cell line, preparation, donor, day and lab. M&Ms are an optional analogy, not a second extended case. |
| 4. What data say | 25–41: raw plots, histograms, location/spread and summary limitations; 50: reporting; 65–80: error bars, normalization and case examples; 123: plots of the two-group assay | 13–15: documentation/data organization (supporting context only) | 7–8: metadata and compact plot vocabulary | Generate raw assay plots with pairing and batch identifiers. Use one compact centre/spread panel. Treat the outlier example as a judgment problem, not an instruction to remove a value. |
| 5. Effect and uncertainty | 11: ratio scale; 56–62: sampling/CI/SE; 67: error bars; 75–80: expression and normalization; 136–141: difference CI, clone pairing and log ratios | 37–44: repeated samples, SE, intervals and cell-viability question | 10–17: changing sample size; 35: estimate/CI visual | Rebuild interval coverage and paired differences in R; correct CI language and the D sign inconsistency. Clone data are a transfer example; quantitative outputs require recomputation. |
| 6. Null-model question | 89–99: test logic, errors and nonsignificance; 106–114: staged gene-expression null distribution; 136, 142–146: interval and paired procedure | 50–55: decisions/errors and test diagrams | 30–39: statistic, null distribution, repeated tests | Retain the gradual null-distribution reveal, using the assay's actual unit structure. Rewrite p-value wording. Omit the test-selection flowchart and extended sheep analogy. |
| 7. Inconclusive experiment | 92–95: errors/power; 99: no proof of equality; 147–148: planning example; 161–164: sample size versus relevance | 56–58: power and effect/variability | 37–42: errors, power and relevance | Create interval scenarios and a prospective power plot. Include variance explicitly, correct beta wording and avoid an apparently universal N recommendation. |
| 8. Design | 137–144: clone pairing; 187–192: design principles, flowchart and day blocks | 8: batches; 47: exclusions/blinding; 59–62: design and day blocks | 45–46: design/randomization; 52: experimental workflow | Rebuild the day-block layout and link it to a feasible allocation and planning table. Do not assert that one design is universally ideal or that randomization removes all bias. |
| 9. Many opportunities to find something | 78–80: many endpoints; 167–172: multiplicity, corrections and repeated looks; 173, 178–184: many groups/follow-up contrasts | 63–65: multiple testing; 66–70: screening and independent confirmation | 44: endpoints, sequential tests and group comparisons | New all-null and mixed-truth simulations. Clarify FWER/FDR and Holm/BH purposes; avoid a post-hoc test catalogue. No transcriptomic pipeline is required. |
| 10. Next experiment | 3: reporting checklist; 189–192: experiment planning | 47, 62: safeguards/design; 73–75: checklist and better experiments | 45, 52–53: design and critical reading | Convert recurring questions into a prospective design canvas and peer rubric. Treat historical journal checklist wording as inspiration, not as a statement of current journal policy. |

## Review register: resolve before slide reuse

These are flags and proposed teaching corrections. They have not been edited into the original PDFs.

| Source location | Concern | Proposed treatment |
|---|---|---|
| A 59; R 42; D 14 | CI wording can imply a probability assigned to a fixed unknown parameter after observing the interval. | Explain 95% coverage of the procedure over repeated sampling under the assumptions. Distinguish this from the observed interval's compatibility interpretation. |
| A 110, 114; D 33 | Chance language and a threshold crossing can imply that the null's probability was computed or that the alternative is established as true. | Define the p-value as a probability, under the null model and assumptions, of a statistic at least as extreme as observed. Rejection does not establish mechanism, relevance or freedom from bias. |
| D 35 | Positive point estimate 2.5 appears alongside an entirely negative CI, −4.12 to −0.78. Visually confirmed. | Verify contrast direction and recalculate from a documented dataset. Do not copy the numbers. |
| A 74 | An extreme observation is removed without a stated external QC reason or prospective exclusion rule. | Preserve it in the opening exercise; ask what metadata justify action. Show transparent sensitivity analysis if appropriate. Do not teach extremeness as sufficient grounds for deletion. |
| A 73–74, 121–122 | Day/replicate labels and averaging are insufficient to establish treatment-assignment units and independence. | Supply the experimental hierarchy and randomization before selecting N. Aggregation can handle technical repeats in the simple case; it does not eliminate all biological dependence. |
| R 45; A 63, 119, 166 | Large N, independence and representativity risk being conflated; inferential validity and generalizability are different questions. | Larger samples reduce sampling noise under the model, but do not automatically cure selection bias. Separate sampling, assignment and model assumptions. |
| A 70 | SEM-overlap rule is presented too generally, especially for paired data. | Use a CI for the actual contrast and preserve covariance; avoid universal overlap rules. |
| A 35 | Median preference for asymmetric/outlier-containing data is too categorical. | Choose a summary and estimand for the scientific question and distribution; robustness alone does not determine what quantity matters. |
| A 40 | Variance described as a mean squared deviation leaves the sample/population denominator distinction unclear. | Distinguish descriptive variance from the n−1 sample estimator, briefly and explicitly. |
| A 125–129, 143, 146; R 54–55 | Normality/variance decision trees can invite mechanical preliminary testing; paired-test normality is attached to “values.” | For paired inference discuss the distribution of independent differences. For independent groups motivate Welch where appropriate. Small samples cannot establish normality through a failed diagnostic test. |
| A 144, 191–192; R 62 | Pairing and two-level block designs are described as broadly superior/ideal. | Explain conditions for precision gains and the need for enough independent blocks. Pairing must follow design, not be created after looking at outcomes. |
| A 147–148 | Power 1−beta is described as the probability of Type II error; fold-change planning lacks a clearly stated scale. | Beta is Type II error; 1−beta is power at a specified alternative. Specify the effect and SD on the same scale and state whether N counts pairs or units per group. |
| A 170 | FDR description omits expectation and may sound like a guarantee about the realized discovery list. | Define FDR as E[V/max(R,1)] and explain it verbally; retain formulas in notes if needed. |
| R 64 | 1−(1−alpha)^k appears without conditions. | Label it as the probability of at least one false rejection for independent tests when all k nulls are true and each has size alpha. Correlated endpoints require different reasoning. |
| A 169–170 | Holm/BH distinction and dependence assumptions need elaboration. | Holm controls FWER with valid marginal p-values under arbitrary dependence. Standard BH FDR control requires independence or appropriate positive dependence; do not promise control for every dependence pattern. |
| A 173 | ANOVA described as avoiding multiple-testing corrections may imply all later comparisons are protected. | Separate omnibus inference from planned or post-hoc contrast families; follow-up claims still need an appropriate multiplicity strategy. |
| R 10–11, 69–70 | Exploration/screening described in broad negative terms; numerical N shorthand can become an unjustified rule. | Teach exploration as useful for generating hypotheses; its selection process changes confirmatory interpretation. Do not define validity using one fixed sample-size threshold. |
| R 61; A 192 | Design language suggests biases are eliminated or complex studies inherently have less power. | Say which sources of bias/variation an allocation or safeguard addresses. Compare power only for a stated estimand, covariance structure and resource allocation. |
| A 190 | Embedded textbook block-design passage contains strong general claims and a third-party figure. | Redraw a simple allocation diagram and review model assumptions separately; do not reproduce the passage wholesale. |

## Material deliberately outside the six-hour route

- A 5: conventional course order; 7–9 and 133–135: software discussion/screenshots; 85–88: extended sheep analogy; most of 149–160 and 174–185: test catalogues and software output. Keep only a question-motivated reference if later needed.
- R 76–112: public-transcriptomic-data tools, infrastructure and workflows. The short course's omics connection is multiplicity and independent confirmation.
- D 46–50 and 54–55: extended clinical/observational study examples and article-reading exercises. Useful for a medical extension; they would displace the wet-lab narrative here.
- Political polling, BMI populations and published disease findings are not necessary evidence for this fictional assay. Do not carry forward scientific claims simply because they appear in a supplied slide.

## Implementation references checked

The following official R documentation supports the proposed later implementation, independently of the old slides:

- [t.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/t.test.html): paired and independent procedures; Welch is the default independent-group procedure when equal variances are not requested.
- [power.t.test](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/power.t.test.html): prospective planning inputs and one-sample, paired and two-sample designs. For complex dependence, a design-specific simulation will be needed instead.
- [p.adjust](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/p.adjust.html): Holm/Bonferroni and BH/BY methods, their different error targets and dependence considerations.

These references support methods, not biological claims. Detailed factual claims from embedded papers remain unverified and are not proposed as course evidence.
