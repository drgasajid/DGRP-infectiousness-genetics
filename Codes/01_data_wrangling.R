#!/usr/bin/env Rscript

# Data Import
df <- read_csv("dgrp_traits.csv", na = c("na", "NA", "na ", " "))
df$CFUshed <- as.numeric(df$CFUshed)
df$Activity_bouts <- as.numeric(df$Activity_bouts)
df$Lifespan_mins <- as.numeric(df$Lifespan_mins)
df <- df %>% filter(!is.na(CFUshed))
df

# Raw scale mean bar plot
bar_data_raw <- df %>%
  group_by(Genotype) %>%
  summarize(mean_raw_shed = mean(CFUshed, na.rm = TRUE), .groups = 'drop') %>%
  mutate(Genotype = reorder(Genotype, mean_raw_shed))
ggplot(bar_data_raw, aes(x = Genotype, y = mean_raw_shed)) +
  geom_bar(stat = "identity", fill = "darkblue", width = 0.7) +
  theme_classic(base_size = 15) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10),
    panel.grid.major.x = element_blank()
  ) +
  labs(
    x = "DGRP genotype line",
    y = "Mean pathogen shedding (raw CFU)"
  )

# bar plot for line-level genotypic means by Line and Sex
bar_data_log <- df %>%
  mutate(log_shed = log10(CFUshed + 1)) %>%
  group_by(Genotype, Sex) %>%
  summarize(mean_log_shed = mean(log_shed, na.rm = TRUE), .groups = 'drop') %>%
  mutate(Genotype = reorder(Genotype, mean_log_shed, FUN = mean))
ggplot(bar_data_log, aes(x = Genotype, y = mean_log_shed, fill = Sex)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.8), width = 0.7) +
  scale_fill_manual(values = c("F" = "#D55E00", "M" = "#0072B2")) +
  theme_minimal(base_size = 14) +
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, size = 10, face = "bold"),
    panel.grid.minor = element_blank(),
    legend.position = "top"
  ) +
  labs(
    x = "DGRP genotype",
    y = "Mean pathogen shedding [log10(CFU + 1)]",
    fill = "Boilogical sex"
  )

# gwas input file for DGRP web portal (https://quantgenet.msu.edu/dgrp/)
gwas_inputfile <- df %>%
  filter(!is.na(CFUshed)) %>%
  mutate(line_numeric = gsub("Ral-", "", Genotype)) %>%
  group_by(line_numeric) %>%
  summarize(mean_raw_shed = mean(CFUshed, na.rm = TRUE), .groups = 'drop') %>%
  filter(!is.na(line_numeric) & line_numeric != "")
write.table(robust_raw_means, "gwas_inputfile.txt", 
            row.names = FALSE, col.names = FALSE, quote = FALSE, sep = "\t")






