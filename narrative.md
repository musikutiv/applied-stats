# Applied Statistics Workshop — Full Instructor Narrative

*Verbatim script extracted from all `:::notes` blocks. Slides are listed in presentation order with elapsed time. Interaction slides are marked* **[INTERACTION]***.*

---

## SESSION 1

---

### BLOCK 1 · The Experiment (00:00–00:37)

---

**Is my result real? — 00:00–00:02**

Give only the three statements on screen. Do not supply a cell line, dose, time, control, plot or protocol yet. This is an incomplete fictional lab report, worded the way a methods section or figure legend typically reads. Ask what the audience would need to know before interpreting it. Let someone question “replicates”; do not immediately define it for them. If necessary, ask what exactly was repeated six times.

*(Context not yet revealed: L1 is a human cell line stably expressing kinase Q. Compound Q is a selective ATP-competitive inhibitor of kinase Q. The assay measures kinase Q activity (substrate phosphorylation rate, U/mg protein). These details are revealed progressively from slide 3 onward.)*

---

**Six of what? — 00:02–00:06** [INTERACTION]

Give pairs two minutes to propose at least two meanings, without revealing the examples. Advance once to display the possibilities. Use two minutes to hear what information would distinguish them. All are plausible uses of the word. Do not yet say which one applies, introduce technical vocabulary or ask for a numerical N. The next slide provides the first notebook detail.

---

**What exactly did we do? — 00:06–00:09**

First trace one culture preparation and its two tubes. Random assignment chooses which tube receives vehicle and which receives Q. The material is harvested after 24 hours. Ask where repeated measurements might enter. Then reveal the assay branch: each tube provides one lysate, assayed in three aliquots — technical triplicates, a detail the opening report did not even mention. Stop at this one preparation. Do not yet reveal how the six “replicates” were generated, the total counts or the day layout.

---

**The tube is the experimental unit — 00:09–00:11**

The treatment enters at the tube level. That makes the tube the experimental or treatment-assignment unit here. Allocation is constrained within each preparation: one tube gets vehicle and one compound. The preparation is a block, so the two tube outcomes share a history. Later we compare them within that pair.

---

**What is N here? — 00:11–00:18** [INTERACTION]

Reveal that the same split was repeated with six cultures initiated and maintained separately, all from L1. Allow two minutes to draw the hierarchy and decide on counts. Spend three minutes hearing explanations before revealing the 36/12/6 answer. Use two further minutes to ask what each number counts. Each preparation contributes a vehicle-versus-Q comparison. Do not announce that the six comparisons must be independent; we have not yet inspected what they share across days. Ask for a report with nouns, not a bare N.

---

**Technical and biological replication are different — 00:18–00:22**

Use two minutes for the audience to explain what each repetition tells us and two minutes to debrief. Repeating the assay helps us examine the measurement process. Independently initiated preparations let us see variation in the biological system as defined here. Neither is useless; they answer different questions. All preparations remain from cell line L1. Return to the question on screen: six preparations can speak to repetition within this system, while three assay aliquots alone cannot establish repetition across preparations.

---

**What does the control actually control for? — 00:22–00:26** [INTERACTION]

Ask for one minute of thought and discussion before the reveal. Both tubes have the same solvent concentration and handling. The contrast isolates the addition of compound Q relative to this vehicle condition within the design. We do not have an untreated arm, so we cannot separately estimate the solvent's effect. The endpoint is enzyme activity in the lysate, expressed per mg protein. Use the extra minute to ask “What claim does this experiment permit?” and compare an endpoint claim with a direct-mechanism claim.

---

**How many data points do we really have? — 00:26–00:28**

We just established the 36/12/6 hierarchy. Now ask: if someone analysed all 36 readings as 36 separate biological observations, what would happen? The analysis would appear very precise — narrow uncertainty, confident conclusions — but that precision would be false, because most of it reflects measurement variation within a single lysate, not biological variation across preparations. This is not a rare mistake; it has a name — pseudoreplication — and it appears routinely in the literature. The point to land before the exercise: counting measurements is not the same as counting independent biological events. Two readings can look completely separate — different well positions, different labels, different numbers — and still carry the same biological information if they came from the same source. The exercise on the next slide asks exactly that question.

---

**Which observations are independent? — 00:28–00:31** [INTERACTION]

Use one minute of pair discussion and two minutes of debrief. A shares a lysate; B shares its preparation and possibly day; C can share day conditions. Do not simply label C independent. Independence is about the process and model, not the distance between dots or their different identifiers. For C, introduce only that some preparations were measured on the same day. The next slide reveals the full day layout. No numerical plot is needed: the shared sources follow from the experimental history.

---

**Each day: two preparations, both conditions — 00:31–00:34**

This is the final notebook reveal: two preparation pairs on each day, with both conditions in every pair. Ask the audience to trace one within-day comparison. A change in conditions between days is a batch effect. If a day adds the same amount to both conditions, subtraction removes that component. Ask what happens if Q's response itself differs by day.

---

**What if controls ran on Monday? — 00:34–00:37**

Explicitly announce that this is not our actual protocol. It is a hypothetical scheduling shortcut. Give pairs time to identify the missing comparison. Without within-day treatment comparisons, a difference could arise from treatment, day, or both. Label this confounding only after the audience explains the problem. Give the layout comparison its full three minutes. Close the first 35-minute section with “What claim does this experiment permit?” A treatment-specific claim cannot be separated from a day effect in this alternative layout.

---

### BLOCK 2 · The Question (00:37–01:18)

---

**What does “the compound works” mean? — 00:37–00:40**

We can now describe the experiment, but what was it intended to establish? Read the lab-meeting claim aloud. Invite two interpretations of “works.” Then reveal the endpoint. This assay addresses activity in a particular preparation under particular conditions; it does not by itself demonstrate a mechanism or clinical benefit.

---

**What prediction led us to this assay? — 00:40–00:44**

Walk through a possible rationale for this experiment. An earlier exploratory pilot might have suggested lower activity. A new experiment could then assess a stated prediction. This is a hypothetical history, not evidence that our current dataset was prospectively planned. We would need a dated plan to know that. Ask which parts of this chain were documented before the experiment; keep the discussion on the research question rather than analytical methods.

---

**What quantity are we trying to learn? — 00:44–00:47**

We need to state the quantity we want to learn about. Within each preparation, compare the activity with Q against its vehicle tube. Then our target is the mean of that difference across the relevant population of preparations under these conditions. Keep the language as “the quantity we want to learn.” Do not introduce a technical name or teach how to compute an average. The target is the average biological change across relevant preparations, not the number of measurements. We are defining the question, not summarizing data.

---

**How would you rewrite the claim? — 00:47–00:54** [INTERACTION]

Give pairs three minutes to formulate a question. Spend four minutes comparing two versions and refining their scope. One acceptable answer: “We want to know whether 10 µM Q, compared with matched vehicle, changes mean enzyme activity after 24 hours across independently initiated preparations of cell line L1 under the specified culture conditions.” Keep a short written version on paper; there is no coding task. Ask what magnitude would matter biologically, but defer numerical threshold selection to later design work.

---

**Did we predict it, or notice it? — 00:54–00:57**

Ask when this endpoint, dose, time and analysis were chosen. If the assay was one of many results inspected before choosing the claim, that is exploration. Its discovery is useful. To assess a prediction without reusing its selection evidence, plan a new appropriate experiment. A dated plan makes chronology visible, but it does not automatically guarantee good design.

---

**Which future experiments should this inform? — 00:57–01:01**

Six preparations are the ones we observed. Our question usually reaches beyond them to preparations we might make next. That collection of possible preparations, under defined culture and assay conditions, is a target population. It need not be a population of people. Ask which conditions should be held fixed and which may vary within the claim.

---

**A central purpose of experimentation — 01:01–01:02**

Land this as one declarative statement. Do not open a discussion. Statistical inference does not generalise to patients—it characterises the variability of this protocol, in this cell line, under these conditions. If a researcher cannot say what another six preparations would plausibly show, they cannot yet call their result scientific. This sets up every number in the second half of Session 1: the mean tells us the centre, the CI the range a repetition should produce, the test how compatible that centre is with zero effect. Move directly to the next slide.

---

**What population would you claim this applies to? — 01:02–01:10** [INTERACTION]

Three minutes in pairs, three minutes hearing two arguments, two minutes to debrief. A is the intended narrow target, not a guaranteed extrapolation. Ask whether the six preparations and three days cover the conditions they mean by “these conditions,” and whether selection, QC or unrecorded batches matter. Fold the previous separate scope-of-replication slide into this debrief: repeated preparations of L1 cover preparation variation; other cell lines or donors require additional biological sampling, and a claim across laboratories needs evidence relevant to laboratories. More assay readings of these lysates cannot supply those missing systems. B requires sampling additional biological systems. C requires a much broader chain of evidence; do not turn this into a clinical-trial lecture.

*(Note: The takeaway "What would you need to know before choosing A?" is a fragment — it does not appear until you advance. Do not read it aloud at the start of the discussion.)*

---

**What must we know before drawing an inference? — 01:10–01:15**

Use two minutes for paired retrieval, then three minutes to collect concise answers. Unit: treatment-assigned tube. Comparison: 10 µM Q versus matched vehicle after 24 hours. Repeated: six independently initiated L1 preparations, with three assay aliquots per lysate. Shared variation: lysate, preparation and day. Quantity: the average within-preparation Q-minus-vehicle activity difference. Space: further L1 preparations under specified culture and assay conditions, with scope depending on what was sampled. These six questions retrieve existing ideas; introduce no new method or calculation.

