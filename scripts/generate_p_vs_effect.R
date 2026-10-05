library(ggplot2)

# Two hypothetical paired experiments with the SAME two-sided p-value (0.01)
# but very different effect sizes. Values are derived exactly from p.
paper <- "#FAF8F2"; ink <- "#172E3B"; teal <- "#237A87"; rust <- "#B64C2E"

make_row <- function(label, mean, n, p = 0.01) {
  df <- n - 1
  t  <- qt(1 - p / 2, df)
  se <- abs(mean) / t
  h  <- qt(0.975, df) * se
  data.frame(label, mean, n, se, sd = se * sqrt(n), lo = mean - h, hi = mean + h)
}
d <- rbind(make_row("Experiment A\nn = 200 pairs", -2, 200),
           make_row("Experiment B\nn = 6 pairs",  -20, 6))
d$label <- factor(d$label, levels = rev(d$label))
print(d)

p <- ggplot(d, aes(mean, label, colour = label)) +
  geom_vline(xintercept = 0, colour = ink, linewidth = .5) +
  geom_errorbar(aes(xmin = lo, xmax = hi), width = .18, linewidth = 1.3, orientation = "y") +
  geom_point(size = 5) +
  geom_text(aes(x = pmin(mean, -9), label = sprintf("−%.0f U/mg   ·   p = 0.01", abs(mean))),
            nudge_y = .32, size = 6, family = "Helvetica", colour = ink) +
  scale_colour_manual(values = c(rust, teal)) +
  scale_x_continuous(limits = c(-36, 4), breaks = seq(-35, 0, 5), labels = function(x) sub("-", "−", x)) +
  labs(x = "Mean change with treatment (U/mg) · 95% CI", y = NULL) +
  theme_minimal(base_size = 18, base_family = "Helvetica") +
  theme(text = element_text(colour = ink),
        plot.background  = element_rect(fill = paper, colour = NA),
        panel.background = element_rect(fill = paper, colour = NA),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.major.x = element_line(colour = "#DDDED6", linewidth = .3),
        axis.text = element_text(colour = ink, size = 16),
        legend.position = "none",
        plot.margin = margin(14, 24, 14, 14))

quartz(type = "png", file = "figures/generated/p-vs-effect.png",
       width = 10, height = 3.6, dpi = 180)
print(p)
dev.off()
