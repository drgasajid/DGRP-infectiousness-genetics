## Project overview
This repository contains a reproducible quantitative genetics pipeline for the reanalysis of host heterogeneity and pathogen transmission traits using the Drosophila Genetic Reference Panel (DGRP). The workflow processes individual-level phenotypic tracking data following an orally acquired _Pseudomonas aeruginosa_ infection, partitions variance components to estimate heritability and formats optimized genetic payloads for genome-wide association study (GWAS) mapping on the DGRP2 web server.


**1. Phenotypic Variation & Outlier Evaluation**

Initial screening unmasked an expansive ~2,254-fold variation in microbial colony-forming units (CFUshed) across line means, highlighting the presence of heavy right-skewness common to shedding phenotypes. A diagnostic sensitivity filter using Cook's Distance (Threshold = \(4/N\)) isolated 26 super-spreader flies. 

