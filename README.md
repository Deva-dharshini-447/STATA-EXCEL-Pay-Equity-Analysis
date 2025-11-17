# Econometric Analysis of Pay Equity in India (PLFS 2017-2024)

This repository contains the econometric analysis of the Gender Wage Gap in the Indian Labour Market. The project involved stewarding 6 years of complex, unit-level national data from the Periodic Labour Force Survey (PLFS) to identify and decompose the drivers of pay inequity/ gender wage gap.

Tools: STATA, Microsoft Excel

Data: Pooled unit-level data from PLFS (2017-18 to 2023-24)

Models: svy: regress (Mincer Regressions), oaxaca (Blinder-Oaxaca Decomposition)

# KEY OBJECTIVES

Examine Trends: Calculate the raw wage gap for men and women from 2017-2024 across four key labour market segments.

Identify Determinants: Estimate 24 Mincer-type wage regressions to find the conditional wage gap after controlling for key variables.

Decompose the Gap: Employ 12 Blinder-Oaxaca decompositions to partition the wage gap into an 'explained' component (characteristics) and an 'unexplained' component (discrimination).

# DATA CHALLENGES, RECONCILIATION & QUALITY CONTROL

Transforming the raw PLFS survey files in text file format into a robust, analysis-ready dataset was the most critical phase of this project. The process required over 50 iterations to ensure data integrity, accuracy, and compatibility with econometric models.

1. Extraction & Conversion:

The original PLFS data was obtained in raw text file format (.txt), not a clean .csv.

STATA dictionaries were used to extract and convert these raw files into usable .dta datasets.

2. Data Reconciliation & Harmonization (Panel Construction):

Synchronized and appended six individual years of datasets (2017-18 to 2023-24) to create a unified pooled cross-sectional dataset.

Key variables (e.g., Education levels, Social Groups) were renamed and recoded to ensure 1:1 consistency across all six survey years.

Irrelevant administrative variables were dropped to optimize dataset size and processing speed.

3. Handling Data Gaps & Inaccuracies:

Exclusion of Bad Data: The 2020-21 dataset was rigorously evaluated and ultimately excluded from the final analysis. It was identified to be statistically invalid due to pandemic-induced irregularities, including a very small sample size and a high frequency of missing values.

Controlled Imputation: For one subgroup where 2019 data was missing, a controlled imputation was performed using 2018 baselines as a necessary trade-off to maintain the integrity of the long-term trend analysis.

4. Feature Engineering:

Due to software limitations (oaxaca command), standard factor variables were incompatible.

Manually engineered dummy variables for all categorical predictors (e.g., dum_GenEdu, dum_SocialGroup) to facilitate the decomposition analysis.

# KEY FINDINGS

Self-Employed Workers Suffer Most: Urban Self-Employed workers face the most severe pay equity gap (average log-wage gap of 0.9967), significantly larger than for regular salaried workers.

Gap is Widening for the Most Vulnerable: The pay gap is visibly widening for both rural and urban self-employed workers over the 2017-24 period.

Economic Growth Does Not Equal Pay Equity: A comparative analysis between a high-performing (Gujarat) and low-performing (Manipur) state implied that economic growth alone does not solve the gap. The higher-performing state (Gujarat) consistently exhibited larger "unexplained" (discriminatory) gaps.

