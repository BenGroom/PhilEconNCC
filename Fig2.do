** Housekeeping 
clear all 
if c(username)=="moritzdrupp" {
	cd "/Users/moritzdrupp/Dropbox/Discounting_Survey/Philosophers_paper/NCC_final/Replication package"
}

if c(username)=="frikk" {
	cd "C:\Users\cnx664\Dropbox\Discounting_Survey\Philosophers_paper\NCC_final\Replication package"
}

import excel "DICE_runs_for_Fig2.xlsx", sheet("Sheet1") firstrow

** Fig 2
* Convert from 2015 to 2020 USD
replace SCC_Phil = 1.09*SCC_Phil
replace SCC_Phil1 = 1.09*SCC_Phil1
replace SCC_Phil2 = 1.09*SCC_Phil2
replace SCC_Phil3 = 1.09*SCC_Phil3
replace SCC_Phil4 = 1.09*SCC_Phil4
replace SCC_Phil5 = 1.09*SCC_Phil5
replace SCC_Phil6 = 1.09*SCC_Phil6
replace SCC_Phil7 = 1.09*SCC_Phil7
replace SCC_Phil8 = 1.09*SCC_Phil8
replace SCC_Phil9 = 1.09*SCC_Phil9
replace SCC_Phil10 = 1.09*SCC_Phil10

* Paths
graph twoway (lowess SCC_Phil Year, lcolor(red) lwidth(thick) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})"))  (lowess SCC_Phil1 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})"))  (lowess SCC_Phil2 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil3 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil4 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil5 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil6 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil7 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil8 Year, lcolor(red) lpattern(-) lwidth(thick) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil9 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")) (lowess SCC_Phil10 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Social cost of carbon (US$ per ton CO{subscript:2})")), legend(region(color(none)) cols(1) order(1 "Median philosopher view" 9 "Median philosopher run" 2 "Individual philosopher view")) ylabel(0(200)1200) yscale(range(0(100)1200))
graph export SCC_AllPhil.pdf, replace

graph twoway (lowess Temp_Phil Year, lcolor(red) lwidth(thick) graphregion(color(white)) ytitle("Temperature change ({c 176}C)"))  (lowess Temp_Phil1 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)"))  (lowess Temp_Phil2 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil3 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil4 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil5 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil6 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil7 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil8 Year, lcolor(red) lpattern(-) lwidth(thick) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil9 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")) (lowess Temp_Phil10 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Temperature change ({c 176}C)")), legend(region(color(none)) cols(1) order(1 "Median philosopher view" 9 "Median philosopher run" 2 "Individual philosopher view")) yscale(range(0.9 2.1))
graph export Temp_AllPhil.pdf, replace

graph twoway (lowess Decarb_Phil Year, lcolor(red) lwidth(thick) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})"))  (lowess Decarb_Phil1 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})"))  (lowess Decarb_Phil2 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil3 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil4 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil5 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil6 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil7 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil8 Year, lcolor(red) lpattern(-) lwidth(thick) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil9 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")) (lowess Decarb_Phil10 Year, lcolor(red) lwidth(thin) graphregion(color(white)) ytitle("Industrial emissions (GtCO{subscript:2})")), legend(region(color(none)) cols(1) order(1 "Median philosopher view" 9 "Median philosopher run" 2 "Individual philosopher view" )) yscale(range(-20 40))
graph export Decarb_AllPhil.pdf, replace

clear all

* Pairs
use "Survey_data.dta"

label var puretp "Pure time preference (in %)"
label var eta "Elasticity of the marginal utility"

drop if Econ==1
keep puretp eta
drop if puretp==.
drop if eta==.

set obs 11
replace puretp = .075 in 11
replace eta = 1.25 in 11

gen classification = 0
replace classification = 1 if puretp==.075 & eta==1.25
replace classification = 2 if puretp==0 & eta==2

graph twoway (scatter eta puretp if classification==0, mcolor(red) msymbol(Dh) graphregion(color(white))) (scatter eta puretp if classification==1, mcolor(red) msymbol(O) graphregion(color(white))) (scatter eta puretp if classification==2, mcolor(red) msymbol(Oh) graphregion(color(white))), bgcolor(white) legend(region(color(none)) cols(1) order(2 "Median philosopher view" 3 "View of median philosopher run" 1 "Individual philosopher view")) 
graph export DeltaEtaPlot.pdf, replace
