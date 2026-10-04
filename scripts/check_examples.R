d <- read.csv("data/simulated/assay_readings.csv")
stopifnot(nrow(d) == 36L, length(unique(d$vessel)) == 12L,
          length(unique(d$preparation)) == 6L, all(table(d$vessel) == 3L),
          all(table(d$preparation, d$condition) == 3L),
          all(table(d$day, d$condition) == 6L),
          all(d$activity > 0), all(d$simulated),
          !anyDuplicated(d[c("vessel", "technical_reading")]))
source("R/simulate_assay.R")
stopifnot(isTRUE(all.equal(d, simulate_assay(), check.attributes = FALSE)))
cat("Verified hierarchy, allocation, completeness and seeded reproducibility.\n")
