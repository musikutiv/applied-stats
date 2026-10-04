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

genes    <- c("Gene A\n(3× up)", "Gene B\n(3× down)")
baseline <- c(100, 100)
treated  <- c(300, 100 / 3)
colors   <- c(teal, rust)

# Left panel: absolute scale — line plot from baseline to treated
long <- rbind(
  data.frame(gene = genes, cond = "Baseline", value = baseline, stringsAsFactors = FALSE),
  data.frame(gene = genes, cond = "Treated",  value = treated,  stringsAsFactors = FALSE)
)
long$cond <- factor(long$cond, levels = c("Baseline", "Treated"))
long$gene <- factor(long$gene, levels = genes)

p_abs <- ggplot(long, aes(cond, value, group = gene, colour = gene)) +
  geom_line(linewidth = 1.6) +
  geom_point(size = 5.5) +
  scale_colour_manual(values = colors) +
  scale_y_continuous(limits = c(0, 330), breaks = c(0, 100, 200, 300)) +
  labs(x = NULL, y = "Expression (AU)", title = "Absolute scale") +
  theme_d +
  theme(plot.title = element_text(size = 17, face = "bold", hjust = 0.5, margin = margin(b = 8)))

# Right panel: log2 fold change — bar chart, symmetric
fc_dat <- data.frame(
  gene   = factor(genes, levels = genes),
  log2fc = log2(treated / baseline)
)

p_log <- ggplot(fc_dat, aes(gene, log2fc, fill = gene)) +
  geom_col(width = 0.44, alpha = 0.82, colour = NA) +
  geom_hline(yintercept = 0, colour = ink, linewidth = 0.6) +
  scale_fill_manual(values = colors) +
  scale_y_continuous(limits = c(-2, 2), breaks = -2:2,
                     labels = c("−2", "−1", "0", "+1", "+2")) +
  labs(x = NULL, y = "log₂ fold change", title = "log₂ scale") +
  theme_d +
  theme(panel.grid.major.x = element_blank(),
        plot.title = element_text(size = 17, face = "bold", hjust = 0.5, margin = margin(b = 8)))

p <- p_abs | p_log

ggsave(
  "figures/generated/log-scale-compare.png", p,
  width = 10, height = 4.5, dpi = 180,
  device = function(filename, width, height, res, ...) {
    grDevices::png(filename, width = width, height = height, units = "in", res = res,
      type = if (Sys.info()[["sysname"]] == "Darwin") "quartz" else "cairo", ...)
  }
)
message("Saved log-scale-compare.png")
