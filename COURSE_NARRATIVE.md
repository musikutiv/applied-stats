# Applied Statistics for Life Scientists
## First version: two sessions of three hours

**Status: planning draft for review. No slide deck or analysis code has been authored.**

Audience: PhD-level wet-lab life scientists who have collected experimental data but have little formal statistical training. Teaching language: English. No R knowledge or software installation is required of participants. R is used only behind the scenes during course preparation to generate reproducible figures. During teaching, the instructor presents finished plots and staged visual reveals: no live R execution, code, console output or software walkthroughs.

Each session is 180 minutes including one 15-minute break: **330 minutes of learning, discussion and exercises, plus 30 minutes of breaks**. Activities are included in the section budgets, not added afterwards. The proposed deck has 64 core slides across both sessions, including exercise prompts and session opening/closing slides. Progressive fragments do not count as additional slides.

## The story

“I performed an experiment, collected data, and now I want to know whether my result is real.”

Begin with an enzyme-activity assay and the raw observations. Ask what conclusion the audience would draw. Then reveal the laboratory notebook: which preparation each measurement came from, which conditions were compared, and on which day they were measured. The first obstacle is interpreting the experiment that produced the numbers.

Across the course the question evolves:

1. What did I actually repeat?
2. What question did I intend to answer?
3. Which experiments, preparations and conditions should my claim cover?
4. What pattern is present in the raw data?
5. How large is the estimated effect, and how uncertain is it?
6. How surprising would these results be under a specified no-effect model?
7. What could an inconclusive result still be compatible with?
8. How could the next experiment answer the question more clearly?
9. What changes when I search many endpoints or analyses?
10. What will I commit to before collecting the next dataset?

The recurring message is: **statistical reasoning is part of designing an experiment capable of answering a question.**

## One experiment, several deliberate reveals

Use a fictional compound and a generic enzyme-activity endpoint. All newly generated values must be labelled simulated; no efficacy or biological mechanism is asserted.

**Starting experiment:** six independently initiated culture preparations of one specified cell line, each split into two culture vessels. Within each preparation, randomly assign one vessel to vehicle and one to compound. After a fixed incubation, make three technical assay readings from each vessel's lysate. Run two preparation pairs on each of three days, with both conditions on every day. Retain preparation, vessel, day and technical-reading identifiers.

This gives 36 readings, 12 treatment-assigned vessels and six paired biological contrasts. The vessel is the treatment-assignment unit; the preparation defines the pair. Technical readings from a lysate do not constitute independent treatment replications. Report all these counts rather than an unexplained “N = 36.” In the deliberately simplified teaching simulation the six paired contrasts are independent; a shared additive day shift cancels within a pair. A treatment-by-day effect would break that simplification and motivate a richer design and analysis.

The target claim is initially narrow: the average compound-versus-vehicle difference in enzyme activity for independently initiated preparations of this cell line under specified culture and assay conditions. Repeating one cell line does not sample donors or establish an effect across cell types. The population discussion asks what would need to change to support those broader claims.

**Reveals and variants:**

- First show the 36 observations; reveal identifiers before calculating an interval or a test.
- Use a separate, explicitly labelled faulty layout with all controls on one day and all treated samples on another to expose confounding. Do not imply analysis can recover a treatment effect from complete treatment/day confounding.
- Start with the mean within-preparation difference as the estimand. Introduce a positive, multiplicative assay variant only to explain ratios and log fold changes. Back-transformed mean log ratios describe a geometric mean ratio, not an arithmetic mean difference.
- Use repeated simulated experiments to distinguish measurement spread from estimator uncertainty.
- Use preselected low-precision and higher-precision scenarios to discuss inconclusive results. Never manufacture a dataset by repeatedly simulating until it produces a desired p-value without disclosing that selection.
- Expand to many simulated endpoints only after the single-endpoint question is understood.