---

**What claim does this experiment permit? — 01:15–01:18**

Use one minute to revisit the distinction and two minutes for the closing audience response. Ask whether random assignment also makes the sample representative. Random assignment within each preparation helps protect the treatment comparison from systematic allocation bias. It does not turn a convenience selection of one cell line into a sample of all donors or cell types. Chance imbalance and other biases can still occur. Ask the class to finish two short sentences: “Our comparison is…” and “Our claim covers…”. Complete the opening block after their answers. The following bridge carries these design questions into the data.

---

### BRIDGE · Response and Break (01:18–01:38)

---

**Which observations describe the treatment response? — 01:18–01:23** [INTERACTION]

The opening block is complete. Use the five minutes before the planned break to connect its design to the observations we will describe. Give pairs two minutes to identify the relevant change and three minutes to debrief. Each tube contributes the arithmetic average of its three technical readings; no aliquots were omitted. Each preparation then supplies one Q-minus-vehicle comparison. This preprocessing respects the simple balanced assay design. The term average is familiar language here; its definition comes later. Ask which experimental space the six preparations cover. No result is revealed until after the break.

---

**A pause before we look at the data — 01:23–01:38**

Pause for the full 15 minutes. Resume the session at elapsed time 01:38. This is a break screen, not a core teaching slide.

---

### BLOCK 3 · Reading the Data (01:38–02:19)

---

**What do the data actually look like? — 01:38–01:41**

Welcome back. These are the established data, now displayed as twelve tube values forming six biological comparisons. Each dot averages the three technical assay readings from its lysate. Ask for descriptions before explaining the pattern. Four pairs decrease, P2 is almost unchanged, and P5 increases. Do not equate lower activity with therapeutic benefit. P2 differs by only about 0.003 U/mg before display rounding.

---

**How large is each preparation’s change? — 01:41–01:44** [INTERACTION]

Use one minute of paired observation and two minutes for a debrief. The horizontal reference marks equal observed activities in a pair. Negative values mean lower activity with Q. Four reductions range from about 6 to 24 U/mg, one comparison is nearly unchanged, and P5 goes upwards. P4 has the largest reduction. The downward direction appears in several preparations, not just P4. P5 is worth asking about; an opposite direction is not itself proof of a mistake. No deletion or formal leave-one-out procedure is needed.

---

**What would one number leave out? — 01:44–01:46**

Ask which question the previous graph made them want to answer. Then reveal the short names for those properties. These labels organize their observations rather than precede them as definitions. With only six changes, we can describe the arrangement we see but cannot establish a stable underlying shape.

---

**Which number would stand in for these six? — 01:46–01:48** [INTERACTION]

Give one minute to choose a representative number and one minute to hear two explanations. Ask for a rule, not just a guess. The display orders the changes but retains preparation IDs. Do not identify a correct summary yet; the next slide compares two reasonable questions.

---

**The average and the middle answer different questions — 01:48–01:51**

The mean is -10.4 U/mg and uses every observed magnitude. The median is -11.9 U/mg: with six observations, it is halfway between the third and fourth ordered changes, about −17.68 and −6.18. Use the dots to illustrate the average as a balance point and the median as the middle position. The mean is a natural description of an average quantitative change, especially with approximately symmetric values; the median describes the middle. Our original scientific question concerned an average difference, so retain that distinction rather than swapping targets for a nicer number.

---

**What is a quartile? — 01:51–01:52**

Quartiles divide sorted data at the 25%, 50% and 75% positions. Q2 is the median we just used under a different name. Q1 is the boundary below which 25% of values fall; Q3 is below which 75% fall. Do not explain the exact algorithm — it depends on n and the software convention. The next slide shows what happens when one value is extreme; the slide after this block uses Q1 and Q3 to describe spread.

---

**What if one preparation were extreme? — 01:52–01:55** [INTERACTION]

Before advancing, allow a minute to predict what happens when P5 alone moves from about +6.0 to +66.0 U/mg. The other five changes stay fixed. Reveal both summaries together. Mean moves from -10.4 to -0.4, a 10-unit shift because a total increase of 60 is shared over six observations. Median stays at -11.9 because the two middle ordered values stay the same. The hypothetical scenario raises all three Q aliquot readings for P5 by 60 before aggregating, so the displayed change has a consistent underlying construction. It is not a newly observed result.

---

**An unusual preparation needs a question — 01:55–01:57**

Return explicitly to the original six changes, not the hypothetical extreme. P5 went in the opposite direction; that is a prompt to inspect metadata, not grounds for automatic deletion. A large change could reflect biology, a handling event or a measurement problem. Any exclusion needs a defensible documented reason, preferably a prospective QC rule. The original dataset remains intact. Do not propose that the median substitutes for investigating the experiment.

---

**Do the preparations all tell the same story? — 01:57–02:00**

Begin with the need to describe how much the preparations disagree. The full observed span runs from about -23.7 to +6.0 U/mg. Its width is 29.8. Quartiles locate the 25% and 75% positions in the ordered values; their distance is the interquartile range, 18.6. It focuses on the central part rather than the two extremes. Do not derive a quantile algorithm. At n=6 there are several conventions and positions may be interpolated: our R type-7 quartiles are Q1=-20.0975, Q3=-1.5425. This does not mean exactly three observed dots must lie between the displayed boundaries.

---

**How far do changes lie from their mean? — 02:00–02:03**

Point to the mean line and the distance to each preparation’s change. Squaring distances makes them nonnegative and gives large deviations greater influence. Sample variance sums these squared deviations and divides by n−1, here five; its value is 147.5 in squared activity units. SD is its square root, 12.1 U/mg. Mention the sample denominator once in speech if needed, with no derivation or exercise. We are describing spread among the six changes, not the precision of their mean. Avoid a percentage-within-one-SD rule for these six values.

---

**Could these have the same mean and SD? — 02:03–02:06** [INTERACTION]

Give a minute for the audience to compare the structures before revealing the matching summaries. These are deliberately constructed sets of six changes, not additional measured preparations. They use the original six changes’ exact mean and sample SD as targets. Identical values are stacked so every point remains visible. The first is distributed across the scale. The second has five equal values and one separated value. Spend the remaining time asking what the two numbers failed to convey. Do not extend into an Anscombe or Datasaurus history.

---

**Which plot preserves the information we need? — 02:06–02:09**

The paired plot preserves both activities and the relationship within a preparation. The boxplot summarizes the six differences rather than treating the two conditions as unpaired groups. Explain that the box runs from Q1 to Q3, and its central line is the median. Whiskers extend to observed values within 1.5 IQR of the quartiles; here they reach the observed extremes. All six points are shown, including those overlaid near the median or whiskers. With six changes, the raw observations carry essential information. A boxplot alone would hide it. Do not read its whiskers as a precision interval or treat points outside whiskers as automatic errors.

---

**What most papers show — 02:09–02:11**

This is the most common figure type in cell biology publications. Bars show the group mean; error bars are ±1 SEM; individual points are jittered to reduce overplotting. Ask the audience what they can no longer see. The within-preparation structure is invisible: there is no way to tell that P1 vehicle and P1 compound came from the same culture. The scatter looks similar between groups, but that masks the consistent direction of the differences. The large visual space from zero to about 80 U/mg communicates nothing about the biology. This is not a dishonest figure — it is a lossy one.

---

**What does n = 6 actually count? — 02:11–02:13**

Read the summary with its full unit description. These six are preparations of L1, not six cells, assay aliquots, donors or days. Each change compares Q against the matching vehicle. Three technical measurements per tube were averaged before making each contrast. The preparations were run as two pairs on each of three days. Keep the earlier shared-day qualification: independent initiation alone cannot prove independent responses if the day alters the treatment response.

---

**How would you describe this result to a colleague? — 02:13–02:16** [INTERACTION]

Give one minute to write and one minute to hear a response. Reveal one acceptable description for the final minute. Four preparations decrease, P2 is nearly unchanged, P5 increases; the largest decrease is P4. The mean is -10.4 and SD 12.1 U/mg. Participants may additionally use median -11.9, IQR 18.6, or the observed span if they say what those summaries describe. They should not imply that every preparation decreased or that Q has a proven mechanism. Ask whether the wording faithfully preserves heterogeneity.

---

**What can we describe before going further? — 02:16–02:19**

Use two minutes for a brisk retrieval round. Identify the direction and magnitude of observed changes, their spread and inconsistency, and the six preparation-level comparisons. Ask what those comparisons might still share across days. Six independently initiated preparations are the counted units; independence of responses also depends on the generating process. In the final minute reveal the question about precision and pause before the next block. An observed effect here means a descriptive difference, not a claim that the treatment mechanism has been established. Invite a prediction; the following repeated-experiment block develops the answer.

---

### BLOCK 4 · Effect and Uncertainty (02:19–02:56)

---

**Six preparations give one estimate — 02:19–02:21**

Return to the six unchanged paired changes. Each is a Q-minus-vehicle contrast after technical repeats were averaged within each tube. The vertical line is their mean, −10.4 U/mg. Our target is the average paired effect across the specified L1 preparation process. The sample gives an estimate of that quantity, not its known population value. Preserve the culture conditions, dose and 24-hour endpoint from the opening.

---

