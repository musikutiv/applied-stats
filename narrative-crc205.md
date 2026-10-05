# CRC205 — Applied Statistics for Life Scientists · Instructor Narrative

*CRC205 · one afternoon, 13:30–18:30 (Part 1 13:30–15:30, break 15:30–16:00, Part 2 16:00–18:30). Verbatim script extracted from the speaker notes; times are clock times. Interaction slides are marked* **[INTERACTION]***. Unused minutes at the end of each part are buffer for discussion.*

---

## PART 1 (13:30–15:30)

---

### 1 · My experiment (13:30–14:03)

---

**Is my result real? — 13:30–13:32**

Give only the three statements on screen. Do not supply a cell line, dose, time, control, plot or protocol yet. This is an incomplete fictional lab report, worded the way a methods section or figure legend typically reads. Ask what the audience would need to know before interpreting it. Let someone question “replicates”; do not immediately define it for them. If necessary, ask what exactly was repeated six times.

*(Context not yet revealed: L1 is a human cell line stably expressing kinase Q. Compound Q is a selective ATP-competitive inhibitor of kinase Q. The assay measures kinase Q activity (substrate phosphorylation rate, U/mg protein). These details are revealed progressively from slide 3 onward.)*

---

**Six of what? — 13:32–13:36** [INTERACTION]

Give pairs two minutes to propose at least two meanings, without revealing the examples. Advance once to display the possibilities. Use two minutes to hear what information would distinguish them. All are plausible uses of the word. Do not yet say which one applies, introduce technical vocabulary or ask for a numerical N. The next slide provides the first notebook detail.

---

**What exactly did we do? — 13:36–13:39**

First trace one culture preparation and its two tubes. Random assignment chooses which tube receives vehicle and which receives Q. The material is harvested after 24 hours. Ask where repeated measurements might enter. Then reveal the assay branch: each tube provides one lysate, assayed in three aliquots — technical triplicates, a detail the opening report did not even mention. Stop at this one preparation. Do not yet reveal how the six “replicates” were generated, the total counts or the day layout.

---

**The tube is the experimental unit — 13:39–13:41**

The treatment enters at the tube level. That makes the tube the experimental or treatment-assignment unit here. Allocation is constrained within each preparation: one tube gets vehicle and one compound. The preparation is a block, so the two tube outcomes share a history. Later we compare them within that pair.

---

**What is N here? — 13:41–13:48** [INTERACTION]

Reveal that the same split was repeated with six cultures initiated and maintained separately, all from L1. Allow two minutes to draw the hierarchy and decide on counts. Spend three minutes hearing explanations before revealing the 36/12/6 answer. Use two further minutes to ask what each number counts. Each preparation contributes a vehicle-versus-Q comparison. Do not announce that the six comparisons must be independent; we have not yet inspected what they share across days. Ask for a report with nouns, not a bare N.

---

**Technical and biological replication are different — 13:48–13:52**

Use two minutes for the audience to explain what each repetition tells us and two minutes to debrief. Repeating the assay helps us examine the measurement process. Independently initiated preparations let us see variation in the biological system as defined here. Neither is useless; they answer different questions. All preparations remain from cell line L1. Return to the question on screen: six preparations can speak to repetition within this system, while three assay aliquots alone cannot establish repetition across preparations.

---

**How many data points do we really have? — 13:52–13:54**

We just established the 36/12/6 hierarchy. Now ask: if someone analysed all 36 readings as 36 separate biological observations, what would happen? The analysis would appear very precise — narrow uncertainty, confident conclusions — but that precision would be false, because most of it reflects measurement variation within a single lysate, not biological variation across preparations. This is not a rare mistake; it has a name — pseudoreplication — and it appears routinely in the literature. The point to land before the exercise: counting measurements is not the same as counting independent biological events. Two readings can look completely separate — different well positions, different labels, different numbers — and still carry the same biological information if they came from the same source. The exercise on the next slide asks exactly that question.

---

**Which observations are independent? — 13:54–13:57** [INTERACTION]

Use one minute of pair discussion and two minutes of debrief. A shares a lysate; B shares its preparation and possibly day; C can share day conditions. Do not simply label C independent. Independence is about the process and model, not the distance between dots or their different identifiers. For C, introduce only that some preparations were measured on the same day. The next slide reveals the full day layout. No numerical plot is needed: the shared sources follow from the experimental history.

---

**Each day: two preparations, both conditions — 13:57–14:00**

This is the final notebook reveal: two preparation pairs on each day, with both conditions in every pair. Ask the audience to trace one within-day comparison. A change in conditions between days is a batch effect. If a day adds the same amount to both conditions, subtraction removes that component. Ask what happens if Q's response itself differs by day.

---

**What if controls ran on Monday? — 14:00–14:03**

Explicitly announce that this is not our actual protocol. It is a hypothetical scheduling shortcut. Give pairs time to identify the missing comparison. Without within-day treatment comparisons, a difference could arise from treatment, day, or both. Label this confounding only after the audience explains the problem. Give the layout comparison its full three minutes. Close the first 35-minute section with “What claim does this experiment permit?” A treatment-specific claim cannot be separated from a day effect in this alternative layout.

---

### 2 · Question and claim (14:03–14:26)

---

**What does “the compound works” mean? — 14:03–14:06**

We can now describe the experiment, but what was it intended to establish? Read the lab-meeting claim aloud. Invite two interpretations of “works.” Then reveal the endpoint. This assay addresses activity in a particular preparation under particular conditions; it does not by itself demonstrate a mechanism or clinical benefit.

---

**What quantity are we trying to learn? — 14:06–14:09**

We need to state the quantity we want to learn about. Within each preparation, compare the activity with Q against its vehicle tube. Then our target is the mean of that difference across the relevant population of preparations under these conditions. Keep the language as “the quantity we want to learn.” Do not introduce a technical name or teach how to compute an average. The target is the average biological change across relevant preparations, not the number of measurements. We are defining the question, not summarizing data.

---

**Which future experiments should this inform? — 14:09–14:13**

Six preparations are the ones we observed. Our question usually reaches beyond them to preparations we might make next. That collection of possible preparations, under defined culture and assay conditions, is a target population. It need not be a population of people. Ask which conditions should be held fixed and which may vary within the claim.

---

**What population would you claim this applies to? — 14:13–14:21** [INTERACTION]

Three minutes in pairs, three minutes hearing two arguments, two minutes to debrief. A is the intended narrow target, not a guaranteed extrapolation. Ask whether the six preparations and three days cover the conditions they mean by “these conditions,” and whether selection, QC or unrecorded batches matter. Fold the previous separate scope-of-replication slide into this debrief: repeated preparations of L1 cover preparation variation; other cell lines or donors require additional biological sampling, and a claim across laboratories needs evidence relevant to laboratories. More assay readings of these lysates cannot supply those missing systems. B requires sampling additional biological systems. C requires a much broader chain of evidence; do not turn this into a clinical-trial lecture.

