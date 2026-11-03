#!/usr/bin/env Rscript

# Quantifying shedding difference between lines

line_summary <- df %>%
  group_by(Genotype) %>%
  summarize(mean_shed = mean(CFUshed, na.rm = TRUE), .groups = 'drop')
line_summary
max_line <- max(line_summary$mean_shed)
min_line <- min(line_summary$mean_shed[line_summary$mean_shed > 0])
print(paste("Fold-difference between max and min lines>", round(max_line / min_line, 2)))

## Standard ANOVA to confirm significant variation 
anova_variation <- aov(log10(CFUshed + 1) ~ Genotype, data = df)
summary(anova_variation)

