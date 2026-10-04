# Preparation only. No tests, error bars, selected seeds or omitted observations.
plot_assay <- function(d, directory = "figures/generated") {
  library(ggplot2)
  ink <- "#172E3B"; paper <- "#FAF8F2"
  cols <- c("Vehicle" = "#237A87", "Compound Q" = "#B64C2E")
  d$condition <- factor(d$condition, levels = names(cols))
  # Deterministic jitter for all 18 observations in each condition.
  d$x <- as.numeric(d$condition) + ave(seq_len(nrow(d)), d$condition,
    FUN = function(z) rep(seq(-0.17, 0.17, length.out = 6), each = 3) + rep(c(-.018, 0, .018), 6))
  theme_course <- theme_minimal(base_size = 22, base_family = "Helvetica") +
    theme(text = element_text(colour = ink),
          plot.background = element_rect(fill = paper, colour = NA),
          panel.background = element_rect(fill = paper, colour = NA),
          panel.grid.minor = element_blank(), panel.grid.major.x = element_blank(),
          panel.grid.major.y = element_line(colour = "#DDDCD5", linewidth = .35),
          axis.title.x = element_blank(), axis.title.y = element_text(margin = margin(r = 15)),
          legend.position = "none", plot.margin = margin(12, 25, 12, 12),
          strip.text = element_text(size = 20, face = "bold", colour = ink),
          axis.text = element_text(colour = ink, size = 18))
  p <- ggplot(d, aes(x, activity, colour = condition, shape = condition)) +
    geom_point(size = 3.8, alpha = .88) +
    scale_colour_manual(values = cols) + scale_shape_manual(values = c(16, 17)) +
    scale_x_continuous(breaks = c(1,2), labels = names(cols), limits = c(.55, 2.45)) +
    scale_y_continuous(breaks = seq(40, 160, 20)) +
    labs(y = "Enzyme activity (U/mg protein)") + theme_course
  save_plot <- function(p, name, w, h) {
    # Quartz does not require X11 on macOS; PNG exports are the presentation assets.
    ggsave(file.path(directory, paste0(name, ".png")), p, width = w, height = h,
           dpi = 180, device = function(filename, width, height, res, ...) {
             grDevices::png(filename, width = width, height = height, units = "in", res = res,
               type = if (Sys.info()[["sysname"]] == "Darwin") "quartz" else "cairo", ...)
           })
  }
  save_plot(p, "assay-raw", 10, 5.7)
  means <- aggregate(activity ~ preparation + day + condition, d, mean)
  means$x <- as.numeric(means$condition)
  p2 <- ggplot(d, aes(as.numeric(condition) + (technical_reading - 2)*.07, activity,
                      colour = condition, shape = condition)) +
    geom_line(data = means, aes(x, activity, group = preparation),
              inherit.aes = FALSE, colour = "#A4AAA7", linewidth = .8) +
    geom_point(size = 3.4, alpha = .9) +
    facet_wrap(~ preparation, nrow = 1) +
    scale_colour_manual(values = cols) + scale_shape_manual(values = c(16, 17)) +
    scale_x_continuous(breaks = c(1,2), labels = c("V", "Q"), limits = c(.65,2.35)) +
    scale_y_continuous(breaks = seq(40,160,20)) +
    labs(y = "Enzyme activity (U/mg protein)") + theme_course
  save_plot(p2, "assay-pairs", 12, 4.5)
}
