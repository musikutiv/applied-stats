# Preparation only. Fictional assay, not evidence for a biological claim.
simulate_assay <- function(seed = 20261002L) {
  set.seed(seed)
  preparations <- sprintf("P%d", 1:6)
  day <- rep(1:3, each = 2)
  day_shift <- c(-9, 4, 11)  # fixed additive shifts; shared by both vessels
  baseline <- 100 + day_shift[day] + rnorm(6, 0, 15)
  effect <- -14 + rnorm(6, 0, 9) # independent preparation-specific effects
  rows <- list()
  for (i in seq_along(preparations)) {
    # Random assignment to A/B vessels within each preparation.
    allocation <- sample(c("Vehicle", "Compound Q"))
    for (v in 1:2) {
      condition <- allocation[v]
      vessel_value <- baseline[i] + ifelse(condition == "Compound Q", effect[i], 0) + rnorm(1, 0, 3)
      rows[[length(rows) + 1L]] <- data.frame(
        preparation = preparations[i], day = paste("Day", day[i]),
        vessel = paste0(preparations[i], "-", c("A", "B")[v]),
        lysate = paste0(preparations[i], "-", c("A", "B")[v], "-L"),
        condition = condition, technical_reading = 1:3,
        activity = round(vessel_value + rnorm(3, 0, 2.5), 2),
        cell_line = "L1", incubation_hours = 24,
        dose_uM = ifelse(condition == "Compound Q", 10, 0),
        dmso_percent = 0.1, simulated = TRUE
      )
    }
  }
  do.call(rbind, rows)
}
