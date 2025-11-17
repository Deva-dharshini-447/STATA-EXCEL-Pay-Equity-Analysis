# PAY-EQUITY-ANALYSIS
This repository contains the documents and details for the econometric analysis on the Gender Wage Gap in the Indian Labour Market, including the data used, software tools and methods, data challenges faced, interpretations, and the STATA commands and output files.

# ECONOMETRIC ANALYSIS OF PAY EQUITY GAP IN INDIA

ABOUT THE MOTIVE OF THE PROJECT: 
This analysis originated as the basis for my master’s degree thesis, born from a desire to find answers to persistent societal problems which was first sparked during my undergraduate studies in Political Science. But it was my post-graduate degree in Economics that equipped me with skills in tools and methods of data analysis, fuelling my search for quantifiable answers to my qualitative questions.

# ABOUT THE CHOICE OF THE DATA: 
To properly scale and analyze the extent of the pay gap faced by various types of workers across different states in India, unit-level data from the Periodic Labour Force Survey (PLFS) was collected, of 6 years spanning from 2017-2018 to 2023-2024, excluding the data for 2020-2021 due to large scale missing data inconsistencies owing to the pandemic. The collected data was extracted, cleaned, managed, analyzed, and interpreted using Excel and STATA. The process for each step of this project is described below.

# KEY OBJECTIVES OF THE PROJECT:
1.	Examining Trends: Calculating the raw wage gap for men and women from 2017-2024 across four key labour market segments.
2.	Identifying Determinants: Estimating 24 Mincer-type wage regressions to find the conditional wage gap after controlling for human capital and demographic variables.
3.	Decomposing the Gap: Employing 12 Blinder-Oaxaca decompositions to partition the wage gap into an 'explained' component (differences in characteristics) and an 'unexplained' component (differences in returns/discrimination).
4.	Conducting Comparative Analysis: Comparing the wage gap structure between a high-performing (Gujarat) and a low-performing (Manipur) state.

# METHODOLOGY & TOOLS:
•	Tool: STATA, Microsoft Excel.
•	Data: Pooled unit-level data from the Periodic Labour Force Survey (PLFS) 2017-2024. 
•	Models:
o	svy: mean ... over(): To calculate survey-adjusted raw means.
o	svy: regress: To estimate 24 Mincer-type wage equations.
o	oaxaca: To run 12 Blinder-Oaxaca decompositions.

# DATA CLEANING, PREPARATION AND CHALLENGES
The transformation of raw survey data into an dataset ready for smooth analysis flow involved many processes, requiring over 50 iterations to ensure the accuracy and compatibility with the model.

1. Extraction & Conversion: The original PLFS data (downloaded May 2024) was obtained in raw text file format. Stata dictionaries were utilized to extract and convert these files into usable .dta datasets.

2. Variable Management: To ensure clarity and consistency across years, key variables (e.g., Education levels, Social Groups) were renamed and recoded. Irrelevant administrative variables were dropped to optimize dataset size and processing speed.

3. Panel Construction (Appending): Six individual years of datasets (2017-18 to 2023-24) were harmonized and appended to create a unified pooled cross-sectional dataset for trend analysis.

4. Handling Data Gaps:

4.1. Exclusion: The 2020-21 dataset was rigorously evaluated and ultimately excluded due to pandemic-induced irregularities, including a drastically reduced sample size and a high frequency of missing values that threatened statistical validity.

4.2. Imputation: For a specific rural subgroup where 2019 data was missing, a controlled imputation was performed using 2018 baselines. This was executed as a necessary trade-off to maintain the integrity of the long-term trend analysis (and is acknowledged as a limitation).

5. Feature Engineering: Due to the incompatibility of the oaxaca command with standard factor variables, manual dummy variables were engineered for all categorical predictors (e.g., dum_GenEdu, dum_SocialGroup) to facilitate the decomposition analysis.

# KEY FINDINGS
•	Self-Employed Workers Suffer Most: Urban Self-Employed workers face the most severe pay equity gap (average log-wage gap of 0.9967), followed closely by Rural Self-Employed workers (0.9034). These gaps are significantly larger than those for regular salaried workers.
•	The Gap is Widening for the Most Vulnerable: The pay gap is visibly increasing (widening) for both rural and urban self-employed workers over the years from 2017-18 to 2023-24 period. In contrast, the gap for regular salaried workers appears relatively stable or fluctuating.
•	Economic Growth Does Not Equal Pay Equity: The big picture implies that from the comparison between high performing state (Gujarat) and Low performing state () that economic growth alone does not solve the gender pay gap. The higher-performing state (Gujarat) consistently exhibited larger "unexplained" (discriminatory) gaps than the lower-performing state (Manipur).



