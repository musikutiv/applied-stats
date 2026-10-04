# Proposed Quarto/RevealJS structure

**Proposal only.** The planning files exist; the tree below describes a later implementation. No deck, Quarto configuration, R helper or dataset has been created at this stage. Keep the three supplied PDFs at their current paths during review.

```text
Applied_Stats_Reshape/
├── COURSE_NARRATIVE.md
├── COURSE_OUTLINE.md
├── CONTENT_MAP.md
├── QUARTO_STRUCTURE.md
├── AppliedStats_2026.pdf
├── Stats_PhD_MR_CVS_2024.pdf
├── DoctaMed.pdf
├── _quarto.yml                    # shared RevealJS configuration; explicit render list
├── index.qmd                      # small landing page linking the two sessions
├── session-1.qmd                  # assembly of sections 01–05 and exit task
├── session-2.qmd                  # assembly of retrieval and sections 06–10
├── sections/
│   ├── _01-my-experiment.qmd
│   ├── _02-question.qmd
│   ├── _03-sample-to-claim.qmd
│   ├── _04-read-the-data.qmd
│   ├── _05-effect-and-uncertainty.qmd
│   ├── _06-null-model.qmd
│   ├── _07-inconclusive-results.qmd
│   ├── _08a-design-diagnose.qmd
│   ├── _08b-design-improve.qmd
│   ├── _09-many-endpoints.qmd
│   └── _10-next-experiment.qmd
├── R/
│   ├── simulate_assay.R           # explicit units, pairing, batch and technical noise
│   ├── summarise_assay.R          # QC-aware vessel summaries and paired contrasts
│   ├── plot_assay.R               # raw observations, paired effects, common theme
│   ├── simulate_intervals.R       # repeated experiments and coverage
│   ├── simulate_null.R            # null statistic distribution with valid units
│   ├── plan_sample_size.R         # prospective power and sensitivity to assumptions
│   └── simulate_multiplicity.R    # all-null and mixed-truth endpoint scenarios
├── scripts/
│   ├── generate_data.R            # one entry point; fixed named seeds and parameters
│   └── check_examples.R           # hierarchy, summaries and numerical consistency
├── data/
│   ├── README.md                 # provenance, simulation assumptions and regeneration
│   ├── data_dictionary.csv        # IDs, units, conditions and allowed values
│   ├── simulated/
│   │   ├── assay_readings.csv
│   │   ├── assay_metadata.csv
│   │   └── multiple_endpoints.csv
│   └── adapted/
│       └── README.md             # exact source/page and changes if old values reused
├── figures/
│   ├── generated/                # reproducible exported SVG/PNG figures
│   └── source/                   # only approved, attributed external assets
├── exercises/
│   ├── experiment-audit.qmd
│   ├── results-statement.qmd
│   └── next-experiment-canvas.qmd
├── instructor/
│   ├── facilitation.md           # clock times, reveals, expected misconceptions
│   ├── exercise-solutions.qmd     # separate from learner-facing handouts
│   └── review-resolutions.md      # disposition of every CONTENT_MAP issue
├── styles/
│   └── course.scss
├── references.bib
├── renv.lock                     # capture tested R package versions when implemented
├── README.md                     # prerequisites and build/regeneration commands
├── .gitignore                    # generated output, caches, local environments
├── tmp/pdfs/                     # existing source-inspection scratch files
└── _output/                      # rendered HTML/dependencies; generated
```

## Assembly and reproducibility contract

Use one project with two session entry points and shared RevealJS settings. Include section fragments in the order of COURSE_OUTLINE.md; split section 8 only to preserve the planned break. Explicit render targets should prevent include files and instructor solutions from becoming unintended presentations. Use project-root execution so includes and helpers do not depend on the current working directory.

Store reusable calculations and plotting logic in R/, with short calls in QMD chunks. Data generation must be separate from slide formatting. Document every simulation's seed, parameter values, unit structure, contrast direction and known truth. Preserve technical readings and metadata; create derived summaries without overwriting them. Give adapted historical data an exact PDF page reference and disclose every change.

Use base R and ggplot2 initially; add dependencies only when a demonstration requires them. Run all R computations during preparation/build only. Present precomputed figures and staged RevealJS sequences; neither instructor nor participants run R during teaching. The rendered deck must work without R installed or a network connection. External links and remote fonts should not be necessary for delivery.

Render-derived charts can live in Quarto's generated output; explicitly exported reusable charts belong in figures/generated/. Do not manually edit generated plots. Keep captions and alt text with each plot; identify simulated data and technical versus biological observations clearly.

## Presentation rules

- One main question or decision per slide; put the claim in its title.
- Raw observations before summaries; show pairing or blocks whenever they matter.
- Stable treatment colours plus labels/shapes so colour alone never carries meaning.
- Progressive disclosure for provenance and null distributions; the final view must stand alone.
- Speaker notes contain time budget, expected responses, assumptions and source pages.
- No code, console output, software walkthroughs, code-folding controls, source-download links or code appendix in audience-facing slides or handouts. Keep reproducible R source in the authoring project only.
- At build time suppress code display and raw execution output; resolve warnings/errors during preparation. Include only explicitly selected finished figures and formatted teaching results in the rendered deck.
- Avoid significance stars, unexplained N, ambiguous error bars and screenshots of software tables.
- Put source attributions in notes or unobtrusive captions without importing an old slide's wording uncritically.

## Checks for the later build

Verify that technical readings are never counted as independent paired contrasts; treatment allocation and pairing are traceable; intervals and estimates use the same contrast direction and scale; null simulations preserve the design; power inputs match the planned unit; and multiplicity simulations use declared truth and dependence structures.

Re-render from a clean environment, verify that audience-facing exports contain no code or console output and require no R execution, check both complete presentations visually, inspect progressive reveals and plots at teaching resolution, and verify that handouts and solutions are separated. Check the 180-minute schedules during a rehearsal. Record source-review resolutions before accepting reused statistical statements.

## Review decisions before implementation

The present proposal assumes 180-minute sessions include the break, English delivery, preparation-only R with no audience-visible code, and one generic enzyme assay as the recurring case. These are adjustable teaching choices. The next stage is to resolve the source flags and approve the narrative/pacing, then implement the core decks and reproducible demonstrations. The requested planning stage stops here.
