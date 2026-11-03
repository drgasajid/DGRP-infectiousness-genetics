#!/usr/bin/env Rscript

df <- read_csv("dgrp_traits.csv", na = c("na", "NA", "na ", " "))
df$CFUshed <- as.numeric(df$CFUshed)
df$Activity_bouts <- as.numeric(df$Activity_bouts)
df$Lifespan_mins <- as.numeric(df$Lifespan_mins)
df <- df %>% filter(!is.na(CFUshed))
df


