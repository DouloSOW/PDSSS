***Focus on 2022Q2 and 2019Q4

****This dofile is aimed at producing the dataset that will be used for the Generic ML in R

*Define all the paths we need and set how the files are linked
global mainPath = "C:\Users\doulo\Dropbox\PDSSS"

global ToDataBrut = "$mainPath\DATABRUT\Data"

global ToData = "$mainPath\Data"

global ToDataO= "$mainPath\DataO"


use "$ToData\2019\INDIV194.dta", clear
//keep if emploi==1

//keep chpub activite_econo emploi chomeur ident chpub noi annee sexe Append194_20`tr' age

** Keep only follow-up obs
**bys ident noi: gen Nobs = _N

*drop if Nobs ==1
*drop if age>75
*replace annee = (annee!=2019)
*label define annee 0 "2019" 1 "2020"

****Recode variables
tab statutdet, gen(statutdet)
tab activite_econo, gen(activite_econo)

*CHPUB Nature de l'employeur de la profession principale

destring matri, replace
gen celibataire=(matri==1)

label define DDIPL_l 1 "Diplôme supérieur à baccalauréat + 2 ans" 3 "Baccalauréat + 2 ans" 4 "Baccalauréat ou brevet professionnel ou autre diplôme de ce niveau" 5 "CAP, BEP ou autre diplôme de ce niveau" 6 "Brevet des collèges" 7 "Aucun diplôme ou certificat d’études primaires"

destring ddipl, replace
label values ddipl DDIPL_l
tab ddipl, gen(dipl)

destring nbenfa1, replace
gen nbenfa1_oui = (nbenfa1>0)

destring nbenfa3, replace
gen nbenfa3_oui = (nbenfa3>0)

destring nbenfa6, replace
gen nbenfa6_oui = (nbenfa6>0)

destring nbenfa10, replace
gen nbenfa10_oui = (nbenfa10>0)

destring metrodom, replace
gen metroplolien = (metrodom==1)

** clustering variable: ident
keep ident noi emploi annee age sexe celibataire nbenfa1_oui nbenfa3_oui nbenfa6_oui nbenfa10_oui metroplolien dipl? statutdet* activite_econo*
save "$ToData\2019\INDIV194_forGML.dta", replace

******************************************************
*****************************************************

use "$ToData\2020\INDIV202.dta", clear
//keep if emploi==1

//keep chpub activite_econo emploi chomeur ident chpub noi annee sexe Append194_20`tr' age

** Keep only follow-up obs
**bys ident noi: gen Nobs = _N


****Recode variables
tab statutdet, gen(statutdet)
tab activite_econo, gen(activite_econo)

*CHPUB Nature de l'employeur de la profession principale

destring matri, replace
gen celibataire=(matri==1)

label define DDIPL_l 1 "Diplôme supérieur à baccalauréat + 2 ans" 3 "Baccalauréat + 2 ans" 4 "Baccalauréat ou brevet professionnel ou autre diplôme de ce niveau" 5 "CAP, BEP ou autre diplôme de ce niveau" 6 "Brevet des collèges" 7 "Aucun diplôme ou certificat d’études primaires"

destring ddipl, replace
label values ddipl DDIPL_l
tab ddipl, gen(dipl)

destring nbenfa1, replace
gen nbenfa1_oui = (nbenfa1>0)

destring nbenfa3, replace
gen nbenfa3_oui = (nbenfa3>0)

destring nbenfa6, replace
gen nbenfa6_oui = (nbenfa6>0)

destring nbenfa10, replace
gen nbenfa10_oui = (nbenfa10>0)

destring metrodom, replace
gen metroplolien = (metrodom==1)

** clustering variable: ident
keep ident noi emploi annee age sexe celibataire nbenfa1_oui nbenfa3_oui nbenfa6_oui nbenfa10_oui metroplolien dipl? statutdet* activite_econo*

save "$ToData\2020\INDIV202_forGML.dta", replace



***********************************
***********************************

use "$ToData\2019\INDIV194_forGML.dta", clear

append using "$ToData\2020\INDIV202_forGML.dta" , gen (Append194_202) 


bys ident noi: gen Nobs = _N
drop if Nobs ==1
drop if age>75
numlabel, add
replace annee = (annee!=2019)
label define annee 0 "2019" 1 "2020"
label values annee annee
tab annee

sort ident
gen identA =_n
replace identA = identA+100 if ident!=ident[_n-1]
bys ident: egen identAA = max(identA)
drop ident
gen ident=identAA
drop identA identAA

save "$ToData\append\1_forGML.dta", replace

sort iden noi annee 
*foreach v of varlist age celibataire nbenfa10 nbenfa1 nbenfa3 nbenfa6 metroplolien dipl? statutdet* activite_econo* {
*bys ident: replace `v' = `v'[_n-1] if noi ==noi[_n-1]
*}

save "$ToData\append\1_forGML.dta", replace








