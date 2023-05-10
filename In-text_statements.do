** Housekeeping 
clear all 
if c(username)=="moritzdrupp" {
	cd "/Users/moritzdrupp/Dropbox/Discounting_Survey/Philosophers_paper/NCC_final/Replication package"
}

if c(username)=="frikk" {
	cd "C:\Users\cnx664\Dropbox\Discounting_Survey\Philosophers_paper\NCC_final\Replication package"
}

use "Survey_data.dta", clear

** In-text statements in Section "Expert recommendations for the SDR"
gen Phil = . 
replace Phil=1 if Econ==0
replace Phil=0 if Econ==1

ranksum SDR, by(Phil)  
sum SDR if Phil==1, d
sum SDR if Phil==0, d

ranksum realrfr, by(Phil) 

ranksum growthpc, by(Phil) 

ranksum normative, by(Phil) 
sum normative if Phil==1, d
sum normative if Phil==0, d

ranksum eta, by(Phil) 

ranksum puretp, by(Phil) 