*(Note: The takeaway "What would you need to know before choosing A?" is a fragment — it does not appear until you advance. Do not read it aloud at the start of the discussion.)*

---

**Which observations describe the treatment response? — 14:21–14:26** [INTERACTION]

The opening block is complete. Use these five minutes to connect its design to the observations we will describe. Give pairs two minutes to identify the relevant change and three minutes to debrief. Each tube contributes the arithmetic average of its three technical readings; no aliquots were omitted. Each preparation then supplies one Q-minus-vehicle comparison. This preprocessing respects the simple balanced assay design. The term average is familiar language here; its definition comes later. Ask which experimental space the six preparations cover. The data follow on the next slide.

---

### 3 · Reading the data (14:26–14:46)

---

**What do the data actually look like? — 14:26–14:29**

Welcome back. These are the established data, now displayed as twelve tube values forming six biological comparisons. Each dot averages the three technical assay readings from its lysate. Ask for descriptions before explaining the pattern. Four pairs decrease, P2 is almost unchanged, and P5 increases. Do not equate lower activity with therapeutic benefit. P2 differs by only about 0.003 U/mg before display rounding.

---

**How large is each preparation’s change? — 14:29–14:32** [INTERACTION]

Use one minute of paired observation and two minutes for a debrief. The horizontal reference marks equal observed activities in a pair. Negative values mean lower activity with Q. Four reductions range from about 6 to 24 U/mg, one comparison is nearly unchanged, and P5 goes upwards. P4 has the largest reduction. The downward direction appears in several preparations, not just P4. P5 is worth asking about; an opposite direction is not itself proof of a mistake. No deletion or formal leave-one-out procedure is needed.

---

**The average and the middle answer different questions — 14:32–14:35**

The mean is -10.4 U/mg and uses every observed magnitude. The median is -11.9 U/mg: with six observations, it is halfway between the third and fourth ordered changes, about −17.68 and −6.18. Use the dots to illustrate the average as a balance point and the median as the middle position. The mean is a natural description of an average quantitative change, especially with approximately symmetric values; the median describes the middle. Our original scientific question concerned an average difference, so retain that distinction rather than swapping targets for a nicer number.

---

**What is a quartile? — 14:35–14:37**

Start with the dots: twelve values, sorted from smallest to largest. Cut them into four groups with the same number of values — three each, so each group holds a quarter. The three cuts are the quartiles. The first cut, Q1, has a quarter of the values below it. The middle cut, Q2, has half below it — that is the median we just met. The third cut, Q3, has three quarters below it. Then move to the bottom half of the figure: a box plot is simply a drawing of these cuts. The box runs from Q1 to Q3, so it always contains the middle half of the values; the line inside is the median; the lines on either side reach out to the lowest and highest quarter. Do not explain how software places the cut when the values do not divide evenly — conventions differ slightly and it does not matter here.

---

**How far do changes lie from their mean? — 14:37–14:40**

Point to the mean line and the distance to each preparation’s change. Squaring distances makes them nonnegative and gives large deviations greater influence. Sample variance sums these squared deviations and divides by n−1, here five; its value is 147.5 in squared activity units. SD is its square root, 12.1 U/mg. Mention the sample denominator once in speech if needed, with no derivation or exercise. We are describing spread among the six changes, not the precision of their mean. Avoid a percentage-within-one-SD rule for these six values.

---

**Which plot preserves the information we need? — 14:40–14:43**

The paired plot preserves both activities and the relationship within a preparation. The boxplot summarizes the six differences rather than treating the two conditions as unpaired groups. Explain that the box runs from Q1 to Q3, and its central line is the median. Whiskers extend to observed values within 1.5 IQR of the quartiles; here they reach the observed extremes. All six points are shown, including those overlaid near the median or whiskers. With six changes, the raw observations carry essential information. A boxplot alone would hide it. Do not read its whiskers as a precision interval or treat points outside whiskers as automatic errors.

---

**How would you describe this result to a colleague? — 14:43–14:46** [INTERACTION]

Give one minute to write and one minute to hear a response. Reveal one acceptable description for the final minute. Four preparations decrease, P2 is nearly unchanged, P5 increases; the largest decrease is P4. The mean is -10.4 and SD 12.1 U/mg. Participants may additionally use median -11.9, IQR 18.6, or the observed span if they say what those summaries describe. They should not imply that every preparation decreased or that Q has a proven mechanism. Ask whether the wording faithfully preserves heterogeneity.

---

### 4 · Effect and uncertainty (14:46–15:06)

---

**Six preparations give one estimate — 14:46–14:48**

Return to the six unchanged paired changes. Each is a Q-minus-vehicle contrast after technical repeats were averaged within each tube. The vertical line is their mean, −10.4 U/mg. Our target is the average paired effect across the specified L1 preparation process. The sample gives an estimate of that quantity, not its known population value. Preserve the culture conditions, dose and 24-hour endpoint from the opening.

---

**New preparations, new mean — 14:48–14:51**

Trace one row: six paired changes become one diamond. Then compare three rows. These are the first three repetitions from the fixed seed, not selected examples. In our teaching simulation we know the true average: −14 U/mg. The experiment’s estimate need not equal it. This value was already in the original data-generating model; it was not fitted to −10.4. The generator preserves normal preparation effects (SD 9), tube errors (SD 3), three technical errors (SD 2.5) and two-decimal assay rounding. Shared additive preparation and day baselines cancel in paired differences, apart from negligible rounding. There is no treatment-by-day variation. Real experiments do not give us a known truth.

---

**What happens when we collect the means? — 14:51–14:54**

Reveal 10, then 100, then 10,000 accumulated means. Each comes from six newly generated paired changes. The frequency scale is a fraction of experiments so panels remain comparable as repetitions accumulate. Point to the fixed −14 line. Name this the sampling distribution of the mean. This is not the shape of our original six measurements, and it is not a probability distribution for possible true means. Simulation approximates what repeated sampling under the known model would generate; it does not turn our one observed experiment into 10,000 real replications.

---

**Preparations vary more than their mean does — 14:54–14:57**

Spend one minute asking what one contribution represents on each side. The left pools preparation responses from the repeated simulations; the right contains one mean per experiment. Both horizontal axes are identical. The spread of the means is the standard error of this estimator. Simulated response SD is about 10.2 U/mg; simulated SD of means is about 4.1 U/mg. These are model repetition results, not the original sample’s SD of 12.1 or its estimated SE. Variation among individual responses and variability of their estimated average answer different questions. This is not a recommendation to replace raw observations with SEM error bars.

---

