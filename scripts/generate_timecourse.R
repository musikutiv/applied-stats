library(ggplot2)

# Simulated time-course: kinase Q activity, Vehicle vs Compound Q
# 6 independent preparations per time point (balanced, illustrative)
time_pts <- c(0, 2, 4, 8, 12, 24)

set.seed(42)
n <- 6

vehicle_means <- c(100, 102, 98, 101, 99, 100)
q_means       <- c(100,  88,  70,  63,  67,  74)
vehicle_sd    <- c(8, 9, 8, 9, 8, 9)
q_sd          <- c(8, 9, 10, 10, 9, 10)

df <- data.frame(
  time    = rep(time_pts, 2),
  mean    = c(vehicle_means, q_means),
  se      = c(vehicle_sd / sqrt(n), q_sd / sqrt(n)),
  group   = rep(c("Vehicle", "Compound Q"), each = length(time_pts))
)
df$group <- factor(df$group, levels = c("Vehicle", "Compound Q"))

clr <- c("Vehicle" = "#237A87", "Compound Q" = "#B64C2E")

p <- ggplot(df, aes(x = time, y = mean, colour = group, fill = group)) +
  geom_ribbon(aes(ymin = mean - se, ymax = mean + se), alpha = 0.15, colour = NA) +
  geom_line(linewidth = 0.9) +
  geom_point(size = 2.5) +
  scale_colour_manual(values = clr) +
  scale_fill_manual(values = clr) +
  scale_x_continuous(breaks = time_pts, labels = paste0(time_pts, " h")) +
  scale_y_continuous(limits = c(40, 125), breaks = seq(50, 120, 20)) +
  labs(
    x = "Time after treatment",
    y = "Kinase Q activity (U/mg protein)",
    colour = NULL, fill = NULL
  ) +
  theme_minimal(base_family = "Helvetica", base_size = 13) +
  theme(
    plot.background  = element_rect(fill = "#FAF8F2", colour = NA),
    panel.background = element_rect(fill = "#FAF8F2", colour = NA),
    panel.grid.major = element_line(colour = "#cccfc8", linewidth = 0.4),
    panel.grid.minor = element_blank(),
    axis.text        = element_text(colour = "#172E3B"),
    axis.title       = element_text(colour = "#172E3B"),
    legend.position  = "top",
    legend.text      = element_text(colour = "#172E3B", size = 12),
    legend.key       = element_rect(fill = "#FAF8F2", colour = NA)
  )

quartz(type = "png",
       file = "figures/generated/timecourse-example.png",
       width = 7, height = 4, dpi = 180)
print(p)
dev.off()
cat("saved figures/generated/timecourse-example.png\n")
