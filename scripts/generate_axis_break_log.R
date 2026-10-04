library(ggplot2)
library(patchwork)

# Simulated cytokine release: four conditions spanning three orders of magnitude
set.seed(7)
conditions <- c("Unstimulated", "Low dose", "High dose", "Max stimulation")
means      <- c(12, 22, 85, 960)
sds        <- c(3, 5, 18, 140)
n          <- 5

df <- data.frame(
  condition = factor(conditions, levels = conditions),
  mean      = means,
  se        = sds / sqrt(n)
)

clr_bar  <- "#237A87"
bg       <- "#FAF8F2"
ink      <- "#172E3B"
muted    <- "#59666a"
line_col <- "#cccfc8"

base_theme <- theme_minimal(base_family = "Helvetica", base_size = 12) +
  theme(
    plot.background  = element_rect(fill = bg, colour = NA),
    panel.background = element_rect(fill = bg, colour = NA),
    panel.grid.major = element_line(colour = line_col, linewidth = 0.4),
    panel.grid.minor = element_blank(),
    axis.text        = element_text(colour = ink, size = 10),
    axis.title       = element_text(colour = ink, size = 11),
    axis.text.x      = element_text(angle = 25, hjust = 1),
    plot.title       = element_text(colour = ink, size = 11, face = "bold")
  )

# Panel 1: linear scale — small values invisible
p_linear <- ggplot(df, aes(x = condition, y = mean)) +
  geom_col(fill = clr_bar, width = 0.55) +
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se),
                width = 0.18, colour = ink, linewidth = 0.6) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.05))) +
  labs(x = NULL, y = "Cytokine release (pg/mL)", title = "Linear scale") +
  base_theme

# Panel 2: log10 scale — all values visible
p_log <- ggplot(df, aes(x = condition, y = mean)) +
  geom_col(fill = clr_bar, width = 0.55) +
  geom_errorbar(aes(ymin = pmax(mean - se, 1), ymax = mean + se),
                width = 0.18, colour = ink, linewidth = 0.6) +
  scale_y_log10(
    breaks = c(1, 10, 100, 1000),
    labels = c("1", "10", "100", "1 000"),
    expand = expansion(mult = c(0, 0.08))
  ) +
  labs(x = NULL, y = "Cytokine release (pg/mL, log scale)", title = "Log₁₀ scale") +
  base_theme

combined <- p_linear + p_log +
  plot_layout(ncol = 2) &
  theme(plot.background = element_rect(fill = bg, colour = NA))

quartz(type = "png",
       file = "figures/generated/axis-break-vs-log.png",
       width = 8, height = 4.2, dpi = 180)
print(combined)
dev.off()
cat("saved figures/generated/axis-break-vs-log.png\n")