**If we repeated the experiment, would we get the same answer? — 02:21–02:23** [INTERACTION]

Allow a minute for predictions, then hear two explanations. Repeating means six newly initiated preparations, again split between vehicle and Q, with the same technical averaging. Ask whether variation among the new preparations can move the estimated mean even when the underlying response mechanism stays unchanged. Do not show simulation results until participants have predicted.

---

**New preparations, new mean — 02:23–02:26**

Trace one row: six paired changes become one diamond. Then compare three rows. These are the first three repetitions from the fixed seed, not selected examples. In our teaching simulation we know the true average: −14 U/mg. The experiment’s estimate need not equal it. This value was already in the original data-generating model; it was not fitted to −10.4. The generator preserves normal preparation effects (SD 9), tube errors (SD 3), three technical errors (SD 2.5) and two-decimal assay rounding. Shared additive preparation and day baselines cancel in paired differences, apart from negligible rounding. There is no treatment-by-day variation. Real experiments do not give us a known truth.

---

**What happens when we collect the means? — 02:26–02:29**

Reveal 10, then 100, then 10,000 accumulated means. Each comes from six newly generated paired changes. The frequency scale is a fraction of experiments so panels remain comparable as repetitions accumulate. Point to the fixed −14 line. Name this the sampling distribution of the mean. This is not the shape of our original six measurements, and it is not a probability distribution for possible true means. Simulation approximates what repeated sampling under the known model would generate; it does not turn our one observed experiment into 10,000 real replications.

---

**Preparations vary more than their mean does — 02:29–02:32**

Spend one minute asking what one contribution represents on each side. The left pools preparation responses from the repeated simulations; the right contains one mean per experiment. Both horizontal axes are identical. The spread of the means is the standard error of this estimator. Simulated response SD is about 10.2 U/mg; simulated SD of means is about 4.1 U/mg. These are model repetition results, not the original sample’s SD of 12.1 or its estimated SE. Variation among individual responses and variability of their estimated average answer different questions. This is not a recommendation to replace raw observations with SEM error bars.

---

**How can one experiment estimate that spread? — 02:32–02:34**

Only now show the formula. The true SE uses the population SD; we estimate it by substituting the sample SD. Using full precision, 12.1445/sqrt(6)=4.9580 U/mg. Display rounding gives 5.0. This estimate need not equal the simulated long-run SE of about 4.1: the six observed responses are themselves a variable sample. The formula requires independent, identically distributed contrasts with finite variance. It is not automatically valid for shared treatment-by-day responses, clustered preparations, or correlated repeated measures. Normality is not needed for this variance identity; the small-sample t interval introduced next uses a stronger distributional assumption.

---

**What would make the answer more precise? — 02:34–02:37** [INTERACTION]

Ask for predictions about doubling biological response variability and about increasing independent preparations from six to 24, then reveal the plots. Keep the true mean fixed. In the variability scenario only preparation-effect SD rises from 9 to 18; tube and technical variation stay unchanged, so total SD does not exactly double. Empirical SE rises from 4.1 to 7.6 U/mg. With 24 preparations it falls to about 2.1. This larger experiment uses twelve days with two pairs per day, retaining the same additive-day assumption. Four times as many independent preparations roughly halves SE. More technical readings may reduce technical noise, but cannot substitute for new preparation responses. More n improves precision under this model; it does not fix biased sampling or broaden the cell-line claim.

---

**Can we show a range around our estimate? — 02:37–02:39**

Motivate the range before revealing it. An interval combines the best estimate and uncertainty in that estimate. This is a paired t interval, calculated on the six differences, not separate intervals around vehicle and compound. The offline calculation is mean ± qt(0.975,5) × sample SD/sqrt(6), with multiplier 2.5706 and margin 12.7449 U/mg. At n=6 a generic two-SE shortcut is too narrow. Explain the method’s name briefly without a derivation. Exact nominal coverage requires independent normal differences; the existing Gaussian generator meets this before negligible measurement rounding. Six observations cannot establish approximate normality. Real data would require substantive checks of the model and dependence.

---

**Would the intervals keep finding the true mean? — 02:39–02:43**

Give a minute to inspect the fixed vertical line and moving intervals. Trace one interval that contains the line and one that misses it. Every repetition uses six preparation changes, its own mean and SD, and the same t multiplier for five degrees of freedom. The figure shows the first 60 without selecting a desired pattern. Then reveal that 95.3% of 10,000 intervals contain the fixed true −14 value. This proportion is a Monte Carlo result, not a target enforced by searching seeds. It need not be exactly 95%, especially among the 60 shown. The method is assessed across hypothetical repetitions, though in the lab we ordinarily obtain only one interval. Known truth is available only because this is a simulation.

---

**What does our interval tell us? — 02:43–02:46**

Point to the numbers first. Minus twenty-three to plus two. Those are the effect sizes we cannot dismiss with this data. Ask participants: does that include zero? Yes. Does it include a ten-unit reduction? Yes. Does it include a twenty-unit reduction? Yes. Everything in that range is compatible with what we observed. The 95% does not mean there is a 95% chance the true effect is somewhere in that interval — the true effect is a fixed number, not a random variable. What varies is the interval itself: if we ran the experiment again, we would get a different interval. Roughly 95% of all such intervals, across many repetitions, would catch the true value. But we do not have many repetitions — we have one, and it either caught it or it did not. The practical message: report the interval, and read it as a range of plausible values.

---

**Same estimate. Which answer is more precise? — 02:46–02:48** [INTERACTION]

Let participants identify the identical centers before comparing widths. Both point estimates are −10 U/mg, but one allows a much wider range of mean effects. Precision is represented by width, not by how far the estimate lies along the axis. These are constructed illustrations, not selected repetitions or new assay results. Their endpoints are not being used as a binary decision or a rule based on overlap. Interval width alone says nothing about whether an experiment is unbiased.

---

**Is a large effect always precisely known? — 02:48–02:50**

Separate two questions explicitly. The larger estimated reduction is much less precisely located; the smaller estimated reduction is more precisely located. Ask which would matter biologically and accept that we need context and a relevant-effect scale. These hypothetical values do not define a relevance threshold for L1. A precise small estimate is not automatically useful; a large uncertain estimate can still motivate work. Do not compare interval overlap or introduce a binary classification.

---

**What can we now say about compound Q? — 02:50–02:53** [INTERACTION]

Give a minute for pairs to formulate a statement, then debrief. Our best estimate is an average reduction of about 10.4 U/mg. The interval ranges from a reduction of about 23.2 to an increase of about 2.3. Under the stated model, substantial reductions as well as near-zero and small positive average changes remain compatible at this confidence level. Whether that range is useful depends on the biologically relevant magnitude; we have not supplied a validated threshold. Do not turn this into works/does not work. Do not treat the simulated truth as information available from a real assay. The interval concerns the defined L1 preparation process, not patients, other cell lines or all laboratories. Shared treatment-by-day variation would undermine the simple calculation. No point was removed.

---

**Report the estimate and its precision — 02:53–02:55**

Many papers still report mean ± SD when describing a treatment effect. The SD is a correct description of preparation-to-preparation variability, but it does not address how confidently the mean has been estimated. If the question is "how large is the effect, and how well do we know it?", the SE or CI is the relevant quantity. A wider CI from six preparations tells the reader more about the reliability of the estimate than an SD does. SD remains appropriate when the goal is genuinely to characterise variability — for instance, describing how heterogeneous a cell population is. The choice depends on the claim.

---

**One question to carry forward — 02:55–02:56**

Read the question and pause before continuing. The completed block has distinguished preparation variation, variability of an estimator, and uncertainty about a fixed population mean. The next teaching block begins with the question on screen; leave its explanation to that block.

---

### BLOCK 5 · The Null Model (02:56–03:29)

---

**Could this result arise if there were no effect? — 02:56–02:58** [INTERACTION]

Reconnect to the unanswered question. Invite predictions before the reveal. Keep the six observed differences and −10.4 estimate unchanged. Change only the mean effect in the simulation from −14 to zero. Biological effect SD remains 9, tube SD 3 and technical-reading SD 2.5; pairing, triplicate averaging and assay rounding remain. Positive and negative preparation effects can still occur. Do not name the null hypothesis yet. This is a hypothetical generating model, not a conclusion about compound Q.

---

**Zero on average does not mean zero every time — 02:58–03:00**

Trace the six dots and the diamond in each row. These are the first three repetitions from seed 20261006, not selected examples. New preparations give nonzero means despite a fixed population average of zero. Use the same within-tube averaging and Q-minus-vehicle subtraction as for our observed experiment. The fixed line belongs to the hypothetical model; the diamonds belong to particular samples.

---

**What would the no-effect model produce? — 03:00–03:03**

Accumulate 10, 100 and 10,000 means before naming the distribution on a final click. Define a null distribution as the distribution of the statistic across repeated experiments if the null hypothesis and model assumptions were true. Then name H0: the population mean paired effect is zero. The horizontal axis is in the same units, with the same 36-unit span and one-unit bins as the previous sampling-distribution sequence, now centered on zero. It is not a histogram of six observations and not a distribution of probabilities that hypotheses are true.

---

**Does our observed mean look ordinary here? — 03:03–03:05** [INTERACTION]

