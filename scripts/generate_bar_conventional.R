library(ggplot2)

paper <- "#FAF8F2"; ink <- "#172E3B"; teal <- "#237A87"; rust <- "#B64C2E"
muted <- "#657174"

theme_d <- theme_minimal(base_size = 20, base_family = "Helvetica") +
  theme(text = element_text(colour = ink),
        plot.background = element_rect(fill = paper, colour = NA),
        panel.background = element_rect(fill = paper, colour = NA),
        panel.grid.minor = element_blank(),
        panel.grid.major = element_line(colour = "#DDDED6", linewidth = .3),
        axis.text = element_text(colour = ink, size = 17),
        axis.title = element_text(size = 18),
        legend.position = "none",
        plot.margin = margin(12, 20, 12, 12))

paired <- data.frame(
  preparation = c("P1","P2","P3","P4","P5","P6"),
  vehicle  = c(79.620, 79.143, 111.790, 107.580, 113.410, 97.593),
  compound = c(58.717, 79.147,  94.110,  83.853, 119.457, 91.413)
)

long <- rbind(
  data.frame(preparation = paired$preparation, condition = "Vehicle",    value = paired$vehicle),
  data.frame(preparation = paired$preparation, condition = "Compound Q", value = paired$compound)
)
long$condition <- factor(long$condition, levels = c("Vehicle", "Compound Q"))

stats <- do.call(rbind, lapply(split(long, long$condition), function(d) {
  data.frame(condition = d$condition[1],
             mean = mean(d$value),
             sem  = sd(d$value) / sqrt(nrow(d)))
}))
stats$condition <- factor(stats$condition, levels = c("Vehicle", "Compound Q"))

set.seed(7)
p <- ggplot(stats, aes(condition, mean, fill = condition)) +
  geom_col(width = 0.48, alpha = 0.80, colour = NA) +
  geom_errorbar(aes(ymin = mean - sem, ymax = mean + sem),
                width = 0.14, linewidth = 1.0, colour = ink) +
  geom_jitter(data = long, aes(condition, value),
              width = 0.09, size = 3.8, colour = ink, alpha = 0.85) +
  scale_fill_manual(values = c(teal, rust)) +
  scale_y_continuous(limits = c(0, 145), breaks = c(0, 40, 80, 120)) +
  labs(x = NULL, y = "Enzyme activity (U/mg protein)") +
  theme_d +
  theme(panel.grid.major.x = element_blank())

out <- "figures/generated"
ggsave(file.path(out, "bar-conventional.png"), p, width = 6.5, height = 4.5, dpi = 180,
  device = function(filename, width, height, res, ...) {
    grDevices::png(filename, width = width, height = height, units = "in", res = res,
      type = if (Sys.info()[["sysname"]] == "Darwin") "quartz" else "cairo", ...)
  })

message("Saved bar-conventional.png")
