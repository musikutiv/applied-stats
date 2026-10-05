# Final workshop: fictional compound R experiment.
#
# LPS-stimulated macrophages, vehicle vs compound R (one dose), cytokines
# measured by ELISA in technical triplicate. Four independent experiments
# (days); on each day one vehicle and one R culture well are treated.
# The researcher reports one "representative" day, analyses its ELISA wells,
# drops day 4 after seeing it, and reports only IL-6 of three cytokines.
#
# Run from the project root: Rscript scripts/generate_workshop.R
library(ggplot2)
library(patchwork)
set.seed(20261005)

paper <- "#FAF8F2"; ink <- "#172E3B"; teal <- "#237A87"; rust <- "#B64C2E"; muted <- "#59666A"
th <- theme_minimal(base_size = 18, base_family = "Helvetica") +
  theme(text = element_text(colour = ink),
        plot.background = element_rect(fill = paper, colour = NA),
        panel.background = element_rect(fill = paper, colour = NA),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(colour = "#DDDED6", linewidth = .3),
        axis.text = element_text(colour = ink, size = 15),
        legend.position = "none",
        plot.title = element_text(size = 16, face = "bold", hjust = .5),
        plot.margin = margin(12, 18, 12, 12))
save <- function(g, name, w, h) {
  quartz(type = "png", file = paste0("figures/generated/workshop-", name, ".png"),
         width = w, height = h, dpi = 180)
  print(g); dev.off()
}

# ---- Truth per culture well (pg/mL) -----------------------------------------
truth <- data.frame(
  cytokine = rep(c("IL-6", "TNF", "IL-1β"), each = 4),
  day      = rep(1:4, 3),
  vehicle  = c(820, 2450, 1350, 510,   300, 650, 420, 240,   150, 410, 230, 120),
  fold     = c(0.60, 0.72, 0.65, 1.08, 0.92, 1.10, 0.86, 1.04, 0.88, 0.79, 1.12, 0.97)
)

# ---- ELISA wells: three technical replicates per culture well (CV ~6%) -------
rows <- list()
for (i in seq_len(nrow(truth))) for (cond in c("Vehicle", "R")) {
  level <- truth$vehicle[i] * if (cond == "R") truth$fold[i] else 1
  rows[[length(rows) + 1]] <- data.frame(
    cytokine = truth$cytokine[i], day = truth$day[i], condition = cond,
    elisa_well = 1:3, value = round(level * exp(rnorm(3, 0, 0.06)), 1))
}
wells <- do.call(rbind, rows)
wells$condition <- factor(wells$condition, levels = c("Vehicle", "R"))
dir.create("data/workshop", recursive = TRUE, showWarnings = FALSE)
write.csv(wells, "data/workshop/elisa_wells.csv", row.names = FALSE)

# Culture-well means (the experimental units) and per-day fold changes
cw <- aggregate(value ~ cytokine + day + condition, wells, mean)
write.csv(cw, "data/workshop/culture_means.csv", row.names = FALSE)
fc <- reshape(cw, idvar = c("cytokine", "day"), timevar = "condition", direction = "wide")
fc$fold <- fc$value.R / fc$value.Vehicle
fc$log2fc <- log2(fc$fold)
fc <- fc[order(fc$cytokine, fc$day), ]
write.csv(fc, "data/workshop/day_fold_changes.csv", row.names = FALSE)

# ---- Analyses ----------------------------------------------------------------
rep_day <- subset(wells, cytokine == "IL-6" & day == 1)
reported <- t.test(value ~ condition, rep_day)              # what the researcher did
il6 <- subset(fc, cytokine == "IL-6")
paired <- function(x) {
  tt <- t.test(x)
  c(n = length(x), mean_fold = 2^mean(x), lo = 2^tt$conf.int[1], hi = 2^tt$conf.int[2], p = tt$p.value)
}
res <- rbind(`Days 1-3` = paired(il6$log2fc[il6$day <= 3]),
             `All 4 days` = paired(il6$log2fc))
other <- t(sapply(split(fc$log2fc, fc$cytokine), paired))
cat("Reported (day 1 ELISA wells, Welch): p =", signif(reported$p.value, 3), "\n")
print(round(res, 3)); print(round(other, 3))
write.csv(data.frame(analysis = c("Reported: day 1 IL-6, 3 vs 3 ELISA wells (Welch)",
                                  "IL-6 paired log fold change, days 1-3",
                                  "IL-6 paired log fold change, all 4 days"),
                     p = c(reported$p.value, res[, "p"]),
                     fold = c(NA, res[, "mean_fold"]), ci_lo = c(NA, res[, "lo"]), ci_hi = c(NA, res[, "hi"])),
          "data/workshop/analyses.csv", row.names = FALSE)

# ---- Figure 1: the lab-meeting bar chart --------------------------------------
s1 <- aggregate(value ~ condition, rep_day, function(v) c(m = mean(v), se = sd(v) / sqrt(3)))
s1 <- data.frame(condition = s1$condition, m = s1$value[, "m"], se = s1$value[, "se"])
g1 <- ggplot(s1, aes(condition, m, fill = condition)) +
  geom_col(width = .5, alpha = .85) +
  geom_errorbar(aes(ymin = m - se, ymax = m + se), width = .14, linewidth = .9, colour = ink) +
  annotate("text", x = 2, y = s1$m[2] + s1$se[2] + 70, label = "***", size = 10, colour = ink) +
  scale_fill_manual(values = c(teal, rust)) +
  scale_x_discrete(labels = c("Vehicle", "Compound R")) +
  scale_y_continuous(expand = expansion(mult = c(0, .08))) +
  labs(x = NULL, y = "IL-6 (pg/mL)") + th + theme(panel.grid.major.x = element_blank())