Allow a short visual judgment before introducing any probability. The observed mean is toward the left of the simulated cloud. Ask what controls its distance from the center relative to the cloud’s width. Do not quote the fraction of raw means beyond this line as the paired t p-value. This raw-mean simulation uses a known generating spread; the real analysis estimates spread from six differences. The next slides make that transition explicit. No probabilities of hypotheses are being shown.

---

**Is −10.4 equally surprising in every experiment? — 03:05–03:07**

Compare the identical estimates with estimated SEs of 2 and 10. These are constructed illustrations, not alternative analyses of our six observations. The same raw mean is many SEs from zero in one and about one SE from zero in the other. The short lines are explicitly one-SE spans used to explain standardization; do not teach them as a replacement for raw data or confidence intervals. Keep magnitude distinct from extremeness relative to uncertainty.

---

**How many standard errors away from zero? — 03:07–03:10**

Point to the figure. Zero is where no effect would sit. Our mean is 2.1 SE steps below it. That gap is what we need to judge — not the raw number, but how far it sits relative to the uncertainty in our estimate. Name it once: this SE-step distance is the t statistic, t = −2.10; it is the number software reports and the one you will see in papers. Negative means lower activity with Q; we will count distance in either direction. The question now is how often the null model would produce a result at least this far from zero. That is what the next slide answers.

---

**How often would a result be at least this extreme? — 03:10–03:13**

Point to the observed t at −2.10 and the equally distant +2.10 boundary. The question was about an average change in either direction, so add both tail probabilities. The actual paired t p-value is 0.08987058, rounded to 0.090. Under H0 and the assumptions, about 9% of repeated experiments produce absolute t at least 2.10. The simulation gives 9.07%, close to the analytical value; it is the standardized statistic, not the raw mean, being counted. Integrating the t distribution includes its entire infinite tails even though the plot shows only −5 to +5. Do not choose the direction after seeing a negative estimate.

---

**What does p = 0.090 mean? — 03:13–03:17** [INTERACTION]

Give one minute of individual choice and a minute of pair discussion, then reveal and debrief. All options reverse or distort the conditional statement. We assumed H0 to calculate the reference distribution; we did not calculate its probability. One minus p is not a probability that a compound works, and a large p does not prove zero effect.

---

**How does this connect to our interval? — 03:17–03:20**

Return to the unchanged interval and its zero line. At the conventional 0.05 threshold, the matching two-sided paired t calculation and its 95% interval agree as displayed. Includes means including the endpoints; at an exact endpoint the matching p is 0.05. This correspondence requires the same data, assumptions, contrast and procedure. It is not a general rule about overlap of two separate group intervals. The interval gives the range and magnitude of compatible mean effects, rather than compatibility with only the single zero value. Here it permits appreciable reductions as well as near-zero and small positive effects. The threshold’s decision meaning comes next.

---

**What does a 0.05 decision rule control? — 03:20–03:23**

Only now introduce alpha as the prespecified decision threshold, a convention rather than a natural evidence boundary. A rejection under the chosen rule is often called statistically significant; that label does not establish biological importance. Every displayed experiment was generated with a true zero mean. Each rust cross is a rejection of a true H0, called a Type I error. There are not necessarily exactly five crosses in each block of 100; the first 100 are shown unselected. Across the same 10,000 null experiments 4.98% meet p<0.05. Under the ideal continuous normal model this rule’s long-run Type I rate is 5%; our rounded simulation approximates it. Alpha is not the probability that a particular conclusion is wrong, nor the proportion of all rejected claims that are false. A testing rule must be fixed in advance; do not retune it for the observed result.

---

**Are these scientifically different? — 03:23–03:25** [INTERACTION]

Ask whether these values alone make the studies scientifically different. Under a prespecified p<0.05 rule the labels differ, but the data’s incompatibility with the null changes continuously rather than jumping at the cutoff. The comparison is only about nearby values for comparable analyses; p-values alone cannot rank very different experiments or scientific importance. A statistically significant result can be biologically small and does not guarantee replication. A result just above the convention does not establish no effect. Ask for estimates, intervals, design and biological context.

---

**What can we report about compound Q? — 03:25–03:28** [INTERACTION]

Give a minute for a spoken or written report and two for debrief. The observed mean is a reduction of 10.4 U/mg, with the displayed broad interval. The t statistic is 2.10 estimated SEs below zero. Assuming zero mean and the model, an absolute statistic this large or larger occurs about 9% of the time. At a prespecified 0.05 rule this would not reject H0; explain if using that phrase that it does not establish H0. The interval remains compatible with substantial reductions and some small increases. No validated biological relevance threshold is supplied. Do not conclude that Q works or does not work, infer a mechanism, or generalize beyond the specified L1 process. Dependence or bias would undermine the simple model rather than being repaired by a p-value.

---

**One question to carry forward — 03:28–03:29**

Read the question and stop. It is a possibility to investigate, not a conclusion that this experiment was necessarily too small. Leave the question unanswered. Do not introduce the next block’s concepts, formulas or planning advice.

---

---

## SESSION 2

---

### BLOCK 1 · Power and Design (00:00–00:51)

---

**My p-value is 0.09. What should I do? — 00:00–00:04** [INTERACTION]

Let the audience advise a researcher who arrives after data collection wanting significance. Collect suggestions without classifying them yet: repeat, increase N, remove an outlier, another test, one-sided test, reduce variability, or conclude Q does not work. Spend two minutes collecting, one minute asking what information is missing, and one minute framing: why did this experiment not give a clear answer to the biological question? p=0.090 is not a failed experiment or a judgment on the researcher. The estimate and wide interval leave useful possibilities unresolved. These are the actual unchanged fictional Session 1 data. Keep the suggested actions visible on a board for the return later.

---

**Why is the answer still unclear? — 00:04–00:06**

Link suggestions from the opening to these possible explanations. More than one may apply. A truly small or zero average is one possibility, but so are variable responses, limited independent replication, avoidable noise, and a mismatch between the model and how data arose. The p-value does not diagnose which is responsible. Avoid treating uncertainty as automatically evidence for a design fault or insufficient N.

---

**Suppose the true mean effect is −14 U/mg — 00:06–00:08** [INTERACTION]

Ask for a prediction before explaining. We return to the original generating model, whose mean −14 was fixed before its observed sample existed. It is not the observed estimate −10.4, not an estimate of truth derived from p, and not a validated minimum relevant effect. Each repetition creates six independent preparation changes with biological effect SD 9, tube SD 3 and triplicate technical SD 2.5; additive shared baselines cancel. The two-sided paired t rule is fixed at 0.05 for this illustration. It is not a mandatory rule for all science.

---

**Same biology, different experiments — 00:08–00:11** [INTERACTION]

Let participants inspect the two experiments for one minute. Dots are the six changes; the lower diamond is their mean and the line is its 95% interval. Repeat 1 has mean −16.4, CI −28.5 to −4.3, p=0.018. Repeat 8 has mean −9.5, CI −19.2 to +0.3, p=0.054. We deliberately selected the first experiment of each decision type to contrast outcomes; this pair does not estimate their frequencies. Both came from the same −14 population. Sampling variability changes the mean and estimated SD, so the threshold result can differ. Do not name power yet. A difference between labels is not evidence of a biological difference between the generating populations.

---

**What proportion would cross the threshold? — 00:11–00:14**

Ask the audience to estimate the proportion of crosses, then reveal 78% across 10,000 trials. Only on the next click name statistical power. In plain language it is the long-run probability that this experiment and analysis will reject under a specified nonzero effect. It belongs to a full set of assumptions: effect, variability, independent N, design, alpha and analysis. The finite simulation gives 78%; the ideal normal paired-difference calculation gives about 76.9%, a Monte Carlo difference of about one percentage point. Do not present either as a guarantee that a particular replication succeeds. The crosses use the same decision symbols as Session 1, but the assumed truth is now nonzero; they are not Type I errors in this scenario. The first 100 are unselected; the illustrative pair from the previous slide is not the frequency denominator.

---

**When a real effect does not cross the threshold — 00:14–00:16**

Return to repeat 8. We know the true mean in this simulation is −14, yet its p-value did not cross the rule. Name the Type II error and beta; in our repeated run 22% did not reject, complementing 78% power. The actual experiment is different: its population mean is unknown, so p=0.090 is not automatically known to be a Type II error. This 22% is not a probability that our observed result is a false negative. It is a probability over hypothetical repetitions under the stipulated effect.

---

**Can we conclude that Q has no effect? — 00:16–00:19** [INTERACTION]

Give a minute to discuss and two to interpret. The interval spans zero, small positive or negative changes and reductions as large as about 23 U/mg. No minimum relevant effect has yet been justified biologically. A large range of mean effects therefore remains plausible under the stated model. Do not substitute the teaching-model power for interpretation of this interval. We do not compute observed power from the measured −10.4 or p=0.090, and do not estimate the probability of a false negative after the fact. Large p by itself does not establish absence.

---

**p > α does not mean no effect — 00:19–00:20**

State this once, clearly, and move on. The interval covers zero — that is why p exceeds α. But it also covers biologically meaningful reductions: −23 U/mg against a vehicle mean of about 98 U/mg is a loss of roughly 24% of activity. A non-significant result from this experiment cannot distinguish "no effect" from "an effect we lacked the power to see." Do not open a discussion.

*(Takeaway: Absence of evidence is not evidence of absence. — Altman & Bland 1995)*

---

**What would change that proportion? — 00:20–00:24**

