library(ggplot2)
library(patchwork)

# Twelve sorted values cut into four groups of three; the box plot below is
# built from exactly those cuts. Quartiles are taken as midpoints between
# neighbouring groups (software may use slightly different conventions).
paper <- "#FAF8F2"; ink <- "#172E3B"; teal <- "#237A87"; rust <- "#B64C2E"; muted <- "#59666A"
v <- c(3, 6, 9, 13, 15, 17, 21, 23, 25, 29, 32, 36)
q <- c(Q1 = (9 + 13) / 2, Q2 = (17 + 21) / 2, Q3 = (25 + 29) / 2)
grp <- factor(rep(1:4, each = 3))
th <- theme_void(base_family = "Helvetica") +
  theme(plot.background = element_rect(fill = paper, colour = NA),
        plot.margin = margin(6, 20, 6, 20))
xl <- c(0, 39)

top <- ggplot() +
  geom_vline(xintercept = q, linetype = "dashed", colour = rust, linewidth = .8) +
  geom_point(aes(v, 0, colour = grp), size = 7) +
  annotate("text", x = c(mean(v[1:3]), mean(v[4:6]), mean(v[7:9]), mean(v[10:12])), y = .55,
           label = "3 values\n(25%)", size = 5.2, colour = ink, lineheight = .9) +
  annotate("label", x = q, y = -.6, label = c("Q1", "Q2 = median", "Q3"),
           size = 6, colour = rust, fontface = "bold", fill = paper, label.size = 0) +
  scale_colour_manual(values = c(muted, teal, teal, muted)) +
  scale_x_continuous(limits = xl) + scale_y_continuous(limits = c(-.9, .95)) +
  th + theme(legend.position = "none")

bot <- ggplot() +
  annotate("segment", x = min(v), xend = q[1], y = 0, yend = 0, colour = ink, linewidth = 1) +
  annotate("segment", x = q[3], xend = max(v), y = 0, yend = 0, colour = ink, linewidth = 1) +
  annotate("rect", xmin = q[1], xmax = q[3], ymin = -.35, ymax = .35, fill = teal, alpha = .18,
           colour = teal, linewidth = 1.2) +
  annotate("segment", x = q[2], xend = q[2], y = -.35, yend = .35, colour = rust, linewidth = 1.6) +
  annotate("text", x = mean(q[c(1, 3)]), y = .62, label = "box = middle half of the values",
           size = 5.6, colour = teal, fontface = "bold") +
  annotate("text", x = c((min(v) + q[1]) / 2, (q[3] + max(v)) / 2), y = -.62,
           label = c("lowest quarter", "highest quarter"), size = 5, colour = ink) +
  scale_x_continuous(limits = xl) + scale_y_continuous(limits = c(-.9, .9)) + th

quartz(type = "png", file = "figures/generated/quartiles-boxplot.png", width = 10, height = 4.4, dpi = 180)
print(top / bot + plot_layout(heights = c(1, .9)))
dev.off()