**How can one experiment estimate that spread? — 14:57–14:59**

Only now show the formula. The true SE uses the population SD; we estimate it by substituting the sample SD. Using full precision, 12.1445/sqrt(6)=4.9580 U/mg. Display rounding gives 5.0. This estimate need not equal the simulated long-run SE of about 4.1: the six observed responses are themselves a variable sample. The formula requires independent, identically distributed contrasts with finite variance. It is not automatically valid for shared treatment-by-day responses, clustered preparations, or correlated repeated measures. Normality is not needed for this variance identity; the small-sample t interval introduced next uses a stronger distributional assumption.

---

**Can we show a range around our estimate? — 14:59–15:01**

Motivate the range before revealing it. An interval combines the best estimate and uncertainty in that estimate. This is a paired t interval, calculated on the six differences, not separate intervals around vehicle and compound. The offline calculation is mean ± qt(0.975,5) × sample SD/sqrt(6), with multiplier 2.5706 and margin 12.7449 U/mg. At n=6 a generic two-SE shortcut is too narrow. Explain the method’s name briefly without a derivation. Exact nominal coverage requires independent normal differences; the existing Gaussian generator meets this before negligible measurement rounding. Six observations cannot establish approximate normality. Real data would require substantive checks of the model and dependence.

---

**What does our interval tell us? — 15:01–15:04**

Point to the numbers first. Minus twenty-three to plus two. Those are the effect sizes we cannot dismiss with this data. Ask participants: does that include zero? Yes. Does it include a ten-unit reduction? Yes. Does it include a twenty-unit reduction? Yes. Everything in that range is compatible with what we observed. The 95% does not mean there is a 95% chance the true effect is somewhere in that interval — the true effect is a fixed number, not a random variable. What varies is the interval itself: if we ran the experiment again, we would get a different interval. Roughly 95% of all such intervals, across many repetitions, would catch the true value. But we do not have many repetitions — we have one, and it either caught it or it did not. The practical message: report the interval, and read it as a range of plausible values.

---

**Report the estimate and its precision — 15:04–15:06**

Many papers still report mean ± SD when describing a treatment effect. The SD is a correct description of preparation-to-preparation variability, but it does not address how confidently the mean has been estimated. If the question is "how large is the effect, and how well do we know it?", the SE or CI is the relevant quantity. A wider CI from six preparations tells the reader more about the reliability of the estimate than an SD does. SD remains appropriate when the goal is genuinely to characterise variability — for instance, describing how heterogeneous a cell population is. The choice depends on the claim.

---

### 5 · p-values (15:06–15:27)

---

**Could this result arise if there were no effect? — 15:06–15:08** [INTERACTION]

Pose the question: suppose there were no average treatment effect — how unusual would our estimate be? Invite predictions before the reveal. Keep the six observed differences and −10.4 estimate unchanged. Change only the mean effect in the simulation from −14 to zero. Biological effect SD remains 9, tube SD 3 and technical-reading SD 2.5; pairing, triplicate averaging and assay rounding remain. Positive and negative preparation effects can still occur. Do not name the null hypothesis yet. This is a hypothetical generating model, not a conclusion about compound Q.

---

**What would the no-effect model produce? — 15:08–15:11**

Accumulate 10, 100 and 10,000 means before naming the distribution on a final click. Define a null distribution as the distribution of the statistic across repeated experiments if the null hypothesis and model assumptions were true. Then name H0: the population mean paired effect is zero. The horizontal axis is in the same units, with the same 36-unit span and one-unit bins as the previous sampling-distribution sequence, now centered on zero. It is not a histogram of six observations and not a distribution of probabilities that hypotheses are true.

---

**How many standard errors away from zero? — 15:11–15:14**

Point to the figure. Zero is where no effect would sit. Our mean is 2.1 SE steps below it. That gap is what we need to judge — not the raw number, but how far it sits relative to the uncertainty in our estimate. Name it once: this SE-step distance is the t statistic, t = −2.10; it is the number software reports and the one you will see in papers. Negative means lower activity with Q; we will count distance in either direction. The question now is how often the null model would produce a result at least this far from zero. That is what the next slide answers.

---

**How often would a result be at least this extreme? — 15:14–15:17**

Point to the observed t at −2.10 and the equally distant +2.10 boundary. The question was about an average change in either direction, so add both tail probabilities. The actual paired t p-value is 0.08987058, rounded to 0.090. Under H0 and the assumptions, about 9% of repeated experiments produce absolute t at least 2.10. The simulation gives 9.07%, close to the analytical value; it is the standardized statistic, not the raw mean, being counted. Integrating the t distribution includes its entire infinite tails even though the plot shows only −5 to +5. Do not choose the direction after seeing a negative estimate.

---

**What does p = 0.090 mean? — 15:17–15:21** [INTERACTION]

Give one minute of individual choice and a minute of pair discussion, then reveal and debrief. All options reverse or distort the conditional statement. We assumed H0 to calculate the reference distribution; we did not calculate its probability. One minus p is not a probability that a compound works, and a large p does not prove zero effect.

---

**What does a 0.05 decision rule control? — 15:21–15:24**

Only now introduce alpha as the prespecified decision threshold, a convention rather than a natural evidence boundary. A rejection under the chosen rule is often called statistically significant; that label does not establish biological importance. Every displayed experiment was generated with a true zero mean. Each rust cross is a rejection of a true H0, called a Type I error. There are not necessarily exactly five crosses in each block of 100; the first 100 are shown unselected. Across the same 10,000 null experiments 4.98% meet p<0.05. Under the ideal continuous normal model this rule’s long-run Type I rate is 5%; our rounded simulation approximates it. Alpha is not the probability that a particular conclusion is wrong, nor the proportion of all rejected claims that are false. A testing rule must be fixed in advance; do not retune it for the observed result.

---

**Are these scientifically different? — 15:24–15:26** [INTERACTION]

Ask whether these values alone make the studies scientifically different. Under a prespecified p<0.05 rule the labels differ, but the data’s incompatibility with the null changes continuously rather than jumping at the cutoff. The comparison is only about nearby values for comparable analyses; p-values alone cannot rank very different experiments or scientific importance. A statistically significant result can be biologically small and does not guarantee replication. A result just above the convention does not establish no effect. Ask for estimates, intervals, design and biological context.

---

**A small p-value is not a large effect — 15:26–15:27**

Point at the two p-values first: identical. Then at the two effects: −2 versus −20 U/mg. Experiment A has 200 pairs, so even a tiny change is estimated precisely and lies far from zero in SE steps. Experiment B has only six pairs, so a large change gives the same p. Ask which result matters biologically. A loss of 2 U/mg against roughly 98 U/mg is about 2% of activity; −20 is about 20%. The p-value cannot tell you this; the effect and its interval can. Both experiments are constructed illustrations, not L1 data.

