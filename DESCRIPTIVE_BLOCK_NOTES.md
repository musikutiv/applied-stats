# Descriptive-data continuation

**Scope note:** This records the earlier descriptive block. The next approved uncertainty block is now built; see UNCERTAINTY_BLOCK_NOTES.md for current scope and validation. References below to material being unbuilt describe the earlier delivery.

The opening narrative and visual style are retained. The new block asks “What do the data actually look like?” It uses the original simulated L1 experiment throughout, after averaging three technical readings per vessel and forming six Q-minus-vehicle contrasts.

## Timing

| Screens | Content | Elapsed minutes | Teaching minutes |
|---|---|---|---:|
| 1–19 | Existing opening | 0–75 | 75 |
| 20 | Response-unit bridge | 75–80 | 5 |
| 21 | Planned break | 80–95 | 0 |
| 22–26 | Paired observations, descriptive questions, typical value | 95–108 | 13 |
| 27–30 | Extreme observation, investigation, spread, variance and SD | 108–119 | 11 |
| 31–34 | Same summaries, plot choices, histogram limits, n with a noun | 119–129 | 10 |
| 35–36 | Audience reporting and synthesis | 129–135 | 6 |

There are 16 new core slides: one five-minute bridge and 15 slides of descriptive teaching over 40 minutes. This uses the requested 35–45-minute allowance for the descriptive block, five minutes more than the original outline’s 35-minute allocation. The original break remains at minute 80. The remaining 45 minutes of Session 1 and all of Session 2 are unbuilt. All screens have delivery notes and explicit timing.

## Teaching decisions

- Begin with the six paired biological observations, then retain preparation identities when plotting the six changes.
- Let participants suggest a typical value before revealing mean and median.
- Predict the effect of a hypothetical extreme P5 before revealing summaries. The source experiment is never overwritten.
- Treat unusual observations as prompts for provenance checks, not grounds for automatic deletion.
- Explain variance through squared distances and SD through return to measurement units. Avoid a derivation or any claim that SD measures precision of the mean.
- Label the same-mean/SD datasets as constructed illustrations. Their purpose is to show lost structure, not to add experiments.
- Compare plots with raw observations visible. Two histogram bin widths show why n=6 cannot establish a stable shape.
- Preserve interaction time, including prediction and a short written result description.

The last reveal asks “We observed an effect. How precisely do we know its size?” Here “effect” means an observed descriptive difference. The presentation stops without answering it. No tests, p-values, formal confidence intervals or power material were added.

## Statistical conventions and review questions

See `data/derived/README.md` for exact units and conventions. Four preparations decrease; P2 is almost unchanged (not exactly zero); P5 increases. Mean change is −10.4 U/mg and SD 12.1 U/mg, with n=6 independently initiated preparations. Shared-day qualifications from the opening remain in notes: independent initiation does not itself establish independent responses if day modifies the response to treatment.

Quartiles use R type 7 consistently in numbers and boxplots. With six observations, alternative conventions can give different quartiles; this is flagged in speaker notes. A box does not mean exactly half of the six plotted points lie within its ends. Mean versus median is framed by the scientific quantity of interest and sensitivity, not a rigid skewness rule.

Delivery review remains useful: check whether the variance/SD discussion fits three minutes with this audience. The notes prioritize measurement units over formula detail.

## Validation

Quarto 1.8.27 rendered successfully. Reproducible R checks verify unchanged original readings, aggregation, all summaries, the isolated hypothetical perturbation, identical mean/SD of the constructed sets, boxplot quartiles and histogram counts. Static HTML checks verify 36 screens, notes on every screen, embedded figure assets and no audience code elements. Figures were inspected directly.

A fresh browser visual/layout review of the continuation could not be completed: the browser security policy blocked the local file URL. Earlier opening-only browser validation must not be interpreted as validation of the new slides. No claim of a full new browser pass is made.
