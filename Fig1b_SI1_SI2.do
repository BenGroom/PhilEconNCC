** Housekeeping 
clear all 
if c(username)=="moritzdrupp" {
	cd "/Users/moritzdrupp/Dropbox/Discounting_Survey/Philosophers_paper/NCC_final/Replication package"
}

if c(username)=="frikk" {
	cd "C:\Users\cnx664\Dropbox\Discounting_Survey\Philosophers_paper\NCC_final\Replication package"
}

use "Survey_data.dta"

** Fig SI1 and SI2
label var SDR "Social discount rate (in %)"
twoway (histogram SDR if Econ==0, color(red) lcolor(red) start(0) width(0.6) xlabel(0(1)10)) ///
       (histogram SDR if Econ==1, color(none) lcolor(gray) start(0) width(0.6) xlabel(0(1)10) ///
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))
graph export SDR.pdf, replace


label var puretp "Pure time preference (in %)"
twoway (histogram puretp if Econ==0, color(red) lcolor(red) start(0) width(0.4) xlabel(0(1)8)) ///
       (histogram puretp if Econ==1, color(none) lcolor(gray) start(0) width(0.4) xlabel(0(1)8) ///
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))
graph export PureTP.pdf, replace

label var eta "Elasticity of marginal utility"
twoway (histogram eta if Econ==0, color(red) lcolor(red) start(0) width(0.4) xlabel(0(1)5)) ///
       (histogram eta if Econ==1, color(none) lcolor(gray) start(0) width(0.4) xlabel(0(1)5) ///
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))
graph export eta.pdf, replace

label var growth "Growth rate (in %)"
twoway (histogram growthpc if Econ==0, color(red) lcolor(red) start(-2) width(0.4) xlabel(-2(1)6)) ///
       (histogram growthpc if Econ==1, color(none) lcolor(gray) start(-2) width(0.4) xlabel(-2(1)6) ///
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))
graph export Growth.pdf, replace

label var real "Risk-free interest rate (in %)"
twoway (histogram realrfr if Econ==0, color(red) lcolor(red) start(0) width(0.4) xlabel(0(1)6)) ///
       (histogram realrfr if Econ==1, color(none) lcolor(gray) start(0) width(0.4) xlabel(0(1)6) ///
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))
graph export Real.pdf, replace

label var norm "Normative weight (in %)"
twoway (histogram normative if Econ==0,  color(red) lcolor(red) start(0) width(7) xlabel(0(20)100)) ///
       (histogram normative if Econ==1, color(none) lcolor(gray) start(0) width(7) xlabel(0(20)100) ///
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))	
graph export Norm.pdf, replace

gen SDRminSRR = SDR - puretp - eta*growth
replace SDRminSRR = . if SDRminSRR<-5.5
replace SDRminSRR = . if SDRminSRR>5.5
label var SDRminSRR "SDR - SRR (in %-points)"
twoway (histogram SDRminSRR if Econ==0, color(red) lcolor(red) start(-5.5) width(0.6) xlabel(-5(1)5)) ///
       (histogram SDRminSRR if Econ==1, color(none) lcolor(gray) start(-5.5) width(0.6) xlabel(-5(1)5) ///   
       graphregion(color(white)) bgcolor(white)), legend(region(color(none)) order(1 "Philosophers" 2 "Economists"))
graph export SDRminSRR.pdf, replace

** Fig 1b
* Philosophers
gen SDRmaxP = .
replace SDRmaxP=SDRmax if Econ==0
gen SDRminP = .
replace SDRminP=SDRmin if Econ==0
replace SDRmaxP = . if SDRminP==.
replace SDRminP = . if SDRmaxP==.

cap drop countP
gen countP=.
cap drop minP
gen minP=.
cap drop maxP
gen maxP=.

forvalues i = -3(.5)16 {
                                 local k = (`i'+3)*2 +1
                                 count if SDRmaxP >= `i' & SDRminP<= `i'
                                 replace minP = `i' in `k'
                                 *replace max0 = `i' in `k'
                                 replace countP = r(N) in `k'
                                 }

cap drop propP
gen propP = countP/11
label var propP "Proportion of Philosophers with SDR in 0% Range"
line propP minP

* Economists
gen SDRmaxE = .
replace SDRmaxE=SDRmax if Econ==1
gen SDRminE = .
replace SDRminE=SDRmin if Econ==1
replace SDRmaxE = . if SDRminE==.
replace SDRminE = . if SDRmaxE==.

cap drop countE
gen countE=.
cap drop minE
gen minE=.
cap drop maxE
gen maxE=.

forvalues i = -3(.5)16 {
                                 local k = (`i'+3)*2 +1
                                 count if SDRmaxE >= `i' & SDRminE<= `i'
                                 replace minE = `i' in `k'
                                 *replace max0 = `i' in `k'
                                 replace countE = r(N) in `k'
                                 }


cap drop propE
gen propE = countE/182
label var propE "Proportion of Economists with SDR in 0% Range"
line propE minE

			 
twoway                            (bar propP minP , barwidth(0.5)  lwidth(medthick) color(red) lcolor(red)) ////
                                  (bar propE minE, barwidth(0.5) lwidth(medthick) color(none) lcolor(gray)) ////								  
                 , ytitle("Percent") graphregion(color(white)) /*title("Proportion of Experts in Agreement") */xtitle("Social discount rate (in %)") xsize(9) legend(color(gs4) region(color(none)) order(1 "Philosophers" 2 "Economists"))
				 graph export Range_wide.pdf, replace				 
				  				  