---

---

## BREAK (15:30–16:00)

---

### Break (15:30–16:00)

---

**Break — 15:30–16:00**

Pause for the full 30 minutes and resume at 16:00. Any time left before 15:30 is buffer for questions from the first part. Do not use the break to add teaching content.

---

---

## PART 2 (16:00–18:30)

---

### 6 · Power and design (16:00–16:33)

---

**My p-value is 0.09. What should I do? — 16:00–16:04** [INTERACTION]

Let the audience advise a researcher who arrives after data collection wanting significance. Collect suggestions without classifying them yet: repeat, increase N, remove an outlier, another test, one-sided test, reduce variability, or conclude Q does not work. Spend two minutes collecting, one minute asking what information is missing, and one minute framing: why did this experiment not give a clear answer to the biological question? p=0.090 is not a failed experiment or a judgment on the researcher. The estimate and wide interval leave useful possibilities unresolved. These are the actual unchanged fictional Part 1 data. Keep the suggested actions visible on a board for the return later.

---

**Suppose the true mean effect is −14 U/mg — 16:04–16:06** [INTERACTION]

Ask for a prediction before explaining. We return to the original generating model, whose mean −14 was fixed before its observed sample existed. It is not the observed estimate −10.4, not an estimate of truth derived from p, and not a validated minimum relevant effect. Each repetition creates six independent preparation changes with biological effect SD 9, tube SD 3 and triplicate technical SD 2.5; additive shared baselines cancel. The two-sided paired t rule is fixed at 0.05 for this illustration. It is not a mandatory rule for all science.

---

**Same biology, different experiments — 16:06–16:09** [INTERACTION]

Let participants inspect the two experiments for one minute. Dots are the six changes; the lower diamond is their mean and the line is its 95% interval. Repeat 1 has mean −16.4, CI −28.5 to −4.3, p=0.018. Repeat 8 has mean −9.5, CI −19.2 to +0.3, p=0.054. We deliberately selected the first experiment of each decision type to contrast outcomes; this pair does not estimate their frequencies. Both came from the same −14 population. Sampling variability changes the mean and estimated SD, so the threshold result can differ. Do not name power yet. A difference between labels is not evidence of a biological difference between the generating populations.

---

**What proportion would cross the threshold? — 16:09–16:12**

Ask the audience to estimate the proportion of crosses, then reveal 78% across 10,000 trials. Only on the next click name statistical power. In plain language it is the long-run probability that this experiment and analysis will reject under a specified nonzero effect. It belongs to a full set of assumptions: effect, variability, independent N, design, alpha and analysis. The finite simulation gives 78%; the ideal normal paired-difference calculation gives about 76.9%, a Monte Carlo difference of about one percentage point. Do not present either as a guarantee that a particular replication succeeds. The crosses use the same decision symbols as Part 1, but the assumed truth is now nonzero; they are not Type I errors in this scenario. The first 100 are unselected; the illustrative pair from the previous slide is not the frequency denominator.

---

**p > α does not mean no effect — 16:12–16:13**

State this once, clearly, and move on. The interval covers zero — that is why p exceeds α. But it also covers biologically meaningful reductions: −23 U/mg against a vehicle mean of about 98 U/mg is a loss of roughly 24% of activity. A non-significant result from this experiment cannot distinguish "no effect" from "an effect we lacked the power to see." Do not open a discussion.

*(Takeaway: Absence of evidence is not evidence of absence. — Altman & Bland 1995)*

---

**What would change that proportion? — 16:13–16:17**

Use four short predictions, one before each reveal. Larger true effect moves estimates further from zero; lower biological variability narrows their distribution; larger independent N lowers SE. A smaller alpha lowers the long-run Type I rate but also lowers power, all else fixed. Baseline is effect magnitude 14, n=6, biological-effect SD 9, tube SD 3, technical SD 2.5 with three aliquots, and two-sided alpha 0.05. The variability curve changes only biological-effect SD and retains the measurement components. These curves use exact noncentral-t probabilities under independent normal differences, counting both tails. No derivation is needed. Do not recommend loosening alpha to rescue the observed p-value; it is a prospective decision setting.

---

**What effect is worth detecting? — 16:17–16:21** [INTERACTION]

Ask participants to describe how they would decide whether an enzyme-activity reduction matters: downstream biology, assay reliability, prior evidence or a decision to proceed. The observed effect is a noisy estimate from a small sample; it is not automatically the truth to plug into planning. The teaching mean −14 is likewise not an established relevant threshold. Specify a minimum relevant effect on the same U/mg scale and within the defined L1 conditions. Planning detects a departure from zero assuming an effect of that size; it does not prove an effect exceeds the relevance boundary. No numeric biological threshold is invented.

---

**Can a better comparison remove irrelevant variation? — 16:21–16:24**

Compare twelve unrelated preparations, six per condition, with six independent preparations split into twelve tubes. Both layouts balance conditions across days, so this comparison isolates matching instead of deliberately confounding treatment with day. Unrelated preparation baselines vary with SD 15 and no longer cancel within contrasts; the mean estimate’s simulated SE is about 9.6 instead of 4.2 U/mg. Both use three assay readings per tube and the same treatment effect process. Randomization is still within the relevant allocation structure. Pairing is useful because matching captures a positively shared baseline; it is not automatically better for arbitrary pairs or every cost/covariance structure. Measuring all controls on unrelated control-only days would add possible confounding, which statistics cannot remove by increasing N. This figure compares estimator precision, not a menu of tests or proof that every paired design is superior.

---

**Where should six additional assay wells go? — 16:24–16:27** [INTERACTION]

Make the resource unit explicit: assay wells, not culture tubes. Current design uses 36 readings. Option A adds one assay reading to each tube in three existing pairs, six additional technical readings. Option B adds one independent preparation split into two tubes, with three readings each, also six assay wells. A reduces SE to 99.7% of baseline; B to about 92.6%. In this model response variation dominates, so independent replication brings more information about the population mean. The numerical comparison concerns precision, not applying an unmodified t calibration to unequal technical counts. Technical replication is useful for measurement precision and assay reliability, especially when technical error is substantial; its value depends on the components and total costs. Option B requires preparation and culture resources beyond assay wells. Never call technical replicates independent biological units.

---

**How many pairs does your experiment need? — 16:27–16:30** [INTERACTION]

Use the grid rather than announcing one N. For assumed effect magnitude 10 and paired-change SD 12, the smallest integer N meeting 80% is 14 completed pairs. With effect 6 and SD 16 it is 58; with effect 14 and SD 8 it is 5. The grid uses the normal independent paired-difference model and counts both rejection tails. Eighty percent is a common planning convention, not a universal standard; neither is alpha 0.05 mandatory. The effect and SD values are illustrative scenarios, not validated biological relevance thresholds or confidence bounds from this pilot. If assumptions are wrong, achieved performance changes. Report them, examine sensitivity and consider credible external or pilot variance information without trusting one noisy point estimate. These values exclude attrition, operational block constraints and model misspecification.

