_This repo is still being updated_
## Project overview
This repository contains re-analysis of host heterogeneity and pathogen transmission traits using the Drosophila Genetic Reference Panel (DGRP). The workflow processes individual-level phenotypic tracking data following _Pseudomonas aeruginosa_ oral infection, partitions variance components to estimate heritability and formats optimized genetic payloads for genome-wide association study (GWAS) mapping on the DGRP2 web server.


**1. Phenotypic Variation**

Initial screening revealed a ~2,254-fold variation in microbial colony-forming units (CFUshed) across line means, indicate the presence of heavy right-skewness common to shedding phenotypes. While the back-transformed log means give about 120-fold.

**2. Variance Partitioning & Broad-Sense Heritability**

Broad-sense heritability ($H^2$) was modeled via linear mixed-effects frameworks using `lme4` across the complete dataset. Because flies within an inbred line share an identical genetic background, heritability was partitioned at two operational scales:
*   **Individual-Level Heritability ($H^2_{\text{individual}} = 0.0544$):** shows single fly variance under intense stochastic environmental and micro-defecation noise.
*   **Line-Mean Heritability ($H^2_{\text{line-mean}} = 0.2871$):** directly calculated using the quantitative genetics scaling formula by leveraging an average replication of $n = 7$ replicates per line:

$$H^2_{\text{line-mean}} = \frac{\sigma^2_G}{\sigma^2_G + \frac{\sigma^2_E}{n}}$$

Averaging across the 7 replicates successfully dampens individual environmental noise, revealing that close to 30% of the variance observed among line means is broadly driven by stable host genetics.

**3.**

**Source Dataset**

The raw phenotypic records utilized in this reanalysis were collected by Vale & Kutzer (2024) at the Institute of Ecology and Evolution, University of Edinburgh.

Vale, P.; Kutzer, M. (2024). Drosophila activity, survival and pathogen shedding after oral infection with the bacterial pathogen Pseudomonas aeruginosa. NERC EDS Environmental Information Data Centre. https://doi.org/10.5285/65c7085a-7bcf-481a-884a-8e1c9cfc395b

**Dependencies & Installation**

This project requires **R (version 4.0 or later)** and, required following packages:
```R
install.packages(c("dplyr", "tidyr", "lme4", "ggplot2", "qqman"))
```
