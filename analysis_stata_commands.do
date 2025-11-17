* ---
* FILENAME: analysis_stata_commands.do
* PROJECT: Gender Wage Gap in the Indian Labour Market: A Comparative Analysis
* AUTHOR: Devadharshini S
* DATE: 10-Nov-2025


* 0. SCRIPT SETUP

clear all
set more off


* Start a new log file to capture all output.

log using "dissertation_analysis_outputs.smcl", replace


* STEP 1: LOAD PREPARED DATA

use "X:\Projects\STATA-Pr\gssap.dta", clear


* STEP 2: SET SURVEY DESIGN

svyset FSU [pweight=weight], strata(Stratum)


* STEP 3: DATA CLEANING

capture drop dum_*


* STEP 4: DUMMY VARIABLE CREATION FOR OAXACA 


tab GenEdu, gen(dum_GenEdu)
tab TechEdu, gen(dum_TechEdu)
tab HHSize, gen(dum_HHSize)
tab Trained, gen(dum_Trained)
tab SocialGroup, gen(dum_SG)
tab MaritalStatus, gen(dum_MarStat)


* STEP 5: GLOBAL VARIABLE DEFINITIONS 

* For the `regress` command where factor variables work
global mincer_vars "i.GenEdu i.TechEdu i.HHSize i.Trained i.SocialGroup i.MaritalStatus Age_cont Age_sq_cont"

* For the `oaxaca` command for which dummy variables were created

global oaxaca_vars "dum_GenEdu2 dum_GenEdu3 dum_TechEdu2 dum_TechEdu3 dum_HHSize2 dum_HHSize3 dum_HHSize4 dum_HHSize5 dum_Trained2 dum_SG2 dum_SG3 dum_SG4 dum_MarStat2 dum_MarStat3 dum_MarStat4 Age_cont Age_sq_cont"


* STEP 6: RAW WAGE GAP ANALYSIS (FOR ALL-INDIA) 

display "--- Part 6.1: Rural Regular Salaried (Raw Gap) ---"
svy: mean lnRegWage if Sector == 1 & Occupation == 2, over(Year Sex)

display "--- Part 6.2: Urban Regular Salaried (Raw Gap) ---"
svy: mean lnRegWage if Sector == 2 & Occupation == 2, over(Year Sex)

display "--- Part 6.3: Rural Self-Employed (Raw Gap) ---"
svy: mean lnSelfWage if Sector == 1 & Occupation == 1, over(Year Sex)

display "--- Part 6.4: Urban Self-Employed (Raw Gap) ---"
svy: mean lnSelfWage if Sector == 2 & Occupation == 1, over(Year Sex)


* STEP 7: CONDITIONAL WAGE GAP REGRESSIONS ( FOR ALL-INDIA) 

display "--- REGRESSIONS FOR YEAR 2018 ---"
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 1 & Occupation == 2 & Year == 2018
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 2 & Occupation == 2 & Year == 2018
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 1 & Occupation == 1 & Year == 2018
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 2 & Occupation == 1 & Year == 2018

display "--- REGRESSIONS FOR YEAR 2019 ---"
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 1 & Occupation == 2 & Year == 2019
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 2 & Occupation == 2 & Year == 2019
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 1 & Occupation == 1 & Year == 2019
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 2 & Occupation == 1 & Year == 2019

display "--- REGRESSIONS FOR YEAR 2020 ---"
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 1 & Occupation == 2 & Year == 2020
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 2 & Occupation == 2 & Year == 2020
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 1 & Occupation == 1 & Year == 2020
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 2 & Occupation == 1 & Year == 2020

display "--- REGRESSIONS FOR YEAR 2022 ---"
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 1 & Occupation == 2 & Year == 2022
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 2 & Occupation == 2 & Year == 2022
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 1 & Occupation == 1 & Year == 2022
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 2 & Occupation == 1 & Year == 2022

display "--- REGRESSIONS FOR YEAR 2023 ---"
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 1 & Occupation == 2 & Year == 2023
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 2 & Occupation == 2 & Year == 2023
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 1 & Occupation == 1 & Year == 2023
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 2 & Occupation == 1 & Year == 2023

display "--- REGRESSIONS FOR YEAR 2024 ---"
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 1 & Occupation == 2 & Year == 2024
svy: regress lnRegWage $mincer_vars i.Sex if Sector == 2 & Occupation == 2 & Year == 2024
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 1 & Occupation == 1 & Year == 2024
svy: regress lnSelfWage $mincer_vars i.Sex if Sector == 2 & Occupation == 1 & Year == 2024


* STEP 8: BLINDER-OAXACA DECOMPOSITION (ALL-INDIA) 

* The `relax` option added to all commands to handle r(499) error

display "--- 8.1: Blinder-Oaxaca: Rural Regular Salaried (Pooled) ---"
oaxaca lnRegWage $oaxaca_vars if Sector == 1 & Occupation == 2 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax

display "--- 8.2: Blinder-Oaxaca: Urban Regular Salaried (Pooled) ---"
oaxaca lnRegWage $oaxaca_vars if Sector == 2 & Occupation == 2 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax

display "--- 8.3: Blinder-Oaxaca: Rural Self-Employed (Pooled) ---"
oaxaca lnSelfWage $oaxaca_vars if Sector == 1 & Occupation == 1 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax

display "--- 8.4: Blinder-Oaxaca: Urban Self-Employed (Pooled) ---"
oaxaca lnSelfWage $oaxaca_vars if Sector == 2 & Occupation == 1 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax


* STEP 9: STATE-LEVEL COMPARATIVE DECOMPOSITION ---

display "--- STATE: GUJARAT (state_utcode == 24) ---"
oaxaca lnRegWage $oaxaca_vars if Sector == 1 & Occupation == 2 & state_utcode == 24 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax
oaxaca lnRegWage $oaxaca_vars if Sector == 2 & Occupation == 2 & state_utcode == 24 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax
oaxaca lnSelfWage $oaxaca_vars if Sector == 1 & Occupation == 1 & state_utcode == 24 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax
oaxaca lnSelfWage $oaxaca_vars if Sector == 2 & Occupation == 1 & state_utcode == 24 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax

display "--- STATE: MANIPUR (state_utcode == 14) ---"
oaxaca lnRegWage $oaxaca_vars if Sector == 1 & Occupation == 2 & state_utcode == 14 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax
oaxaca lnRegWage $oaxaca_vars if Sector == 2 & Occupation == 2 & state_utcode == 14 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax
oaxaca lnSelfWage $oaxaca_vars if Sector == 1 & Occupation == 1 & state_utcode == 14 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax
oaxaca lnSelfWage $oaxaca_vars if Sector == 2 & Occupation == 1 & state_utcode == 14 & (Sex == 1 | Sex == 2), by(Sex) pool detail svy relax


* --- 10. END OF SCRIPT ---

display "--- Analysis Complete. Closing log file. ---"
log close