---

**My p-value is 0.09. What should I do now? — 16:30–16:33** [INTERACTION]

Return to the audience’s original suggestions and let them revise one. Interpretation, acknowledging uncertainty, an independent replication if justified, better design, reduced avoidable variation and prospective biological replication are defensible directions. A method may need correction if scientifically or diagnostically inappropriate, and exclusions can be justified by an established QC rule; changing choices solely for significance is different and requires transparent handling rather than result shopping. Do not choose a one-sided question after seeing the direction or keep adding observations until a threshold appears. Establish the principle only; the later block will address flexible analysis in detail. Neither high power guarantees replication nor low planned power automatically invalidates a significant result. Evaluate design, assumptions, effect, interval and reporting.

---

### 7 · Many outcomes, many choices (16:33–16:56)

---

**We measured 20 outcomes. One gave p = 0.03. — 16:33–16:35** [INTERACTION]

Ask for an answer before revealing the distinction. The raw p-value still describes its particular test under that test's assumptions. But finding a small result after twenty chances is a different event from a single preselected comparison. State the central question aloud: how many chances did we give ourselves to find something? This is a hypothetical expanded L1 protocol; the original enzyme result has not been changed to 0.03. No correction method is needed yet.

---

**How many chances did we give ourselves? — 16:35–16:38** [INTERACTION]

Collect predictions before revealing the grid. Crosses mean at least one of twenty null tests crossed 0.05; the first hundred families are unselected. Across all 10,000, 64.27% had one or more. On the next click show the independence calculation: the probability none crosses is .95 to the twentieth power, so its complement is about .6415. Emphasize that this exact formula requires independent tests with exact .05 marginal size. Correlated valid marker tests do not generally have this same probability. Distinguish the per-test probability from the chance of any false rejection across a family; an expected false count is a third quantity, introduced later.

---

**Which claims belong to the same family? — 16:38–16:40** [INTERACTION]

Only now name FWER. It is a probability that any true null in a defined family is rejected, even if some other hypotheses in that family are false. Ask which outcomes contribute to the same intended claim or decision. Twenty cytokines for one question may form a family; so might several contrasts, time points or primary endpoints. Scientific context and the promised error protection determine the family; there is not one uniquely correct grouping independent of purpose. Define it prospectively where possible, not after seeing which grouping gives a favorable result.

---

**What if we measured 20,000 genes? — 16:40–16:42**

Change scale to an exploratory transcriptome-wide screen. Under twenty thousand true nulls, the expected number of raw p-values below .05 is one thousand. Expectation is a repeated-run average, not an exact count in one screen. This expected-count calculation uses linearity of expectation and does not require independent tests if each marginal size is .05; valid conservative tests give at most that expectation. Under independence the probability of at least one is essentially one, a different quantity from the expected count. The dot display depicts the expectation rather than an invented RNA-seq dataset or software output. Protecting against even one error may be demanding for candidate discovery, motivating a different scientific goal.

---

**What error promise fits a discovery list? — 16:42–16:44**

Contrast the scientific aim of avoiding even one false confirmatory claim with producing a candidate list for follow-up. Name FDR only after posing the list question. FDR is the expected proportion of false discoveries among all discoveries; if there are no discoveries, the fraction is zero by convention. The first eighty BH-controlled screens show variable realized fractions; the teal line marks the mean across ten thousand, about 4.1%. FDR 5% is not a guarantee about this list — it is a repeated-use expectation. A realized list can have zero, a large fraction, or even all false discoveries. In real science we do not know which specific claims are false. The concept of a fraction rather than a count is the take-home.

---

**Which promise does the scientific question need? — 16:44–16:46**

Compare promises rather than declaring a winning correction. A few prespecified primary outcomes may need strong protection against any false claim. A transcriptome-wide candidate screen with independent confirmation planned may prioritize a controlled expected false fraction. In the mixed simulation BH gives FDR 4.13% and FWER 10.16%; those are different denominators and summaries, not contradictory results. These realized rates are model-specific, not guarantees for all datasets. Error control does not establish biological importance; keep magnitude, uncertainty and validation in view.

---

**You report p = 0.03. What else did you try? — 16:46–16:49** [INTERACTION]

Reveal the choices one at a time and invite examples. Multiplicity can come from planned parallel tests and from decisions affected by observed outcomes. The opportunities are not interchangeable: paired versus unpaired must follow design; transformations and exclusions can be scientifically justified; stopping rules change the sampling procedure. Do not automatically apply a simple Bonferroni count to every option on this slide. The issue is what full selection process produced the reported analysis and whether its claimed error guarantee accounts for that process. Avoid moralizing: thoughtful analysts can create a data-dependent path without deliberate threshold chasing.

---

**The test direction must be specified before seeing the data — 16:49–16:51**

The one-sided versus two-sided decision must be made before the data are examined, not after. For the L1 experiment: two-sided p is 0.090. If you look at the data, observe the negative sign, and then decide to use a one-sided test, you obtain p = 0.045 — just across the threshold. But you used the data twice: once to choose the direction, and once to compute the p-value. The effective α is no longer 0.05. The test is legitimate only if the direction was fixed before collection on scientific grounds — for example, if a positive enzyme increase from a kinase inhibitor is mechanistically impossible and would not be reported regardless of size. That constraint must be documented before the experiment. Retrospective justification ("of course we only expected a reduction") is not equivalent.

---

**Exploration is useful science — 16:51–16:53**

Reconnect to Part 1. Transformations, subgroup inspection and hypothesis generation are legitimate exploratory work. The problem is attaching confirmatory error guarantees as though the hypothesis and analysis had been fixed before those same observations were examined. Report discovery as discovery and independently test important resulting claims with an appropriate design. Independence means genuinely new information not reused to select the claim; it does not guarantee success. Avoid suggesting that every exploratory calculation needs a mechanical adjustment or that exploration is inferior science. Land the key message: when the hypothesis was suggested by the same data, a p-value from those data has almost no evidential value — it describes how unusual the pattern was that we already selected for being unusual. Show the exploration; reserve testing for the new experiment.

---

**What does the reader learn from these two reports? — 16:53–16:56** [INTERACTION]

Allow a minute to compare reports and two to discuss. Imagine twenty measured outcomes, nineteen without a small p and one p=.03. Report A hides that context. Report B tells the reader what the family was and makes the full results available; it must actually provide the named estimates and analysis, not merely claim transparency. If Bonferroni on twenty was the plan, .03 becomes .60; other strategies depend on the specified purpose. Reporting all outcomes does not itself correct invalid inference, but concealing them prevents assessment. Distinguish raw from adjusted p-values and ordinary from multiplicity-aware intervals. Do not describe the nineteen as proof that those markers have no effect.

