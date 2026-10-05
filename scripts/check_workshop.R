# Validate the workshop data against the numbers used on the slides.
w <- read.csv("data/workshop/elisa_wells.csv")
f <- read.csv("data/workshop/day_fold_changes.csv")
stopifnot(nrow(w) == 72, nrow(f) == 12, all(table(w$cytokine, w$day, w$condition) == 3))
d1 <- subset(w, cytokine == "IL-6" & day == 1)
stopifnot(t.test(value ~ condition, d1)$p.value < 0.001)
x <- f$log2fc[f$cytokine == "IL-6"][order(f$day[f$cytokine == "IL-6"])]
p3 <- t.test(x[1:3])$p.value; p4 <- t.test(x)$p.value
stopifnot(round(p3, 2) == 0.03, round(p4, 2) == 0.14,
          round(2^mean(x[1:3]), 2) == 0.65, round(2^mean(x), 2) == 0.74,
          all(x[1:3] < 0), x[4] > 0)
cat("Workshop checks passed: reported p < 0.001; per-experiment p = 0.03 (days 1-3) and 0.14 (all days).\n")