Use four short predictions, one before each reveal. Larger true effect moves estimates further from zero; lower biological variability narrows their distribution; larger independent N lowers SE. A smaller alpha lowers the long-run Type I rate but also lowers power, all else fixed. Baseline is effect magnitude 14, n=6, biological-effect SD 9, tube SD 3, technical SD 2.5 with three aliquots, and two-sided alpha 0.05. The variability curve changes only biological-effect SD and retains the measurement components. These curves use exact noncentral-t probabilities under independent normal differences, counting both tails. No derivation is needed. Do not recommend loosening alpha to rescue the observed p-value; it is a prospective decision setting.

---

**What effect is worth detecting? — 00:24–00:28** [INTERACTION]

Ask participants to describe how they would decide whether an enzyme-activity reduction matters: downstream biology, assay reliability, prior evidence or a decision to proceed. The observed effect is a noisy estimate from a small sample; it is not automatically the truth to plug into planning. The teaching mean −14 is likewise not an established relevant threshold. Specify a minimum relevant effect on the same U/mg scale and within the defined L1 conditions. Planning detects a departure from zero assuming an effect of that size; it does not prove an effect exceeds the relevance boundary. No numeric biological threshold is invented.

---

**How noisy is the biology? — 00:28–00:30**

Recover the experimental unit and hierarchy from Session 1. Technical measurements are from the same lysate. Biological-effect variation is across independently initiated preparations. Tube noise also enters the paired contrast. Shared additive preparation and day offsets cancel in our simple paired model; treatment-by-day variation would not. The total SD of paired changes, about 10.16 in the model, combines remaining components and is the input for the paired calculation. It is not just SD 9 of the latent biological effect, nor an SD calculated from all 36 readings. Some systematic sources produce bias or confounding rather than harmless random noise.

---

**Does doubling N halve the uncertainty? — 00:30–00:33** [INTERACTION]

Ask for a prediction before revealing the relationship. At n=3,6,12,24 the modeled SEs are about 5.86,4.15,2.93,2.07 U/mg. Each doubling gives the same relative reduction of about 29%, with smaller absolute gains while adding more preparations. Halving SE takes roughly four times the independent N. These are analytic precision calculations under the independent-contrast model; the n=3 illustration is not presented as an exact copy of the original two-pairs-per-day schedule. Independent N may improve power and precision but cannot fix systematic bias, a wrong experimental unit or a narrow cell-line claim.

---

**Can a better comparison remove irrelevant variation? — 00:33–00:36**

Compare twelve unrelated preparations, six per condition, with six independent preparations split into twelve tubes. Both layouts balance conditions across days, so this comparison isolates matching instead of deliberately confounding treatment with day. Unrelated preparation baselines vary with SD 15 and no longer cancel within contrasts; the mean estimate’s simulated SE is about 9.6 instead of 4.2 U/mg. Both use three assay readings per tube and the same treatment effect process. Randomization is still within the relevant allocation structure. Pairing is useful because matching captures a positively shared baseline; it is not automatically better for arbitrary pairs or every cost/covariance structure. Measuring all controls on unrelated control-only days would add possible confounding, which statistics cannot remove by increasing N. This figure compares estimator precision, not a menu of tests or proof that every paired design is superior.

---

**Where should six additional assay wells go? — 00:36–00:39** [INTERACTION]

Make the resource unit explicit: assay wells, not culture tubes. Current design uses 36 readings. Option A adds one assay reading to each tube in three existing pairs, six additional technical readings. Option B adds one independent preparation split into two tubes, with three readings each, also six assay wells. A reduces SE to 99.7% of baseline; B to about 92.6%. In this model response variation dominates, so independent replication brings more information about the population mean. The numerical comparison concerns precision, not applying an unmodified t calibration to unequal technical counts. Technical replication is useful for measurement precision and assay reliability, especially when technical error is substantial; its value depends on the components and total costs. Option B requires preparation and culture resources beyond assay wells. Never call technical replicates independent biological units.

---

**What must we specify before calculating N? — 00:39–00:42**

Walk back from the desired answer to the assumptions a calculation needs. Establish the scientific contrast, experimental unit, minimum relevant effect, plausible SD of the relevant response, design, prespecified analysis, alpha and desired power. Desired power and alpha are choices justified by scientific consequences and resources, not mandatory constants. Feasibility, attrition and failed cultures also need operational planning; the following numbers count completed usable pairs and include no attrition allowance. A program can compute consequences of inputs; it cannot validate those inputs scientifically.

---

**How many pairs does your experiment need? — 00:42–00:45** [INTERACTION]

Use the grid rather than announcing one N. For assumed effect magnitude 10 and paired-change SD 12, the smallest integer N meeting 80% is 14 completed pairs. With effect 6 and SD 16 it is 58; with effect 14 and SD 8 it is 5. The grid uses the normal independent paired-difference model and counts both rejection tails. Eighty percent is a common planning convention, not a universal standard; neither is alpha 0.05 mandatory. The effect and SD values are illustrative scenarios, not validated biological relevance thresholds or confidence bounds from this pilot. If assumptions are wrong, achieved performance changes. Report them, examine sensitivity and consider credible external or pilot variance information without trusting one noisy point estimate. These values exclude attrition, operational block constraints and model misspecification.

---

**My p-value is 0.09. What should I do now? — 00:45–00:48** [INTERACTION]

Return to the audience’s original suggestions and let them revise one. Interpretation, acknowledging uncertainty, an independent replication if justified, better design, reduced avoidable variation and prospective biological replication are defensible directions. A method may need correction if scientifically or diagnostically inappropriate, and exclusions can be justified by an established QC rule; changing choices solely for significance is different and requires transparent handling rather than result shopping. Do not choose a one-sided question after seeing the direction or keep adding observations until a threshold appears. Establish the principle only; the later block will address flexible analysis in detail. Neither high power guarantees replication nor low planned power automatically invalidates a significant result. Evaluate design, assumptions, effect, interval and reporting.

---

**Design for a useful answer — 00:48–00:50**

Connect the pieces in two minutes. At a specified effect, biological variability, design and independent N shape the precision of the estimated effect; the rejection probability additionally depends on the decision rule and analysis. The compact chain is not a claim that precision alone determines power or that crossing a threshold establishes biological importance. Do not make retrospective claims about whether our observed result was a false negative. The relevant question changes from making this p-value significant to designing the next experiment for useful information.

---

**One question to carry forward — 00:50–00:51**

Read the new practical problem and stop. Do not calculate a probability, introduce a correction or explain the next block. The outcome of this opening is prospective design reasoning for the single prespecified assay question.

---

### BLOCK 2 · Multiple Testing (00:51–01:35)

---

**We measured 20 outcomes. One gave p = 0.03. — 00:51–00:53** [INTERACTION]

Ask for an answer before revealing the distinction. The raw p-value still describes its particular test under that test's assumptions. But finding a small result after twenty chances is a different event from a single preselected comparison. State the central question aloud: how many chances did we give ourselves to find something? This is a hypothetical expanded L1 protocol; the original enzyme result has not been changed to 0.03. No correction method is needed yet.

---

**What happens when none of the markers responds? — 00:53–00:56**

Show one set of twenty p-values and ask for a prediction, then reveal two more experiments. Each marker is tested on six independent normal paired changes with true mean zero and a two-sided paired t procedure. Markers are independent in this illustration; real markers can be correlated. Standardized marker units have SD one, so these are not twenty literal enzyme-activity measurements on one scale. Red dots cross 0.05 and are Type I errors because we know the simulated truth. Ordinary small p-values arise without a biological effect. These are the first three experiments, not chosen to achieve a desired pattern.

---

**How many chances did we give ourselves? — 00:56–00:59** [INTERACTION]

Collect predictions before revealing the grid. Crosses mean at least one of twenty null tests crossed 0.05; the first hundred families are unselected. Across all 10,000, 64.27% had one or more. On the next click show the independence calculation: the probability none crosses is .95 to the twentieth power, so its complement is about .6415. Emphasize that this exact formula requires independent tests with exact .05 marginal size. Correlated valid marker tests do not generally have this same probability. Distinguish the per-test probability from the chance of any false rejection across a family; an expected false count is a third quantity, introduced later.

---

**Which claims belong to the same family? — 00:59–01:01** [INTERACTION]

Only now name FWER. It is a probability that any true null in a defined family is rejected, even if some other hypotheses in that family are false. Ask which outcomes contribute to the same intended claim or decision. Twenty cytokines for one question may form a family; so might several contrasts, time points or primary endpoints. Scientific context and the promised error protection determine the family; there is not one uniquely correct grouping independent of purpose. Define it prospectively where possible, not after seeing which grouping gives a favorable result.

---

**What if we measured 20,000 genes? — 01:01–01:03**

Change scale to an exploratory transcriptome-wide screen. Under twenty thousand true nulls, the expected number of raw p-values below .05 is one thousand. Expectation is a repeated-run average, not an exact count in one screen. This expected-count calculation uses linearity of expectation and does not require independent tests if each marginal size is .05; valid conservative tests give at most that expectation. Under independence the probability of at least one is essentially one, a different quantity from the expected count. The dot display depicts the expectation rather than an invented RNA-seq dataset or software output. Protecting against even one error may be demanding for candidate discovery, motivating a different scientific goal.

---

**What error promise fits a discovery list? — 01:03–01:05**