---

### 8 · The design chooses the analysis (16:56–17:24)

---

**Which statistical test should I use? — 16:56–16:59** [INTERACTION]

Give pairs a minute to request information before revealing the six prompts one at a time. Take two suggestions and ask what each would change. A spreadsheet and a software menu do not specify the experiment. Do not answer with a test yet.

---

**120 cells. What is N? — 16:59–17:01** [INTERACTION]

Deliberately withhold counts at the higher levels. Allow a short discussion before explaining that a single N can hide several levels: assignment units, sampled donors, cultures, wells and cells. Request identities, allocation, pooling and shared batches. If Q was assigned to cultures, cells are subsamples; if wells were assigned within cultures, the design is blocked or clustered rather than simply 120 independent cells. The model must reflect where independent information enters.

---

**Metadata decide the analysis — 17:01–17:02**

The previous slide could not be answered from the row count, only from metadata. For every measured value, record which preparation, culture or donor it came from, the day or batch, the treated tube or well, and the technical replicate number. Add plate positions, passage numbers, reagent lots and any exclusion with its reason. This costs minutes at the bench and is impossible to recover later. It is also what lets a statistician — or a reviewer — check pairing, blocking and pseudoreplication.

---

**Same measurements. Same analysis? — 17:02–17:05**

Have the audience predict whether the mean difference or its uncertainty changes. Both analyses give −10.4. Under unrelated-culture assumptions the Welch interval is −33.6 to 12.8; under the actual paired design it is −23.2 to 2.3. This is a counterfactual illustration, not permission to choose the narrower result. Positive within-pair association removes shared variation here. Pairing does not universally improve precision; covariance and the cost/design context matter. Choose the procedure from provenance before inspecting which gives a preferred answer.

---

**Pairing and blocking buy power — 17:05–17:06**

Generalise the previous slide. Splitting each preparation into a vehicle and a Q tube — or running both conditions on the same day, plate or animal — lets the shared variation cancel in the comparison. The same twelve tubes then give a narrower interval and a higher chance of detecting a real effect, so fewer independent units are needed for the same precision. This links back to the power block in this session. Two conditions: the shared source must be real (same preparation, day, donor or litter), and the analysis must keep the pairing; a paired design analysed as unrelated groups throws the advantage away. Pairing only helps when the paired units actually resemble each other.

---

**Four doses: should we run six separate tests? — 17:06–17:08**

Ask why four groups yield six pairs and reconnect to the multiplicity block. A group indicator linear model represents the four means together; classical one-way ANOVA tests a restriction on those means. A two-group equal-variance t-test is a special case of that classical framework. Do not quietly equate an ordinary homoscedastic linear-model fit with Welch: unequal variances can require Welch-type or other suitable inference. A common model does not by itself eliminate multiplicity.

---

**Does Q have the same effect in both genotypes? — 17:08–17:11**

Ask participants to compare slopes before naming interaction. The fitted Q effect is −27.9 in wild type and −4.8 in knockout; knockout minus wild-type effect is +23.0 activity units (model-based 95% CI approximately 11.8 to 34.2). A factorial linear model estimates this difference of differences. These are independent cultures with normal equal-SD errors in the teaching generator. Genotype need not be randomized, and a genotype mechanism claim requires comparable genetic backgrounds and design. Significant in wild type but not in knockout does not itself establish different effects; assess the interaction directly, with its interval. No factorial table drill.

---

**Simple designs need fewer replicates — 17:11–17:12**

Look back at the last few slides: two groups, paired, four doses, genotype by treatment. Each step adds groups or factors, and each step spreads the same number of replicates thinner. A paired two-condition comparison concentrates all independent replication on one question; that is why it needs the smallest N. Comparisons among several doses or genotypes need more units per group, and an interaction — a difference between two effects — is estimated with roughly twice the SE of a main effect, so detecting one of the same size needs about four times the sample size. Before adding conditions, ask whether each one serves the primary question.

---

**Time-course experiments: showing the effect vs. testing it — 17:12–17:15** [INTERACTION]

Two minutes in pairs, then collect two or three answers. Most will say six tests or one two-way ANOVA. The problem with six separate tests: every time point draws its tubes from the same preparations, so the comparisons are correlated and the false positive rate is inflated unless corrected. The problem with two-way ANOVA: it assumes all measurements are independent observations. A lysate assay cannot measure one tube twice, so each time point is a separate tube — but tubes harvested at 2 h and 24 h from the same preparation share its biology, handling, passage and any uncontrolled drift. They are related, not independent. A standard two-way ANOVA ignores that correlation entirely. Time-courses are almost always pioneering experiments — you are watching when and how an effect develops. That is exploration, not confirmation.

---

**A time-course is most honest as exploration — 17:15–17:17**

Present these as three legitimate routes, not a hierarchy. Most time-course experiments in this audience's work are genuinely exploratory — the researcher wants to know whether the effect builds, peaks, or reverses. That is valuable science; it does not require a p-value. If the biological question really is about a specific time point — for example, the moment of peak inhibition as established by prior literature — pre-specify it before collecting data and test once. If multiple time points were pre-planned, apply FWER correction such as Holm. If the shape of the whole curve matters, reduce each experimental unit to one derived number first: AUC summarises total exposure; a rate constant or half-maximum time captures kinetics. Each unit then gives one observation and you can run an ordinary t-test or regression on those derived values. Do not test every time point and report only the significant ones.

---

**Do 100 cells from one culture give N = 100? — 17:17–17:19**

Retrieve pseudoreplication. Cells from a common culture can share biology and handling; repeated measurements of an animal share that animal. Appropriate unit summaries can answer a unit-level question, but discard some information and need scientifically sensible weighting. Hierarchical or mixed-effects models can represent shared variation and repeated structure when supported by enough independent units. A mixed model cannot manufacture independent biological replication from a single culture or resolve treatment perfectly confounded with culture. Distinguish repeated times from independent repeated experiments.

---

**Does a normality test tell you which analysis to use? — 17:19–17:22** [INTERACTION]

Collect a vote before revealing the answer. Failure to reject normality does not verify it. At small N there is little information about tails; at large N a tiny deviation can be detectable without invalidating mean inference. The relevant issue is adequacy of the model and sampling distribution for the intended estimate, not ritual use of a preliminary significance test. Robustness depends on sample size, skewness, outliers, allocation balance and variance patterns. Selecting an analysis through a preliminary test can also alter the operating properties of the whole procedure. Plots diagnose structure and problems; they cannot prove normality.

