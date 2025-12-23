***********************************************************
* Replication archive for
* Bechtel, Michael M./Liesch, Roman/Scheve, Kenneth F. (2018) 
* "Inequality and Redistribution Behavior in a Give-or-Take Game"
* Proceedings of the National Academy of Sciences of 
* the United States of America
* Available at: XXX
***********************************************************
version 13.1
set more off

capture log close 
log using "Replication Results_Bechtel Liesch Scheve_PNAS.smcl", replace

use bechtel_liesch_scheve_pnas.dta, clear

* 1. Replicate results reported in Figure 1 
* Pooled results
reg taken disadvantagI equality advantagI [pweight = weight], nocons robust 
* GE  = 1: Germany, GE = 0, US
* US
reg taken disadvantagI equality advantagI if GE == 0 [pweight = weight], nocons robust
* GE
reg taken disadvantagI equality advantagI if GE == 1 [pweight = weight], nocons robust


* 2. Replicate results reported in Figure 2 (Kolmogorov-Smirnov-Test)
* Please see Figures_Bechtel_Liesch_Scheve.R for the r-code to replicate this plot.
ksmirnov d_sensitivity = a_sensitivity

ksmirnov d_sensitivity, by(GE)
ksmirnov a_sensitivity, by(GE)

* 3. Replicate results reported in Table 1
svyset [pweight = weight]
svy: tab dtype atype
svy: tab dtype atype if GE == 0
svy: tab dtype atype if GE == 1

* 4. Replicate results reported in Figure 3
local income="inc_middle inc_high"
local age = "a30_49 a50_69 a70_o" 
local education = "edu_middle edu_high"
local occupation = "employed unemployed retired inEducation"
local ideology = "left_ideology right_ideology"
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' GE [pweight = weight], robust
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male  `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 0, robust
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male  `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 1, robust

xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' GE [pweight = weight], robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 0, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 1, robust

* 5. Replicate results in SI Appendix
* Fig. S4: See below


* Table S1: See below

* Table S3
* Pooled results
reg taken disadvantagI equality advantagI [pweight = weight], nocons robust 
* GE  = 1: Germany, GE = 0, US
* US
reg taken  disadvantagI equality advantagI if GE == 0 [pweight = weight], nocons robust
* GE
reg taken disadvantagI equality advantagI if GE == 1 [pweight = weight], nocons robust

* Table S4
* Pooled results
reg taken disadvantagI equality advantagI, nocons robust 
* US
reg taken disadvantagI equality advantagI if GE == 0, nocons robust
* GE
reg taken disadvantagI equality advantagI if GE == 1, nocons robust

* Table S5
svy: tab dtype GE, col
svy: tab atype GE, col

* Table S6
tab dtype GE, col
tab atype GE, col

* Table S7
svy: tab dtype atype

* Table S8
tab dtype atype, cell

* Table S9
svy: tab dtype atype if GE == 0

* Table S10
tab dtype atype if GE == 0, cell

* Table S11
svy: tab dtype atype if GE == 1

* Table S12
tab dtype atype if GE == 1, cell

* Table S13
local income="inc_middle inc_high"
local age = "a30_49 a50_69 a70_o" 
local education = "edu_middle edu_high"
local occupation = "employed unemployed retired inEducation"
local ideology = "left_ideology right_ideology"
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' GE [pweight = weight], robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' GE [pweight = weight], robust

* Table S14
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' GE, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' GE , robust

* Table S15
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation'  GE [pweight = weight], robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation'   GE [pweight = weight], robust

* Table S16
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation'  GE, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation'   GE, robust

* Table S17
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 0, robust
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 1, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 0, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' [pweight = weight] if GE == 1, robust

* Table S18
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' if GE == 0, robust
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' if GE == 1, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' if GE == 0, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' `ideology' if GE == 1, robust

* Table S19
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' [pweight = weight] if GE == 0, robust
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' [pweight = weight] if GE == 1, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' [pweight = weight] if GE == 0, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' [pweight = weight] if GE == 1, robust

* Table S20
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' if GE == 0, robust
xi: reg heavyTaxes d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' if GE == 1, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' if GE == 0, robust
xi: reg notlessBenefits d_equalizer d_other a_equalizer a_other i.IA1 male `income' `age' `education' `occupation' if GE == 1, robust

* Table S21
svy: tab dtype_alt GE, col
svy: tab atype_alt GE, col

* Table S22
tab dtype_alt GE, col
tab atype_alt GE, col

* Table S23
svy: tab dtype_alt atype_alt

* Table S24
tab dtype_alt atype_alt, cell

* Table S25
svy: tab dtype_alt atype_alt if GE == 0

* Table S26
tab dtype_alt atype_alt if GE == 0, cell

* Table S27
svy: tab dtype_alt atype_alt if GE == 1

* Table S28
tab dtype_alt atype_alt if GE == 1, cell

* Table S29
xi: reg heavyTaxes d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' `ideology' GE [pweight = weight], robust
xi: reg notlessBenefits d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' `ideology' GE [pweight = weight], robust

* Table S30
xi: reg heavyTaxes d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' `ideology' GE , robust
xi: reg notlessBenefits d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' `ideology' GE , robust

* Table S31
xi: reg heavyTaxes d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' GE  [pweight = weight], robust
xi: reg notlessBenefits d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' GE  [pweight = weight], robust

* Table S32
xi: reg heavyTaxes d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male `income' `age' `education' `occupation' GE , robust
xi: reg notlessBenefits d_equalizer_alt d_other_alt a_equalizer_alt a_other_alt i.IA1 male  `income' `age' `education' `occupation' GE , robust

* Table S33
* Load data file from validation study
clear
use "bechtel_liesch_scheve_pnas - validation study.dta"
reg taken disadvantagI##policyviewsF equality##policyviewsF advantagI, nocons robust


* Table S1: Distribution of Socio-demographics
* Population demographics sources: see note for Table S1
use bechtel_liesch_scheve_pnas.dta, clear
* Distribution of demographics

*Age
gen agegr = .
replace agegr = 1 if age >= 18 & age <=24
replace agegr = 2 if age >= 25 & age <=44
replace agegr = 3 if age >= 45 & age <=64
replace agegr = 4 if age >= 65
label define agegr_ 1 "Age: 18-24" 2 "Age: 25-44" 3 "Age: 45-64" 4 "Age: 65+"
label values agegr agegr_

tab agegr GE, col
svy: tab agegr GE, col

* Gender
tab male GE, col
svy: tab male GE, col

* Education
* US
tab education_US
svy: tab education_US

* Germany
tab educcat_GE
svy:tab educcat_GE

* Figure S4
* Load data in long format
use "bechtel_liesch_scheve_pnas Fig. S4.dta", clear
twoway (line shareTaken delta_poorer if IA1 == 25, lcolor(gs13) lpattern(solid) lwidth(vvthin) cmissing(n) connect(direct) cmissing(n) title("Own initial endowment: 25", size(small)) saving(IA25))

twoway (line shareTaken delta_poorer if IA1 == 50, lcolor(gs13) lpattern(solid) lwidth(vvthin) cmissing(n) connect(direct) cmissing(n) title("Own initial endowment: 50", size(small)) saving(IA50))

twoway (line shareTaken delta_poorer if IA1 == 75, lcolor(gs13) lpattern(solid) lwidth(vvthin) cmissing(n) connect(direct) cmissing(n) title("Own initial endowment: 75", size(small)) saving(IA75))
graph combine IA25.gph IA50.gph IA75.gph, rows(1)

capture log close
clear
exit