Contrast the scientific aim of avoiding even one false confirmatory claim with producing a candidate list for follow-up. Name FDR only after posing the list question. FDR is the expected proportion of false discoveries among all discoveries; if there are no discoveries, the fraction is zero by convention. The first eighty BH-controlled screens show variable realized fractions; the teal line marks the mean across ten thousand, about 4.1%. FDR 5% is not a guarantee about this list — it is a repeated-use expectation. A realized list can have zero, a large fraction, or even all false discoveries. In real science we do not know which specific claims are false. The concept of a fraction rather than a count is the take-home.

---

**Which promise does the scientific question need? — 01:05–01:07**

Compare promises rather than declaring a winning correction. A few prespecified primary outcomes may need strong protection against any false claim. A transcriptome-wide candidate screen with independent confirmation planned may prioritize a controlled expected false fraction. In the mixed simulation BH gives FDR 4.13% and FWER 10.16%; those are different denominators and summaries, not contradictory results. These realized rates are model-specific, not guarantees for all datasets. Error control does not establish biological importance; keep magnitude, uncertainty and validation in view.

---

**You report p = 0.03. What else did you try? — 01:07–01:10** [INTERACTION]

Reveal the choices one at a time and invite examples. Multiplicity can come from planned parallel tests and from decisions affected by observed outcomes. The opportunities are not interchangeable: paired versus unpaired must follow design; transformations and exclusions can be scientifically justified; stopping rules change the sampling procedure. Do not automatically apply a simple Bonferroni count to every option on this slide. The issue is what full selection process produced the reported analysis and whether its claimed error guarantee accounts for that process. Avoid moralizing: thoughtful analysts can create a data-dependent path without deliberate threshold chasing.

---

**The test direction must be specified before seeing the data — 01:10–01:12**

The one-sided versus two-sided decision must be made before the data are examined, not after. For the L1 experiment: two-sided p is 0.090. If you look at the data, observe the negative sign, and then decide to use a one-sided test, you obtain p = 0.045 — just across the threshold. But you used the data twice: once to choose the direction, and once to compute the p-value. The effective α is no longer 0.05. The test is legitimate only if the direction was fixed before collection on scientific grounds — for example, if a positive enzyme increase from a kinase inhibitor is mechanistically impossible and would not be reported regardless of size. That constraint must be documented before the experiment. Retrospective justification ("of course we only expected a reduction") is not equivalent.

---

**A pause before we examine selection — 01:12–01:27**

Take the scheduled break from 01:12 to 01:27. Resume with exploration versus confirmation. Do not use the break to add teaching content.

---

**Exploration is useful science — 01:27–01:29**

Reconnect to Session 1. Transformations, subgroup inspection and hypothesis generation are legitimate exploratory work. The problem is attaching confirmatory error guarantees as though the hypothesis and analysis had been fixed before those same observations were examined. Report discovery as discovery and independently test important resulting claims with an appropriate design. Independence means genuinely new information not reused to select the claim; it does not guarantee success. Avoid suggesting that every exploratory calculation needs a mechanical adjustment or that exploration is inferior science.

---

**What does the reader learn from these two reports? — 01:29–01:32** [INTERACTION]

Allow a minute to compare reports and two to discuss. Imagine twenty measured outcomes, nineteen without a small p and one p=.03. Report A hides that context. Report B tells the reader what the family was and makes the full results available; it must actually provide the named estimates and analysis, not merely claim transparency. If Bonferroni on twenty was the plan, .03 becomes .60; other strategies depend on the specified purpose. Reporting all outcomes does not itself correct invalid inference, but concealing them prevents assessment. Distinguish raw from adjusted p-values and ordinary from multiplicity-aware intervals. Do not describe the nineteen as proof that those markers have no effect.

---

**What can we decide before the data arrive? — 01:32–01:34**

Connect the multiplicity problem to experimental design. Where feasible, record the scientific purpose, primary/secondary outcomes, family, contrasts, analysis population, exclusions, stopping and multiplicity strategy before outcomes guide those choices. This can be a clear lab plan; do not claim that every laboratory experiment requires a formal preregistration. Plans may need justified amendments or exploratory follow-up, which should be disclosed as such. Prespecification does not guarantee a correct model or meaningful question; it makes the target and procedure assessable.

---

**One question to carry forward — 01:34–01:35**

Read the practical question and stop. Do not introduce tests, a decision tree or the next section. This block establishes the context in which a choice of statistical procedure will later make sense.

---

### BLOCK 3 · Tests From Design (01:35–02:26)

---

**Which statistical test should I use? — 01:35–01:38** [INTERACTION]

Give pairs a minute to request information before revealing the six prompts one at a time. Take two suggestions and ask what each would change. A spreadsheet and a software menu do not specify the experiment. Do not answer with a test yet.

---

**What are we trying to learn about Q? — 01:38–01:40**

Retrieve the original scoped question. Each preparation was split and treatment allocated to tubes; the preparation contrast is the independently replicated information under our working model. The causal wording relies on the allocation and comparable handling, not on a t-test. The accessible population is comparable L1 preparations under these conditions, not patients or all cell lines. An analysis plan can also inform design prospectively: the arrows are a reasoning route, not a mandatory chronological order. Keep the word estimand in the background.

---

**What did the instrument—or observer—record? — 01:40–01:42**

Ask participants to classify their own endpoint before naming these four categories. Expression can be continuous after a specified transformation, whereas raw sequencing counts are counts. Binary outcomes require a defined denominator; counts often require exposure; time-to-event data may include censoring. Do not teach all models now. A continuous-looking spreadsheet value is not enough to determine its sampling structure.

---

**120 cells. What is N? — 01:42–01:44** [INTERACTION]

Deliberately withhold counts at the higher levels. Allow a short discussion before explaining that a single N can hide several levels: assignment units, sampled donors, cultures, wells and cells. Request identities, allocation, pooling and shared batches. If Q was assigned to cultures, cells are subsamples; if wells were assigned within cultures, the design is blocked or clustered rather than simply 120 independent cells. The model must reflect where independent information enters.

---

**Do independently treated cultures differ on average? — 01:44–01:47**

Ask for the direction and precision of the mean difference before naming Welch. Each point represents one independent culture, not a technical read. Bars show group means; the reported interval is for Q minus control, not two separate group intervals. The simulated populations have SDs 10 and 17; no equal-variance assumption is imposed. Welch is the default independent-group t procedure here, with an approximate degrees-of-freedom calculation we will not derive. The interval includes zero and meaningful negative changes. The p-value is .105, secondary to the effect and interval.

---

**The design created pairs — 01:47–01:50**

Ask whether the two columns are independent, then trace a preparation line. Average the technical readings within each tube before constructing Q minus vehicle for each preparation. The six independent differences, rather than twelve independent tubes or thirty-six readings, supply replication for this paired analysis. The paired test is algebraically a one-sample t-test on the differences; exact small-sample inference assumes independent normally distributed differences. Shared day effects must cancel in differences under our simplified additive model; residual dependence would require more care.

---

**Same measurements. Same analysis? — 01:50–01:53**

Have the audience predict whether the mean difference or its uncertainty changes. Both analyses give −10.4. Under unrelated-culture assumptions the Welch interval is −33.6 to 12.8; under the actual paired design it is −23.2 to 2.3. This is a counterfactual illustration, not permission to choose the narrower result. Positive within-pair association removes shared variation here. Pairing does not universally improve precision; covariance and the cost/design context matter. Choose the procedure from provenance before inspecting which gives a preferred answer.

---

**Four doses: should we run six separate tests? — 01:53–01:55**

Ask why four groups yield six pairs and reconnect to the multiplicity block. A group indicator linear model represents the four means together; classical one-way ANOVA tests a restriction on those means. A two-group equal-variance t-test is a special case of that classical framework. Do not quietly equate an ordinary homoscedastic linear-model fit with Welch: unequal variances can require Welch-type or other suitable inference. A common model does not by itself eliminate multiplicity.

---

**What would we want to know about these doses? — 01:55–01:58** [INTERACTION]

Let the audience choose a question and articulate its effect quantity. The omnibus null sets all four population means equal; rejecting it does not identify a particular contrast or prove every group differs. Dose versus control contrasts form a natural prespecified family when that is the aim; a trend additionally requires meaningful dose spacing and a justified functional form. A high-minus-low contrast is a different estimand. Planned contrasts need not wait for a significant omnibus test when the inferential plan already specifies them. Discuss uncertainty and the family, without teaching post-hoc menus.

---

**Does Q have the same effect in both genotypes? — 01:58–02:01**

Ask participants to compare slopes before naming interaction. The fitted Q effect is −27.9 in wild type and −4.8 in knockout; knockout minus wild-type effect is +23.0 activity units (model-based 95% CI approximately 11.8 to 34.2). A factorial linear model estimates this difference of differences. These are independent cultures with normal equal-SD errors in the teaching generator. Genotype need not be randomized, and a genotype mechanism claim requires comparable genetic backgrounds and design. Significant in wild type but not in knockout does not itself establish different effects; assess the interaction directly, with its interval. No factorial table drill.

---

**Time-course experiments: showing the effect vs. testing it — 02:01–02:04** [INTERACTION]

Two minutes in pairs, then collect two or three answers. Most will say six tests or one two-way ANOVA. The problem with six separate tests: every time point draws its tubes from the same preparations, so the comparisons are correlated and the false positive rate is inflated unless corrected. The problem with two-way ANOVA: it assumes all measurements are independent observations. A lysate assay cannot measure one tube twice, so each time point is a separate tube — but tubes harvested at 2 h and 24 h from the same preparation share its biology, handling, passage and any uncontrolled drift. They are related, not independent. A standard two-way ANOVA ignores that correlation entirely. Time-courses are almost always pioneering experiments — you are watching when and how an effect develops. That is exploration, not confirmation.

