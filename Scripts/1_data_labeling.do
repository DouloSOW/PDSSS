**Semester 1 2019
global path19 "C:\Users\doulo\Dropbox\PDSSS\Data\lil-1410b_2019.dta\Stata"
**Semester 4 2018
global path18 "C:\Users\doulo\Dropbox\PDSSS\Data\lil-1350b_2018.dta\Stata"

use "$path19\INDIV191.dta", clear
capture gen emploi = (acteu=="1")
tab emploi
save, replace

use "$path18\INDIV184.dta", clear
capture gen emploi = (acteu=="1")
tab emploi
save, replace

use "$path19\INDIV191.dta", clear
append using "$path18\INDIV184.dta", keep (emploi ident noi annee sexe) gen (Append2019Sem1_18Sem4)
keep emploi ident noi annee sexe Append2019Sem1_18Sem4

** Keep only follow-up obs
bys ident noi: gen Nobs = _N
drop if Nobs ==1
tab emploi annee

gen annee_id = (annee=="2018")
ttest emploi, by(annee_id)
destring sexe, replace
destring annee, replace

reg emploi i.annee if sexe==1
reg emploi i.annee if sexe==2

***

global path19 "C:\Users\doulo\Dropbox\PDSSS\Data\lil-1410b_2019.dta\Stata"
**Semester 4 2018
global path20"C:\Users\doulo\Dropbox\PDSSS\Data\lil-1525b_2021.dta\Stata"
*lil-1457b_2020.dta
use "$path19\INDIV194.dta", clear
capture gen emploi = (acteu=="1")
tab emploi
save, replace

use "$path20\INDIV214.dta", clear
capture gen emploi = (acteu=="1")
tab emploi
save, replace


use "$path19\INDIV194.dta", clear
append using "$path20\INDIV214.dta", keep (emploi ident noi annee sexe) gen (Append2019Sem1_18Sem4)
keep emploi ident noi annee sexe Append2019Sem1_18Sem4

** Keep only follow-up obs
bys ident noi: gen Nobs = _N
drop if Nobs ==1
tab emploi annee

gen annee_id = (annee=="2019")
ttest emploi, by(annee_id)
destring sexe, replace
destring annee, replace

reg emploi i.annee if sexe==1
reg emploi i.annee if sexe==2



save merged2019Sem1_18Sem4, replace

tab emploi annee