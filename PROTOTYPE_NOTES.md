> Completed Session 2: 03:00 including the 15-minute break, with the final redesign workshop and course landing. See FINAL_WORKSHOP_NOTES.md and workshop-design-canvas.html. Earlier scope descriptions below document preceding stages.

> Current continuation: Session 2 now ends at 02:35 after the analysis-from-design block. See SESSION2_TESTS_NOTES.md; the workshop remains unbuilt. Earlier block timings below are retained.

# Current prototype scope

The latest approved continuation extends the deck through elapsed minute 205, with 63 core slides plus one break. This is 25 minutes beyond the original three-hour Session 1 budget. The opening, descriptive block and uncertainty block are retained; the new 35-minute null-model/p-value block is documented in [NULL_BLOCK_NOTES.md](NULL_BLOCK_NOTES.md). It ends with the question about whether the experiment was too small; the subsequent block was subsequently started as a separate Session 2 presentation. See SESSION2_POWER_NOTES.md for that retained 18-slide, 50-minute opening, and SESSION2_MULTIPLICITY_NOTES.md for the following 45-minute block and 15-minute break. Session 1 content is unchanged.

The following records the retained opening revision; references to its scope apply to slides 1–19 only.

# Prototype notes — revised opening

## Scope and delivery

This revision contains **19 slides for the same opening 75 minutes**. It preserves the experiment → question → population sequence and the section boundaries at minutes 35 and 55. No later course material has been added. Slides and speaker notes are assembled from the same three section files into `_output/session-1.html`.

The audience sees no code, software interface or numerical analysis. The earlier R scripts, simulated data and exported figures are retained as authoring assets, but neither statistical plot is displayed in this revision. The opening no longer discloses the result or its measurement count.

## Gradual disclosure

1. **Opening:** only cells treated with Q, enzyme activity measured, and measurements “in triplicate.” No cell line, control, dose, time, total count or result is supplied.
2. **Ambiguity:** pairs propose meanings of triplicate before seeing three possible interpretations. These are labelled as possibilities, not protocol facts.
3. **One preparation:** show P1 splitting into randomly assigned vehicle/Q vessels. On a separate click, reveal the lysate/assay branch and explain what triplicate means here.
4. **Experimental unit:** locate treatment assignment at the culture vessel. Preserve its connection to the paired preparation.
5. **N:** disclose six independently initiated preparations. Invite counts with nouns, then reveal 36 readings, 12 assigned vessels and six paired biological comparisons together.
6. **Replication and control:** distinguish what was repeated; then reveal the matched solvent and dose.
7. **Shared variation:** discuss material, preparation and day. Only then show the complete three-day layout.

The underlying experiment remains plausible and unchanged. The fully confounded alternative is explicitly hypothetical. The uncertainty in the opening concerns missing provenance, not an artificially incompetent protocol.

## Conceptual-load review and consolidations

- Combined the separate N question and count-answer slide into one staged interaction. Its seven minutes retain the discussion and explanation time.
- Removed the paired-value plot. It repeated the preparation-sharing point and introduced vessel means before they were needed. Provenance is established with the experimental schematic instead.
- Absorbed “Which variation have we actually sampled?” into the existing eight-minute population discussion. The notes still distinguish preparation, donor/cell-line and laboratory scope.
- Retained “What quantity are we trying to learn?” with a verbal Q-minus-vehicle comparison and the average difference across relevant preparations. The technical label is absent from the slide and delivery notes. No averaging procedure or descriptive-statistics lesson is introduced.
- Kept the scientific-cycle slide as a possible prospective rationale, clearly labelled as hypothetical. Removed the detour into one-sided procedures.
- Added a five-minute retrieval synthesis immediately before the final slide. Its six questions revisit established ideas; they introduce no new statistical method.

The revision has fewer slides, while protecting the seven-minute claim-rewriting exercise and the eight-minute population exercise. “What claim does this experiment permit?” recurs in delivery notes, on the replication and claim slides, and as the final heading. Each occurrence has a specific purpose: distinguish what repetition, control, allocation or sampling can support.

## Updated timing

| Slides | Block | Time | Duration |
|---|---|---|---:|
| 1–10 | My experiment | 00:00–00:35 | 35 minutes |
| 11–15 | Intended question | 00:35–00:55 | 20 minutes |
| 16–19 | Population, synthesis and closing claim | 00:55–01:15 | 20 minutes |

| Slide | Heading | Minutes |
|---:|---|---:|
| 1 | Is my result real? | 2 |
| 2 | Three of what? | 4 |
| 3 | What exactly did we do? | 3 |
| 4 | Where did we assign the treatment? | 2 |
| 5 | What is N here? | 7 |
| 6 | What did we repeat? | 4 |
| 7 | What does the control actually control for? | 4 |
| 8 | Which observations are independent? | 3 |
| 9 | Did we compare both conditions each day? | 3 |
| 10 | What if controls ran on Monday? | 3 |
| 11 | What does “the compound works” mean? | 3 |
| 12 | What prediction led us to this assay? | 4 |
| 13 | What quantity are we trying to learn? | 3 |
| 14 | How would you rewrite the claim? | 7 |
| 15 | Did we predict it, or notice it? | 3 |
| 16 | Which future experiments should this inform? | 4 |
| 17 | What population would you claim this applies to? | 8 |
| 18 | What must we know before drawing an inference? | 5 |
| 19 | What claim does this experiment permit? | 3 |
| **Total** | | **75** |

All slides include timing, what to say, conceptual point, likely misconception, optional follow-up and source pages. Timings include audience responses; they are not additional lecture minutes. The synthesis uses two minutes of paired retrieval and three minutes of debrief. The closing slide uses one minute to revisit allocation versus sampling and two minutes for the audience's bounded claim.

The population block's remaining five minutes and everything after minute 75 remain unbuilt. The requested synthesis fits inside this prototype rather than extending it. The four approved planning documents remain unchanged; this document records the user's revision to the implementation.

## Visual and statistical boundaries

The existing warm background, dark type, teal vehicle circles, terracotta Q triangles and editable experimental schematics are retained. The opening now emphasizes the ambiguous phrase; the synthesis uses a simple two-column arrangement of six retrieval questions. Answer fragments are used only where the audience should respond before a reveal. The HTML remains self-contained for offline presentation.

Assignment unit, biological comparison and technical measurement remain distinct. Separate preparation IDs alone do not prove independence. Slide 9 retains the source comment and speaker-note caveat: an additive shared day shift can cancel within a pair, while a shared day-specific treatment response can link paired comparisons on the same day. The detailed model is facilitator context, not a new audience lesson.

The target quantity is defined without a calculation. No descriptive-statistics teaching, distributions, confidence intervals, p-values or tests are introduced. No result, biological efficacy or direct mechanism is asserted. Source-review decisions for the retained concepts are in `instructor/review-resolutions.md`.

## Questions for review

- Does the initial pause let participants question “triplicate” before the instructor helps?
- Does the single-preparation reveal make the later 36/12/6 distinction easier to explain?
- Can learners answer the six synthesis questions in their own words, without treating them as proof of an effect?
- Do the revised timings work at the intended group size? They have not been classroom-tested.

## Verification

Final render and browser-check results are recorded in `instructor/validation.json`. Verification includes slide count, complete speaker notes, continuous 75-minute timing, staged opening/answer reveals, local assets, absence of audience code and browser errors, and visual inspection of the revised slides. These checks supplement instructor rehearsal and projection-distance review.