---

**A time-course is most honest as exploration — 02:04–02:06**

Present these as three legitimate routes, not a hierarchy. Most time-course experiments in this audience's work are genuinely exploratory — the researcher wants to know whether the effect builds, peaks, or reverses. That is valuable science; it does not require a p-value. If the biological question really is about a specific time point — for example, the moment of peak inhibition as established by prior literature — pre-specify it before collecting data and test once. If multiple time points were pre-planned, apply FWER correction such as Holm. If the shape of the whole curve matters, reduce each experimental unit to one derived number first: AUC summarises total exposure; a rate constant or half-maximum time captures kinetics. Each unit then gives one observation and you can run an ordinary t-test or regression on those derived values. Do not test every time point and report only the significant ones.

---

**In any of these designs — what is one independent observation? — 02:06–02:07**

Every design we have seen — two groups, paired, doses, factorial — requires the same first step: identify what was independently initiated and assigned. The test follows from that answer, not from the number of rows in the spreadsheet. The next slide shows what happens when measurements are confused with independent observations.

---

**Do 100 cells from one culture give N = 100? — 02:07–02:09**

Retrieve pseudoreplication. Cells from a common culture can share biology and handling; repeated measurements of an animal share that animal. Appropriate unit summaries can answer a unit-level question, but discard some information and need scientifically sensible weighting. Hierarchical or mixed-effects models can represent shared variation and repeated structure when supported by enough independent units. A mixed model cannot manufacture independent biological replication from a single culture or resolve treatment perfectly confounded with culture. Distinguish repeated times from independent repeated experiments.

---

**Does a normality test tell you which analysis to use? — 02:09–02:12** [INTERACTION]

Collect a vote before revealing the answer. Failure to reject normality does not verify it. At small N there is little information about tails; at large N a tiny deviation can be detectable without invalidating mean inference. The relevant issue is adequacy of the model and sampling distribution for the intended estimate, not ritual use of a preliminary significance test. Robustness depends on sample size, skewness, outliers, allocation balance and variance patterns. Selecting an analysis through a preliminary test can also alter the operating properties of the whole procedure. Plots diagnose structure and problems; they cannot prove normality.

---

**What must be credible for inference about a mean? — 02:12–02:14**

Separate assumptions. Independence comes from design; it is not checked by a histogram. Normal independent observations give the exact classical one-sample t reference; the paired version concerns differences. Welch uses an approximate reference even under unequal-variance normal populations. With sufficient independent information, mean inference may be approximately reliable beyond normal populations, but no universal N threshold protects against heavy tails, severe skewness or influential observations. Finite variance, balance and the particular model matter. Assess group residual patterns rather than demanding a pooled mixture of different means be normal. Visual review cannot establish exact distributional assumptions.

---

**If the data are not normal, automatically use ranks? — 02:14–02:16**

Mann–Whitney compares independent groups using ranks. Its usual exact null is identical distributions (with ties handled appropriately); the statistic relates to the probability one randomly chosen observation exceeds the other, counting ties by half. It is not an omnibus detector of every distributional difference. Under a common-shape location-shift model, location and median shift interpretations are justified. Without that structure, differing shapes or spreads complicate an interpretation as a median shift, and equal medians do not by themselves describe its null. It does not repair clustering, biased sampling or adaptive reporting. Choose the target first and a procedure valid for its null.

---

**Delete it? Transform? Switch the test? — 02:16–02:18** [INTERACTION]

Ask what evidence participants would seek before changing the analysis. This is a constructed dataset, not another alteration of the original assay. Check the source record, assay calibration, sample identity and prespecified QC criteria. Correct a verified recording error with an audit trail; exclusions require a defensible reason. A genuine extreme biological observation may matter to the mean and target population. Transformation changes the scale and often the effect quantity; a rank method answers another question. Sensitivity analyses can show influence, but report data-dependent choices and all relevant results. Never delete solely because a p-value improves.

---

**What must an analysis plan connect? — 02:18–02:21** [INTERACTION]

Give pairs a minute to apply this to the L1 assay: mean activity change, tube allocation within preparation, continuous outcome, six independent paired contrasts under the working model, Q versus vehicle, a planned contrast, model of differences, estimate and interval, then a paired test if useful. Multiplicity belongs in planning, even though it is listed last as a final check. Revisit population and experimental space in the quantity statement. If a model does not fit the design, return to the earlier questions rather than selecting a different software label. Preserve this retrieval time.

---

**Where do familiar procedure names fit? — 02:21–02:23**

Do not read every cell aloud. Use the table to locate names people already know. Ordinary linear-model standard errors are not automatically Welch; choose the variance model/inference appropriately. Logistic coefficients concern log odds, although fitted probabilities can yield risks and risk differences. Fisher’s exact test addresses suitable small contingency-table questions with independent units and conditional assumptions; a small table does not remove clustering. Counts may need offsets and overdispersion handling rather than a default Poisson model. Time-to-event questions from earlier require survival methods respecting censoring, deliberately not taught here. None of these frameworks automatically solves bias or defines the scientific quantity.

---

**Tell me how you did the experiment—and what you want to learn. — 02:23–02:26** [INTERACTION]

Spend two minutes collecting requested information. Retrieve biological question, unit, target population/experimental space, endpoint, design, pairing/blocking/clustering, effect, variation, independent sample size, planned comparisons and multiplicity. Ask which decisions were prospective and which arose during exploration. The central response is: tell me exactly how you did the experiment and what you want to learn. Reveal the workshop bridge last and stop. The separately built workshop will have 20–25 minutes; do not run or improvise its content in this block.

---

### BLOCK 4 · Common Issues (02:26–02:42)

---

**Five issues you will see in almost every paper — 02:26–02:27**

Preview the four topics without discussing them yet. This block is practical: each issue appears in the literature your participants already read. Move quickly to the first slide; the meat is in what follows.

---

**When the effect is multiplicative, use the log scale — 02:27–02:30**

Ask participants to predict what three-fold up and three-fold down look like on an absolute scale before revealing the left panel. Show the asymmetry: from a baseline of 100, three-fold up is +200 while three-fold down is only −67. The visual impression on the absolute scale is that the upward effect is roughly three times the downward effect — but both represent the same fold change. On the log₂ scale, both are ±1.58, which is why RNA-seq analysis uses log₂ fold change as standard. Connect to what they already know: when a paper reports "2-fold induction," that is a ratio, and ratios should be compared on the log scale. Briefly note that for the L1 enzyme data, absolute differences are appropriate: the baseline range is narrow (79–113 U/mg), effects are small fractions of baseline, and U/mg differences are directly interpretable. The choice depends on whether effects are expected to compound multiplicatively or add linearly across the measurement range.

---

**What does chopping the y-axis do? — 02:30–02:33** [INTERACTION]

Ask which panel shows the larger effect. Wait for a show of hands, then confirm: they are identical data. The right panel truncates the y-axis at 70, so the visible bar lengths represent roughly 27 and 17 units instead of 97 and 87. The visual height ratio is about 1.6; the actual ratio is about 1.1. The bar chart uses visual area as its information — cropping it at an arbitrary point changes that information without changing the numbers. For line plots and dot plots, a non-zero baseline with clearly labelled axes can be legitimate when the data range is far above zero; the bar chart is the problem because the bar's length is its encoding, and it starts at zero by convention. Ask participants to find an example in a paper they know.

---

**When values span orders of magnitude — 02:33–02:36** [INTERACTION]

Ask which panel lets them compare all four conditions meaningfully. On the linear scale, the three low-value bars are barely visible — they look identical even though low and high dose differ by four-fold. Publications often solve this by cutting out the middle of the y-axis with a break symbol. That removes the true distance between values from the visual — a reader cannot tell how far the stimulated bar is from the others. Log scale is the correct solution when data span more than one order of magnitude: on a log scale, equal vertical distances mean equal fold changes. The stimulated condition is about 80-fold above unstimulated. On the linear scale that relationship is invisible; on the log scale it is clearly encoded. Axis breaks are tempting and look authoritative in papers — point out they are almost always a sign that log scale should have been used instead.

---

**Three error bars. Three different claims. — 02:36–02:39**

Cover the panel titles and ask what the bars mean. Reveal them. SD is the spread in the raw data — it describes biological variability and stays roughly constant as n increases. SEM is SD/√n — it shrinks as you add replicates regardless of the biology and describes estimation precision. A 95% CI is wider than SEM (approximately ±t·SEM for small n) and describes the range of effect sizes the data cannot rule out — which is what a reader needs to assess a claim. For six preparations, the CI is notably wider than the SEM. Many published figures show SEM because it looks smaller, suggesting more precision than the data support. An unlabelled error bar cannot be distinguished. Recall from Session 1: report the CI or SE with the effect estimate, not the SD alone, when your reader needs to know how precisely the effect is known.

---

**What does an honest figure let you do? — 02:39–02:42** [INTERACTION]