save(g1, "report", 6.2, 3.6)

# ---- Figure 2: all four experiments ------------------------------------------
c6 <- subset(cw, cytokine == "IL-6")
c6$excl <- c6$day == 4
c6$dlab <- paste0("Day ", c6$day)
c6$ylab <- c6$value * ifelse(c6$day == 4, 1.10, ifelse(c6$day == 1, 0.91, 1))
pool <- aggregate(value ~ condition, c6, function(v) c(m = mean(v), se = sd(v) / sqrt(length(v))))
pool <- data.frame(condition = pool$condition, m = pool$value[, "m"], se = pool$value[, "se"])
g2a <- ggplot(pool, aes(condition, m, fill = condition)) +
  geom_col(width = .5, alpha = .85) +
  geom_errorbar(aes(ymin = m - se, ymax = m + se), width = .14, linewidth = .9, colour = ink) +
  scale_fill_manual(values = c(teal, rust)) +
  scale_x_discrete(labels = c("Vehicle", "R")) +
  scale_y_continuous(expand = expansion(mult = c(0, .08))) +
  labs(x = NULL, y = "IL-6 (pg/mL)", title = "Days pooled · linear · mean ± SEM") +
  th + theme(panel.grid.major.x = element_blank())
g2b <- ggplot(c6, aes(condition, value, group = day)) +
  geom_line(aes(linetype = excl), colour = ink, linewidth = .7) +
  geom_point(aes(colour = condition, shape = excl), size = 4, stroke = 1.3) +
  geom_text(data = subset(c6, condition == "R"), aes(y = ylab, label = ifelse(excl, "Day 4 (dropped)", dlab)), hjust = -.2, size = 5.2, colour = ink) +
  scale_colour_manual(values = c(teal, rust)) +
  scale_shape_manual(values = c(16, 1)) +
  scale_linetype_manual(values = c("solid", "dashed")) +
  scale_x_discrete(labels = c("Vehicle", "R"), expand = expansion(add = c(.4, .9))) +
  scale_y_log10(breaks = c(250, 500, 1000, 2000), labels = c("250", "500", "1000", "2000"),
                limits = c(220, 3200)) +
  labs(x = NULL, y = "IL-6 (pg/mL, log scale)", title = "Paired by day · log scale") +
  th + theme(panel.grid.major.x = element_blank())
save(g2a + g2b + plot_layout(widths = c(1, 1.25)), "all-days", 11, 4)

# ---- Figure 3: per-day fold changes, with and without day 4 -------------------
fold_breaks <- c(0.5, 0.71, 1, 1.41); fold_labels <- c("0.5", "0.71", "1", "1.41")
il6$set <- "x"
pts <- rbind(transform(subset(il6, day <= 3), row = "Days 1–3\n(day 4 dropped)"),
             transform(il6, row = "All 4 days"))
pts$excl <- pts$day == 4
sm <- data.frame(row = c("Days 1–3\n(day 4 dropped)", "All 4 days"),
                 m = res[, "mean_fold"], lo = res[, "lo"], hi = res[, "hi"],
                 lab = sprintf("fold %.2f · 95%% CI %.2f to %.2f · p = %.2f",
                               res[, "mean_fold"], res[, "lo"], res[, "hi"], res[, "p"]))
lev <- c("All 4 days", "Days 1–3\n(day 4 dropped)")
pts$row <- factor(pts$row, lev); sm$row <- factor(sm$row, lev)
g3 <- ggplot() +
  geom_vline(xintercept = 1, colour = ink, linewidth = .5) +
  geom_errorbar(data = sm, aes(y = row, xmin = lo, xmax = hi), width = .15, linewidth = 1.2,
                colour = rust, orientation = "y") +
  geom_point(data = pts, aes(fold, row, shape = excl), size = 3.6, colour = ink, stroke = 1.2,
             position = position_nudge(y = -.18)) +
  geom_point(data = sm, aes(m, row), shape = 18, size = 7, colour = rust) +
  geom_text(data = sm, aes(x = 0.36, y = row, label = lab), nudge_y = .32, hjust = 0, size = 5.2, colour = ink) +
  scale_shape_manual(values = c(16, 1)) +
  scale_x_log10(breaks = fold_breaks, labels = fold_labels, limits = c(0.35, 1.6)) +
  labs(x = "IL-6 fold change, R / vehicle (log scale)", y = NULL) +
  th + theme(panel.grid.major.y = element_blank())
save(g3, "fold-changes", 10, 3.8)

# ---- Figure 4: three cytokines -------------------------------------------------
fc$cytokine <- factor(fc$cytokine, levels = rev(c("IL-6", "TNF", "IL-1β")))
fc$excl <- fc$day == 4
g4 <- ggplot(fc, aes(fold, cytokine)) +
  geom_vline(xintercept = 1, colour = ink, linewidth = .5) +
  geom_point(aes(shape = excl, colour = cytokine == "IL-6"), size = 4.2, stroke = 1.3,
             position = position_jitter(height = .08, width = 0, seed = 3)) +
  scale_shape_manual(values = c(16, 1)) +
  scale_colour_manual(values = c(muted, rust)) +
  scale_x_log10(breaks = fold_breaks, labels = fold_labels, limits = c(0.45, 1.45)) +
  labs(x = "Fold change, R / vehicle, per experiment day (log scale)", y = NULL) +
  th + theme(panel.grid.major.y = element_blank(), axis.text.y = element_text(size = 17))
save(g4, "cytokines", 10, 3.4)
cat("Workshop data and figures written.\n")
