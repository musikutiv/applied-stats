> Completed Session 2: 03:00 including the 15-minute break, with the final redesign workshop and course landing. See FINAL_WORKSHOP_NOTES.md and workshop-design-canvas.html. Earlier scope descriptions below document preceding stages.

> Current Session 2: 54 core slides plus one break; 02:35 elapsed. The analysis-from-design block ends at the workshop bridge. See SESSION2_TESTS_NOTES.md. The final 20–25-minute workshop is not built.

# Applied Statistics for Life Scientists

The course currently has two separate presentations:

- **Session 1:** 63 core slides plus a break, 205 minutes. It remains 25 minutes over the original three-hour budget; this delivery does not change its content.
- **Session 2 prototype:** 36 core slides plus a 15-minute break, ending at 01:50. The 50-minute power/design opening is followed by 45 minutes on multiplicity and analytical flexibility. The break is at 01:20–01:35. It stops at the question about which statistical test to use; that next block is unbuilt.

Open `_output/session-1.html` or `_output/session-2.html`. See `SESSION2_POWER_NOTES.md` and `SESSION2_MULTIPLICITY_NOTES.md` for timing, assumptions and review decisions.

## Presenting

Open either rendered HTML in a modern desktop browser. The HTML embeds its figures, styles and presentation libraries. No R installation, code execution or network connection is needed to present it. Use the right arrow or Space to advance, including staged answer reveals; Esc opens the slide overview. Speaker notes are embedded for the presenter and are hidden from the audience view.

To use Reveal's speaker view reliably, serve the already rendered output from a local HTTP server and press S in the browser (allow its presenter popup). This does not run R or rebuild the deck. For example, during setup, `python3 -m http.server 8000 --directory _output` serves the finished file at `http://localhost:8000/session-1.html`. Show only the audience window on the projector. Direct file viewing works for the audience presentation; browser security can restrict the speaker popup over file URLs.

## Authoring and build

- `_quarto.yml`: explicit render targets `session-1.qmd` and `session-2.qmd`.
- `session-1.qmd`: seven modular section files; `session-2.qmd`: the power/design and multiplicity sections.
- `sections/`: 64 Session 1 screens and 37 Session 2 screens, including per-slide timing, delivery notes, misconceptions, follow-up questions and source references.
- `styles/course.scss`: theme defaults; `styles/course.css`: presentation layouts.
- `R/` and `scripts/generate_data.R`: preparation-only data and figure generation.
- `figures/generated/`: finished PNGs, including the descriptive-data figures displayed in the continuation.
- `data/`: simulated data, metadata, dictionary and generation assumptions.
- `PROTOTYPE_NOTES.md`: design choices, timing crosswalk and review questions.
- `instructor/review-resolutions.md`: relevant statistical-source decisions.

Render the deck without running R:

```sh
quarto render session-1.qmd
quarto render session-2.qmd
```

On the machine used for this prototype, Quarto 1.8.27 is bundled at `/Applications/Positron.app/Contents/Resources/app/quarto/bin/quarto`. R 4.5.0 and ggplot2 3.5.2 were used for offline generation. ggplot2's existing dependencies are sufficient; no packages were installed.

Only when intentionally regenerating the data/figures:

```sh
Rscript scripts/generate_data.R
Rscript scripts/check_examples.R
Rscript scripts/generate_descriptive.R
Rscript scripts/check_descriptive.R
Rscript scripts/generate_uncertainty.R
Rscript scripts/check_uncertainty.R
Rscript scripts/generate_null.R
Rscript scripts/check_null.R
Rscript scripts/generate_power.R
Rscript scripts/check_power.R
Rscript scripts/generate_multiplicity.R
Rscript scripts/check_multiplicity.R
quarto render session-1.qmd
quarto render session-2.qmd
```

The output directory is `_output/`. Generated PNGs, CSVs and HTML should be retained alongside source. This workspace was not initialized as a Git repository, so files are exported on disk rather than committed to Git.

## Optional author QA

`scripts/check_slides.cjs` uses Playwright and an installed Chrome to capture all slides before/after reveals and check for missing notes, code elements, broken images, script errors, external requests and overflowing elements. Set `PLAYWRIGHT_MODULE` and `CHROME_PATH` if your installations differ. This is an author tool, not part of course delivery.

The configuration and notes syntax follow the official [Quarto RevealJS documentation](https://quarto.org/docs/presentations/revealjs/) and [advanced Reveal guidance](https://quarto.org/docs/presentations/revealjs/advanced.html). No audience-facing statistical code, code appendix, software interfaces or links to source downloads are included.