Allow two minutes in pairs, then collect answers. With the right panel, a reader can: see each individual preparation; see which preparations responded consistently; check whether one preparation is driving the result; verify the direction; mentally reproduce the paired analysis. With the left panel, a reader sees only group means and one aggregate uncertainty measure. The jitter in the bar chart does not show which Vehicle and Compound Q dots came from the same preparation — the pairing is invisible. The honest figure is not more complicated: it displays the same six values each, but preserves the experimental structure. Invite a brief discussion of whether participants' most recent submitted figure would pass this test.

---

### BLOCK 5 · Final Workshop — Compound R (02:42–03:07)

---

**“Compound R significantly suppresses inflammation” — 02:42–02:43** [INTERACTION]

Give participants one minute to react without correcting them. Present this as a colleague asking for help, not a trap or evidence of incompetence. The illustrative report omits information that participants must request. Do not lead with which test was used. The entire workshop is fictional teaching data.

*Instructor-only provenance: this is Line B, day 2, P1, high dose versus stimulated vehicle. Three assay wells per condition are aliquots of one treated culture-tube lysate, not three independently treated cultures. Mean signals are 100 and 86.8169. The displayed Welch calculation on technical wells is exactly .032, but does not justify biological treatment inference. Do not reveal this yet.*

---

**What do you need to know before interpreting this? — 02:43–02:46** [INTERACTION]

Let participants supply questions for roughly two minutes, then group them verbally for one minute. Do not display a checklist. If needed, ask one neutral follow-up. Listen for what n counts; independent repetition; culture/well generation; contemporaneous vehicle; allocation across days; line shown; proteins, doses and comparisons inspected; exclusion rationale; prospective hypothesis and analysis; population or experimental space. Answer that these details are available on the next slides. Reward requests for provenance without turning this into an exam. Avoid labelling exploratory work as misconduct.

---

**What was actually repeated? — 02:46–02:47** [INTERACTION]

Reveal each layer after asking for a guess. There are two established cell lines, three experiment days, and one separately initiated preparation per line each day. Each available condition receives one culture tube; stimulation is common to all tubes, followed by vehicle or R for the same duration. Each lysate is assayed in three multiplex wells measuring five proteins. Thus the three wells are technical measurement repeats, not separately treated biological units. The tube receives treatment; independent biological replication for treatment comparisons comes from preparation/day repeats, with common preparation and day structure retained. Line is not an independent replicate of a universal cell population. No pooling of preparations occurred.

---

**What else changed when the dose changed? — 02:47–02:48** [INTERACTION]

Explain that available plate capacity led to vehicle/low/medium on day 1, vehicle/high on day 2, and all conditions on day 3, identically for both lines. Allocation within each day was randomized, and every treated tube has a contemporaneous vehicle. This is an incomplete, imbalanced block design, not perfect treatment/day confounding. Comparing pooled dose means without day structure mixes different day compositions. Some within-day contrasts remain identifiable; only two preparations per line inform each nonzero dose. Day and preparation cannot be separately disentangled within a line here. Ask for balanced complete blocks next time if feasible, with randomized tube and assay positions. A model cannot replace the missing independent replication or create an unobserved condition.

---

**“Suppresses inflammation”—in what experimental space? — 02:48–02:49** [INTERACTION]

Ask for a scoped statement. A lower signal for one protein in one cell-line preparation is not proof of broad suppression of inflammation. Comparable future preparations of a stated line under the laboratory protocol are a plausible narrow target for a better replicated follow-up. Two available lines are not a random sample of all cells or patients. The same inflammatory stimulation and matched solvent were used throughout. Vehicle controls solvent and handling under stimulation; it does not establish absence of toxicity or assay interference. If the mechanistic claim requires those distinctions, request suitable viability/assay controls using concepts already taught. Do not add a separate new methods lesson.

---

**How many chances did we give ourselves? — 02:49–02:50** [INTERACTION]

Allow a quick response before revealing the actual audit. The researcher compared each available dose with its same-day vehicle separately for every line/protein: two contrasts on day 1, one on day 2 and three on day 3, times two lines times five proteins, giving sixty technical-well Welch calculations. These tests share controls and protein measurements, so they are dependent; neither sixty nor thirty is an effective independent-test count. The .032 panel was selected as a promising example, not a prespecified primary endpoint and not necessarily the minimum p-value. The researcher had a broad exploratory goal and chose the analysis/reporting focus after seeing the screen. Define purpose and family before proposing a multiplicity strategy. Adjustment cannot repair invalid biological replication. Show all outcomes and uncertainty where defensible; do not mechanically calculate .032 times sixty.

---

**“One value was excluded because it looked wrong.” — 02:50–02:51** [INTERACTION]

Ask for evidence before revealing the location. The value is 190 activity units; the other technical readings are retained. The record does not establish assay failure, recording error or biological cause. No prospective exclusion criterion was documented. The choice was made after viewing the screen, but we do not know whether the researcher checked its influence on a p-value. Do not invent intent. The exclusion is in another protein/line/dose, so it did not generate the selected .032 result. Valid exclusions are possible with a defensible measurement-based reason and audit trail. Retain it for transparent review and report sensitivity if unresolved; do not use a significance-improving rule.

---

**Describe the data before testing them. — 02:51–02:53** [INTERACTION]

Give most of these two minutes to participants. All 90 tube/protein summaries are shown: two lines, nine available condition-tubes per line across days, five proteins. These are not 90 independent biological observations. Conditions on a trace share a preparation; proteins from a lysate and lines on a day share sources of variation. Means include the excluded reading; its marked tube mean is therefore different from the researcher’s retained-well mean. Day traces do not imply longitudinal follow-up or a fitted dose-response curve. Ask about decrease, size on the displayed arbitrary assay scale, variation across days and inconsistent proteins. Signal values across proteins are not directly comparable biological effect scales. P1 tends to decline with dose in this constructed screen, but effect estimates across independent preparations remain uncertain with so few repeats. Avoid significance stars and a new pooled p-value. The individual excluded reading can be checked in the CSV or facilitator figure; the full plot shows biological-unit summaries, not technical rows counted as N.

---

**Repeat the study so it can answer your biological question. — 02:53–02:59** [INTERACTION]

Distribute workshop-design-canvas.html as a one-page handout or keep this slide visible. Give six minutes, with a one-minute warning. Participants choose a defensible narrow question and sketch the allocation/replication. They need not fill every box in prose. Circulate and ask what independently repeats, which sources of biological variation matter, whether controls support the claim, how the primary effect is defined, and what sample-size inputs are still missing. Do not provide an invented numerical N without a scientifically relevant effect and plausible variability. Encourage different legitimate questions: one chosen line/protein/dose confirmation versus a broader exploratory screen with an explicit family. Keep participants talking; do not lecture through the canvas.

---

**One defensible repeat—not the only one. — 02:59–03:02**

Ask one group to describe its choice for a minute before revealing or discussing this example. Then spend two minutes comparing. This independent repeat confirms a hypothesis generated by the original screen; choosing the focus now does not make the old result confirmatory. Prepare multiple independently initiated Line B cultures; split each across vehicle and high R, with same-day matched handling and randomized positions. Retain three assay repeats for precision, average after prospectively defined QC, and analyse independent preparation differences if their assumptions are credible. If multiple preparations share day-dependent treatment effects, balance/block and reflect the dependence; sample days as required by the target. Choose independent N prospectively from a minimum relevant effect, plausible SD of paired differences, desired precision/power, alpha and attrition; no reliable N is determined by this tiny screen. Add controls needed to distinguish reduced protein response from assay interference or nonspecific cell loss before claiming a mechanism. Secondary lines/doses/proteins remain transparently exploratory or receive a prespecified family and suitable multiplicity plan. Report estimates, intervals, raw structure and any p-values.

---

**What improved before any test was run? — 03:02–03:04** [INTERACTION]

Invite groups to identify their most consequential change and one remaining limitation. Preserve useful features of the original: contemporaneous controls, some day overlap, two lines and a legitimate exploratory screen. Some issues can be improved analytically now: show all data, clarify provenance, restore/review the unexplained exclusion, respect blocks, and label selection. Other limits cannot be repaired from these data: inadequate independent replication, unmeasured controls and restricted experimental space. Explain that a new experiment supplies information, not just a more favourable p-value. Avoid implying the original researcher was incompetent.

---

**“My p-value is 0.032. Is my result real?” — 03:04–03:05** [INTERACTION]

Give participants about forty seconds to formulate a response before revealing the final prompt. Seek a useful conversation rather than yes/no. The laboratory observations exist, but their interpretation depends on design, uncertainty and selection; this technical-well p-value cannot support the biological claim as reported. A promising exploratory pattern can justify an independent repeat without being treated as established truth.

---

**From a biological question to a defensible claim — 03:05–03:06**

Use the diagram as a reconstruction, not another list of definitions. Ask where the group made its most important decision. The path is iterative: a model informs estimation and uncertainty even though it is named later in this conceptual chain; planning revisits the question and design. Power follows the relevant effect and independent information, while multiplicity follows intended claims and selection opportunities. Neither is an isolated last-minute statistical repair. Do not introduce a new formula.

---

**Statistics cannot rescue an experiment that could not answer the question. — 03:06–03:07**

Connect explicitly to the opening motivation: researchers often seek statistical help only after collecting data. This is an invitation to bring the biological question and protocol earlier, not a criticism of colleagues or a claim that imperfect data are worthless. Thoughtful reanalysis may recover supported comparisons; it cannot create missing independent units, identify completely confounded effects or supply absent population coverage. Ask each participant to choose one design conversation to have before the next collection. Thank them and stop here.

---

*End of narrative.*
