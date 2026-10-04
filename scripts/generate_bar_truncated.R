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
        plot.margin      = margin(14, 20, 14, 14))

vehicle  <- c(79.620, 79.143, 111.790, 107.580, 113.410, 97.593)
compound <- c(58.717, 79.147,  94.110,  83.853, 119.457, 91.413)

stats <- data.frame(
  condition = factor(c("Vehicle", "Compound Q"), levels = c("Vehicle", "Compound Q")),
  mean = c(mean(vehicle), mean(compound)),
  sem  = c(sd(vehicle) / sqrt(6), sd(compound) / sqrt(6))
)

bar_panel <- function(ylims, ybreaks, title) {
  ggplot(stats, aes(condition, mean, fill = condition)) +
    geom_col(width = 0.48, alpha = 0.80, colour = NA) +
    geom_errorbar(aes(ymin = mean - sem, ymax = mean + sem),
                  width = 0.14, linewidth = 1.0, colour = ink) +
    scale_fill_manual(values = c(teal, rust)) +
    coord_cartesian(ylim = ylims) +
    scale_y_continuous(breaks = ybreaks) +
    labs(x = NULL, y = "Enzyme activity (U/mg)", title = title) +
    theme_d +
    theme(panel.grid.major.x = element_blank(),
          plot.title = element_text(size = 17, face = "bold", hjust = 0.5, margin = margin(b = 8)))
}

p_full  <- bar_panel(c(0, 130),  c(0, 40, 80, 120),       "Y from zero")
p_trunc <- bar_panel(c(70, 115), c(70, 80, 90, 100, 110),  "Y from 70")

p <- p_full | p_trunc

ggsave(
  "figures/generated/bar-truncated.png", p,
  width = 10, height = 4.5, dpi = 180,
  device = function(filename, width, height, res, ...) {
    grDevices::png(filename, width = width, height = height, units = "in", res = res,
      type = if (Sys.info()[["sysname"]] == "Darwin") "quartz" else "cairo", ...)
  }
)
message("Saved bar-truncated.png")
