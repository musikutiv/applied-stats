library(ggplot2)
library(patchwork)

paper <- "#FAF8F2"; ink <- "#172E3B"; teal <- "#237A87"; rust <- "#B64C2E"

theme_d <- theme_minimal(base_size = 18, base_family = "Helvetica") +
  theme(text            = element_text(colour = ink),
        plot.background  = element_rect(fill = paper, colour = NA),
        panel.background = element_rect(fill = paper, colour = NA),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(colour = "#DDDED6", linewidth = .3),
        axis.text        = element_text(colour = ink, size = 15),
        axis.title       = element_text(size = 16),
        legend.position  = "none",
        plot.margin      = margin(14, 16, 14, 14))

vehicle  <- c(79.620, 79.143, 111.790, 107.580, 113.410, 97.593)
compound <- c(58.717, 79.147,  94.110,  83.853, 119.457, 91.413)
n <- 6

stats <- data.frame(
  condition = factor(c("Vehicle", "Compound Q"), levels = c("Vehicle", "Compound Q")),
  mean = c(mean(vehicle), mean(compound)),
  sd   = c(sd(vehicle),   sd(compound)),
  sem  = c(sd(vehicle) / sqrt(n),  sd(compound) / sqrt(n)),
  ci95 = c(qt(0.975, n - 1) * sd(vehicle)  / sqrt(n),
            qt(0.975, n - 1) * sd(compound) / sqrt(n))
)

eb_panel <- function(hw_col, title) {
  d <- stats
  d$lo <- d$mean - d[[hw_col]]
  d$hi <- d$mean + d[[hw_col]]
  ggplot(d, aes(condition, mean, fill = condition)) +
    geom_col(width = 0.48, alpha = 0.80, colour = NA) +
    geom_errorbar(aes(ymin = lo, ymax = hi),
                  width = 0.14, linewidth = 1.0, colour = ink) +
    scale_fill_manual(values = c(teal, rust)) +
    scale_y_continuous(limits = c(0, 165), breaks = c(0, 40, 80, 120, 160)) +
    labs(x = NULL, y = "Enzyme activity (U/mg)", title = title) +
    theme_d +
    theme(panel.grid.major.x = element_blank(),
          plot.title = element_text(size = 17, face = "bold", hjust = 0.5, margin = margin(b = 8)))
}

p_sd  <- eb_panel("sd",   "± SD")
p_sem <- eb_panel("sem",  "± SEM")
p_ci  <- eb_panel("ci95", "± 95% CI")

p <- p_sd | p_sem | p_ci

ggsave(
  "figures/generated/error-bars-comparison.png", p,
  width = 14, height = 4.5, dpi = 180,
  device = function(filename, width, height, res, ...) {
    grDevices::png(filename, width = width, height = height, units = "in", res = res,
      type = if (Sys.info()[["sysname"]] == "Darwin") "quartz" else "cairo", ...)
  }
)
message("Saved error-bars-comparison.png")
