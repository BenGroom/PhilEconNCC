** Housekeeping 
clear all 
if c(username)=="moritzdrupp" {
	cd "/Users/moritzdrupp/Dropbox/Discounting_Survey/Philosophers_paper/NCC_final/Replication package"
}

if c(username)=="frikk" {
	cd "C:\Users\cnx664\Dropbox\Discounting_Survey\Philosophers_paper\NCC_final\Replication package"
}

import excel "DICE_runs_for_Fig3.xlsx", sheet("Sheet1") firstrow

** Fig 3
* Convert from 2015 to 2020 USD
replace SCC_Phil_MV = 1.09*SCC_Phil_MV
replace SCC_Phil_MR = 1.09*SCC_Phil_MR
replace SCC_Econ_MV = 1.09*SCC_Econ_MV
replace SCC_Econ_MR = 1.09*SCC_Econ_MR 
replace SCC_Nord = 1.09*SCC_Nord 
replace SCC_Stern = 1.09*SCC_Stern

* Paths
graph twoway (lowess SCC_Phil_MV Year, lcolor(red) lwidth(thick) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})"))  (lowess SCC_Phil_MR Year, lcolor(red) lpattern(-) lwidth(thick) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})"))  (lowess SCC_Econ_MV Year, lcolor(gray) lwidth(medium) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Econ_MR Year, lcolor(gray) lpattern(-) lwidth(medium) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Nord Year, lcolor(black) lwidth(medium) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Stern Year, lcolor(blue) lwidth(medium) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")), legend(region(color(none)) cols(2) order(1 "Median philosopher view" 2 "Median philosopher run" 3 "Median economist view" 4 "Median economist run" 5 "Nordhaus discounting" 6 "Stern discounting")) ylabel(0(200)800) yscale(range(0(200)800))
graph export SCC_ECONPHIL.pdf, replace

graph twoway (lowess Temp_Phil_MV Year, lcolor(red) lwidth(thick) graphregion(color(white)) ytitle("Temperature change ({c 176}C)"))  (lowess Temp_Phil_MR Year, lcolor(red) lpattern(-) lwidth(thick) graphregion(color(white)) ytitle("Temperature change ({c 176}C)"))  (lowess Temp_Econ_MV Year, lcolor(gray) lwidth(medium) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Econ_MR Year, lcolor(gray) lpattern(-) lwidth(medium) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Nord Year, lcolor(black) lwidth(medium) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Stern Year, lcolor(blue) lwidth(medium) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")), legend(region(color(none)) cols(2) order(1 "Median philosopher view" 2 "Median philosopher run" 3 "Median economist view" 4 "Median economist run" 5 "Nordhaus discounting" 6 "Stern discounting")) ylabel(1.2(0.2)2) yscale(range(1.2(0.2)2))
graph export Temp_ECONPHIL.pdf, replace

graph twoway (lowess Decarb_Phil_MV Year, lcolor(red) lwidth(thick) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})"))  (lowess Decarb_Phil_MR Year, lcolor(red) lpattern(-) lwidth(thick) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})"))  (lowess Decarb_Econ_MV Year, lcolor(gray)  lwidth(medium) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Econ_MR Year, lcolor(gray) lpattern(-) lwidth(medium) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Nord Year, lcolor(black) lwidth(medium) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Stern Year, lcolor(blue) lwidth(medium) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")), legend(region(color(none)) cols(2) order(1 "Median philosopher view" 2 "Median philosopher run" 3 "Median economist view" 4 "Median economist run" 5 "Nordhaus discounting" 6 "Stern discounting")) ylabel(-20(20)40) yscale(range(-20(20)40))
graph export Decarb_ECONPHIL.pdf, replace

clear all

* Pairs
set obs 6
gen puretp=.
gen eta=.

gen classification=_n

label var puretp "Pure time preference (in %)"
label var eta "Elasticity of the marginal utility"

* Phil, med view
replace puretp = .075 in 1
replace eta = 1.25 in 1

* Phil, med run
replace puretp = 0 in 2
replace eta = 2 in 2

* Econ, men view
replace puretp = 0.5 in 3
replace eta = 1 in 3

* Econ, med run 

* Nordhaus
replace puretp = 1.5 in 5
replace eta = 1.45 in 5

* Stern
replace puretp = 0.1 in 6
replace eta = 1 in 6

graph twoway (scatter eta puretp if classification==1, mcolor(red) msymbol(O) graphregion(color(white))) (scatter eta puretp if classification==2, mcolor(red) msymbol(Oh) graphregion(color(white))) (scatter eta puretp if classification==3, mcolor(gray) msymbol(O) graphregion(color(white))) (scatter eta puretp if classification==4, mcolor(gray) msymbol(Oh) graphregion(color(white))) (scatter eta puretp if classification==5, mcolor(black) msymbol(O) graphregion(color(white))) (scatter eta puretp if classification==6, mcolor(blue) msymbol(O) graphregion(color(white))), bgcolor(white) legend(region(color(none)) cols(2) order(1 "Median philosopher view" 2 "View of median philosopher run" 3 "Median economist view" 5 "Nordhaus discounting" 6 "Stern discounting")) ylabel(0(0.5)2) yscale(range(0(0.5)2))
graph export DeltaEtaPlot_ECONPHIL.pdf, replace
