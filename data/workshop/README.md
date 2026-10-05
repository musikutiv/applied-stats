Fictional compound R workshop data. Generate with `Rscript scripts/generate_workshop.R` (seed 20261005); validate with `Rscript scripts/check_workshop.R`.

LPS-stimulated macrophages, vehicle vs compound R (10 µM, 24 h), four independent experiments (days). Each day one vehicle and one R culture well; each supernatant measured by ELISA in technical triplicate for IL-6, TNF and IL-1β.

- `elisa_wells.csv` — 72 ELISA readings (3 cytokines × 4 days × 2 conditions × 3 wells)
- `culture_means.csv` — 24 culture-well means (the experimental units)
- `day_fold_changes.csv` — R / vehicle fold change and log2 fold change per cytokine and day
- `analyses.csv` — the reported analysis (day 1 IL-6, 3 vs 3 ELISA wells, Welch) and the per-experiment paired analyses with and without day 4

See FINAL_WORKSHOP_NOTES.md for the story, the intended flaws and the key numbers.