The old three-day enzyme exercise (AppliedStats pp. 73–74) supplies the opening puzzle, not a complete experimental protocol. Its “day” labels alone cannot establish independence. The new case supplies the missing provenance explicitly. The clone example (pp. 137–144) supplies a short transfer exercise about pairing and ratios.

## Session 1: What can I claim from this experiment?

The first session follows the experiment backwards to its question and sampling process, then forwards to its estimated effect. Learners identify the units, delimit the claim, inspect raw data and distinguish variability from uncertainty. It closes with a short results statement containing the effect, interval, replication structure and scope of inference.

The teaching priority is to stop participants from treating every plotted dot as independent evidence. Definitions appear only when needed to resolve the assay problem. Mean, median, quantiles, variance, SD and IQR receive one compact visual treatment; they do not become a separate textbook chapter.

## Session 2: What should I do next?

The second session begins with the effect and interval from session 1. Testing is introduced as a conditional question about data under a null model. Power explains why an experiment may remain inconclusive. Design then becomes the practical response. Multiplicity broadens the problem from one prespecified endpoint to a search across endpoints, comparisons and analysis choices.

Participants finish by writing a one-page plan for the next experiment. This is the course's assessed product: a question, estimand, target population, assignment unit, independent replication, endpoint, allocation, sample-size rationale, exclusions and analysis plan.

## What six hours can reasonably deliver

**Practice to competence:** identify experimental units and dependence; distinguish technical and biological replication; state a bounded claim; interpret raw plots and effect intervals; distinguish absence of evidence from evidence of negligible effect; propose a credible next design.

**Introduce and interpret:** null distributions, p-values, Type I/II errors, power, log ratios, FWER versus FDR, and the purposes of Bonferroni, Holm and Benjamini–Hochberg. Participants need to explain the decisions these ideas support, not reproduce algorithms from memory.

**Defer:** derivations, a probability chapter, software tutorials, test-selection flowcharts, full ANOVA/post-hoc workflows, mixed-model fitting, nonparametric test catalogues, detailed omics pipelines and formal sequential methods. Fisher's exact test and nonparametric alternatives can appear later in optional reference material if the audience's experimental questions require them. They have no scheduled mini-lectures here.

The paired t procedure arises from the paired assay contrast. Welch's t procedure is briefly contrasted when a genuinely independent two-group design is posed. ANOVA is named only when the many-group question arises. No test catalogue structures the course.

## Teaching rhythm and evidence of learning

Use a prediction, one plot, a short explanation and an audience decision. Ask for pair discussion before revealing an answer. Keep equations subordinate to the experiment and put technical assumptions in speaker notes. Plot raw observations before summaries; label SD, SE and confidence intervals explicitly; avoid significance stars.

Session 1 exit task: write a three-sentence result and one limitation. Session 2 capstone: redesign the assay, then exchange plans and challenge the claimed N and population. Use a short rubric: a correct unit/replication structure, a clear estimand and population, justified allocation and N, and a prospective analysis/reporting plan.

If discussion overruns, shorten the clone/log-ratio transfer example and the algorithm details of multiplicity. Preserve the unit-of-analysis exercise, CI interpretation, the distinction between nonsignificance and no effect, and the final redesign. No mandatory homework is needed to make the six-hour version coherent.

## Source policy and review boundary

The three supplied PDFs were inspected by page-wise text extraction; selected case-study and definition pages were also rendered and visually checked. This is a content planning review, not a complete audit of every image, cited paper or numerical result. Source locations and issues are recorded in CONTENT_MAP.md using physical PDF page numbers.

Reuse teaching ideas and reconstruct figures from documented simulation code where possible. Do not silently reuse published biological claims, unexplained numerical examples, third-party screenshots or problematic definitions. The correction register is for instructor review before slide drafting.

The current deliverables are this narrative, COURSE_OUTLINE.md, CONTENT_MAP.md and QUARTO_STRUCTURE.md. The proposed implementation remains a proposal until this planning stage is reviewed.