---

**Delete it? Transform? Switch the test? — 17:22–17:24** [INTERACTION]

Ask what evidence participants would seek before changing the analysis. This is a constructed dataset, not another alteration of the original assay. Check the source record, assay calibration, sample identity and prespecified QC criteria. Correct a verified recording error with an audit trail; exclusions require a defensible reason. A genuine extreme biological observation may matter to the mean and target population. Transformation changes the scale and often the effect quantity; a rank method answers another question. Sensitivity analyses can show influence, but report data-dependent choices and all relevant results. Never delete solely because a p-value improves.

---

### 9 · Figures (17:24–17:40)

---

**When the effect is multiplicative, use the log scale — 17:24–17:27**

Ask participants to predict what three-fold up and three-fold down look like on an absolute scale before revealing the left panel. Show the asymmetry: from a baseline of 100, three-fold up is +200 while three-fold down is only −67. The visual impression on the absolute scale is that the upward effect is roughly three times the downward effect — but both represent the same fold change. On the log₂ scale, both are ±1.58, which is why RNA-seq analysis uses log₂ fold change as standard. Connect to what they already know: when a paper reports "2-fold induction," that is a ratio, and ratios should be compared on the log scale. Briefly note that for the L1 enzyme data, absolute differences are appropriate: the baseline range is narrow (79–113 U/mg), effects are small fractions of baseline, and U/mg differences are directly interpretable. The choice depends on whether effects are expected to compound multiplicatively or add linearly across the measurement range.

---

**What does chopping the y-axis do? — 17:27–17:30** [INTERACTION]

Ask which panel shows the larger effect. Wait for a show of hands, then confirm: they are identical data. The right panel truncates the y-axis at 70, so the visible bar lengths represent roughly 27 and 17 units instead of 97 and 87. The visual height ratio is about 1.6; the actual ratio is about 1.1. The bar chart uses visual area as its information — cropping it at an arbitrary point changes that information without changing the numbers. For line plots and dot plots, a non-zero baseline with clearly labelled axes can be legitimate when the data range is far above zero; the bar chart is the problem because the bar's length is its encoding, and it starts at zero by convention. Ask participants to find an example in a paper they know.

---

**When values span orders of magnitude — 17:30–17:33** [INTERACTION]

Ask which panel lets them compare all four conditions meaningfully. On the linear scale, the three low-value bars are barely visible — they look identical even though low and high dose differ by four-fold. Publications often solve this by cutting out the middle of the y-axis with a break symbol. That removes the true distance between values from the visual — a reader cannot tell how far the stimulated bar is from the others. Log scale is the correct solution when data span more than one order of magnitude: on a log scale, equal vertical distances mean equal fold changes. The stimulated condition is about 80-fold above unstimulated. On the linear scale that relationship is invisible; on the log scale it is clearly encoded. Axis breaks are tempting and look authoritative in papers — point out they are almost always a sign that log scale should have been used instead.

---

**Many lab measurements belong on a log scale — 17:33–17:34**

Tie the last two slides together. Most quantities measured in a life-science lab — fluorescence intensity, qPCR and RNA-seq expression, Western blot or ELISA signals, cytokine concentrations, cell or colony counts — behave multiplicatively: treatments change them by a factor, and higher levels vary more. Log-transform before computing means, intervals and tests, and plot on a log axis. Report results as fold changes, back-transformed from the log scale. The L1 enzyme assay is an exception only because the effect is small relative to a narrow baseline range.

---

**Three error bars. Three different claims. — 17:34–17:37**

Cover the panel titles and ask what the bars mean. Reveal them. SD is the spread in the raw data — it describes biological variability and stays roughly constant as n increases. SEM is SD/√n — it shrinks as you add replicates regardless of the biology and describes estimation precision. A 95% CI is wider than SEM (approximately ±t·SEM for small n) and describes the range of effect sizes the data cannot rule out — which is what a reader needs to assess a claim. For six preparations, the CI is notably wider than the SEM. The rule from Part 1: use SD to describe how variable the preparations are; when reporting an effect, give the SEM or, better, the 95% CI — and always say which. The problem is not SEM itself but an unlabelled bar, or SEM used to describe variability, which makes the data look less variable than they are. Recall from Part 1: report the CI or SE with the effect estimate, not the SD alone, when your reader needs to know how precisely the effect is known.

---

**What does an honest figure let you do? — 17:37–17:40** [INTERACTION]

Allow two minutes in pairs, then collect answers. With the right panel, a reader can: see each individual preparation; see which preparations responded consistently; check whether one preparation is driving the result; verify the direction; mentally reproduce the paired analysis. With the left panel, a reader sees only group means and one aggregate uncertainty measure. The jitter in the bar chart does not show which Vehicle and Compound Q dots came from the same preparation — the pairing is invisible. The honest figure is not more complicated: it displays the same six values each, but preserves the experimental structure. Invite a brief discussion of whether participants' most recent submitted figure would pass this test.

---

### 10 · Workshop: compound R (17:40–18:16)

---

**“Compound R suppresses inflammation” — 17:40–17:42** [INTERACTION]

Present this as a colleague's lab-meeting slide, not a trap. Give participants a minute to react without correcting them. Most will find it convincing: a clean 40% reduction, tiny error bars, three stars, and the reassuring legend "representative of independent experiments". Do not reveal anything yet. Instructor-only provenance: the figure shows day 1 of four experiments; n = 3 are the three ELISA wells of one supernatant per condition; the Welch t-test on those wells gives p = 0.00008. The entire scenario is fictional teaching data (scripts/generate_workshop.R).

---

**What do you need to know before interpreting this? — 17:42–17:45** [INTERACTION]

Let participants supply questions for about two minutes, then group them for one minute. Do not show a checklist. Listen for: what does n = 3 count; how many independent experiments; what does "representative" mean and how was it chosen; were vehicle and R run on the same day; were other readouts measured; were any experiments or values left out; was the analysis planned in advance. Answer that the next slides reveal the details. Reward requests for provenance; avoid treating the researcher as dishonest — every step here is common practice.

---

**What was actually repeated? — 17:45–17:47** [INTERACTION]

Reveal each layer after asking for a guess. Each day a fresh culture is stimulated and one well receives vehicle, one R: the culture well is the experimental unit, and the day is the independent replicate of the comparison. The three ELISA wells measure the same supernatant; they describe pipetting and plate precision, not biology. So the reported n = 3 and p < 0.001 describe how reproducible the ELISA is on day 1. The honest n for the treatment effect is the number of experiments — four, or three after the exclusion we will see next. "Representative" meant the clearest-looking day. Link back to Part 1: these are technical triplicates presented as replicates.

---

**“Day 4 was left out — the stimulation didn't work.” — 17:47–17:49** [INTERACTION]

Ask what would make the exclusion legitimate before revealing the details. A valid exclusion needs a reason that is independent of the treatment result and, ideally, a rule written down before the data came in — for example, "an experiment counts only if LPS raises IL-6 at least ten-fold over an unstimulated well". Here there was no rule and no unstimulated well, so "the stimulation didn't work" cannot be checked. Vehicle IL-6 on day 4 was lower than on other days, but day 1 was not much higher. The decision was made after seeing that R had no effect that day. Do not accuse the researcher of misconduct: this is a very common, well-intended judgement. The next slides show how much it matters.

---

**Look at all four experiments — 17:49–17:52** [INTERACTION]

Give pairs two minutes. On the left, the days are pooled on a linear scale with SEM: the day-to-day differences in IL-6 (about 500 to 2400 pg/mL) swamp the treatment effect and the bars overlap. On the right, the same eight values are paired by day and plotted on a log scale: within each of days 1–3, R lowered IL-6 by roughly 25–40%, while on day 4 it did not. Connect three key messages: pair or block by day, use a log scale for cytokines, and show the individual experiments. Ask what a reader would conclude from each panel.

---

**Analyse the experiment, not the ELISA wells — 17:52–17:55**

Walk through the three numbers. The reported p < 0.001 came from ELISA wells of one day. The appropriate analysis uses one value per experiment: the log fold change R/vehicle within each day, then a paired (one-sample) t-test on those values. With days 1–3: IL-6 fell to 0.65 of vehicle (95% CI 0.46 to 0.92), p = 0.03. With all four days: 0.74 (0.46 to 1.18), p = 0.14. The estimate barely moves; the interval and the p-value do. Point out that the after-the-fact exclusion is exactly what moves p across 0.05. Neither version supports a confident claim: three or four experiments give a wide interval. The data are compatible with anything from a 50% reduction to no effect.

---

**IL-6, TNF and IL-1β were measured. Why report only IL-6? — 17:55–17:57** [INTERACTION]

Reveal that the ELISA panel also measured TNF and IL-1β, which showed no consistent change. IL-6 was reported because it "worked". That is not dishonest by intention, but it turns the experiment into a search: with three readouts the chance that at least one looks convincing by chance is higher than for one pre-chosen readout. The IL-6 signal is a reasonable hypothesis for a new experiment, with IL-6 named as the primary readout in advance. Also note the biology: an anti-inflammatory compound that lowers IL-6 but not TNF or IL-1β calls for a narrower claim than "suppresses inflammation".

---

**“Suppresses inflammation” — what can these data support? — 17:57–17:59** [INTERACTION]

Ask for votes and one reason each. Only the third option matches the evidence: one cell type, one stimulus, one dose, one readout, a consistent reduction in three of four experiments and an interval that still includes no effect. "Suppresses inflammation" generalises from one cytokine to a biological process; TNF and IL-1β contradict it. Patients are far outside the experimental space. Link back to the Part 1 population question: the claim follows what was sampled and measured, not the p-value.

---

**Done correctly, the answer is usually less exciting — 17:59–18:00**

Name what just happened. Every correction — counting experiments instead of ELISA wells, keeping day 4, reporting all three cytokines, narrowing the claim — made the result less spectacular. This is the normal experience of doing it properly, not bad luck. Reassure the audience: a modest, honest result is publishable, a solid basis for the next experiment, and far less likely to collapse when someone else repeats it. The exciting version is the one that tends not to replicate.

---

**Repeat the study so it can answer the question — 18:00–18:06** [INTERACTION]

Distribute workshop-design-canvas.html as a handout or keep this slide visible. Give six minutes with a one-minute warning. Circulate and ask: what is the experimental unit; how many independent experiments and why; do vehicle and R share a day and plate; what makes an experiment valid, decided in advance; what is the primary readout; which scale and figure. Accept different defensible designs. Do not supply a number for N without a relevant effect and an estimate of variability — but point out that the day-to-day variability seen here is useful planning information.

---

**One defensible repeat — not the only one — 18:06–18:09**

Ask one group to present its design first, then compare with this example. The repeat confirms the hypothesis generated by the original data; choosing IL-6 now does not make the old result confirmatory. N: with a standard deviation of about 0.4 in log2 fold change between experiments (as in the four days here) and a relevant effect of a 30% reduction, about seven paired experiments give 80% power at α = 0.05 — this is an illustration of the planning logic, not a recommendation. The QC rule makes exclusions independent of the treatment result. ELISA triplicates are kept and averaged per culture well: they improve the measurement, not N. Add a viability readout if the claim is that R lowers IL-6 production rather than killing cells.

---

**What improved before any test was run? — 18:09–18:11** [INTERACTION]

Ask groups for their single most consequential change and one remaining limitation. Some problems can be fixed by reanalysis now: show all four days, analyse per experiment, report both versions of the day-4 decision, report all three cytokines. Others need new data: more independent experiments, an unstimulated control, a fixed QC rule and a pre-chosen primary readout. A new experiment adds information; it is not a search for a better p-value.

---

**Plan the experiment before you pipette — 18:11–18:12**

Connect the comparison on the previous slide to a habit: every improvement in the planned repeat was a decision made before data collection. Recommend writing a one-page plan — question, primary readout, experimental unit, number of independent experiments, pairing or blocking, QC and exclusion rules, planned analysis — and discussing it with a colleague or statistician before starting. Point to the two books: Lazic is written for laboratory biologists and covers experimental units, pseudoreplication, blocking and power with lab examples; Glass covers the logic of hypotheses, controls and experimental strategy. Both are readable without a statistics background.

---

**“My p-value is below 0.001. Is my result real?” — 18:12–18:14** [INTERACTION]

Give participants about a minute to formulate a response, then reveal the prompt. Aim for a useful conversation rather than yes or no. The IL-6 reduction may well be real — three of four experiments point the same way — but the reported p-value describes ELISA precision on one day, and the honest evidence is weaker and depends on a post-hoc exclusion. The constructive answer is a planned repeat, not a verdict on the researcher.

---

**Ten things to take home — 18:14–18:15**

Read the ten messages without elaborating; each one was already discussed. Ask participants which one would most change how they plan or report their next experiment. Then move to the final slide.

---

**Statistics cannot rescue an experiment that could not answer the question. — 18:15–18:16**

Connect explicitly to the opening motivation: researchers often seek statistical help only after collecting data. This is an invitation to bring the biological question and protocol earlier, not a criticism of colleagues or a claim that imperfect data are worthless. Thoughtful reanalysis may recover supported comparisons; it cannot create missing independent units, identify completely confounded effects or supply absent population coverage. Ask each participant to choose one design conversation to have before the next collection. Thank them and stop here.

---

*End of narrative.*
