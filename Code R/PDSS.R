#Importation des données

library(foreign)

#2018
Q12018<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2018/INDIV181.dta")
Q22018<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2018/INDIV182.dta")
Q32018<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2018/INDIV183.dta")
Q42018<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2018/INDIV184.dta")

#library(haven)
#Q12018 %>% distinct()
#write.csv(x = read_dta('/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2018/INDIV181.dta'),file ='Q12018.csv',row.names = F)
#install.packages("xlsx")
#library("xlsx")
#write.xlsx(x = read_dta('/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2018/INDIV181.dta'),file ='Q12018.xls',row.names = F)

#2019
Q12019<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV191.dta")
Q22019<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV192.dta")
Q32019<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV193.dta")
Q42019<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV194.dta")

#write.csv(x = read_dta('/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV191.dta'),file ='Q12019.csv',row.names = F)
#write.xlsx(x = read_dta('/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV191.dta'),file ='Q12019.xlsx',row.names = F)

#library("openxlsx")
#openxlsx::write.xlsx(x = '/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2019/INDIV191.dta', file= 'Q12019.xlsx')

#2020

#write.csv(x = read_dta('/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2020/INDIV201.dta'),file ='Q12020.csv',row.names = F)
Q12020<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2020/INDIV201.dta")
Q22020<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2020/INDIV202.dta")
Q32020<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2020/INDIV203.dta")
Q42020<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2020/INDIV204.dta")

#2021

#write.csv(x = read_dta('/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2021/INDIV211.dta'),file ='Q12021.csv',row.names = F)
Q12021<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2021/INDIV211.dta")
Q22021<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2021/INDIV212.dta")
Q32021<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2021/INDIV213.dta")
Q42021<-read.dta("/Users/serine/Desktop/Cours 3A/Projet DSSS/Données/IND2021/INDIV214.dta")

#Creation de la variable emploi binaire
unique(Q42019$acteu)
unique(Q42019$emploi)

for (i in c(1:4)) {
  
    dfname <- paste(paste("Q", i, sep = ""), 2019, sep = "")
    df <- get(dfname)
    df$emploi <-ifelse(df$acteu=="1","1","0")
}

Q12018$emploi <-ifelse(Q12018$acteu=="1","1","0")
Q22018$emploi <-ifelse(Q22018$acteu=="1","1","0")
Q32018$emploi <-ifelse(Q32018$acteu=="1","1","0")
Q42018$emploi <-ifelse(Q42018$acteu=="1","1","0")


Q12019$emploi <-ifelse(Q12019$acteu=="1","1","0")
Q22019$emploi <-ifelse(Q22019$acteu=="1","1","0")
Q32019$emploi <-ifelse(Q32019$acteu=="1","1","0")
Q42019$emploi <-ifelse(Q42019$acteu=="1","1","0")

Q12020$emploi <-ifelse(Q12020$acteu=="1","1","0")
Q22020$emploi <-ifelse(Q22020$acteu=="1","1","0")
Q32020$emploi <-ifelse(Q32020$acteu=="1","1","0")
Q42020$emploi <-ifelse(Q42020$acteu=="1","1","0")

Q12021$emploi <-ifelse(Q12021$acteu=="1","1","0")
Q22021$emploi <-ifelse(Q22021$acteu=="1","1","0")
Q32021$emploi <-ifelse(Q32021$acteu=="1","1","0")

#Creation de la variable statut en binaire :  Independant et les autres
Q12018$statut <-ifelse(Q12018$statutdet=="10","1","0")
Q22018$statut <-ifelse(Q22018$statutdet=="10","1","0")
Q32018$statut <-ifelse(Q32018$statutdet=="10","1","0")
Q42018$statut <-ifelse(Q42018$statutdet=="10","1","0")


Q12019$statut <-ifelse(Q12019$statutdet=="10","1","0")
Q22019$statut <-ifelse(Q22019$statutdet=="10","1","0")
Q32019$statut <-ifelse(Q32019$statutdet=="10","1","0")
Q42019$statut <-ifelse(Q42019$statutdet=="10","1","0")

Q12020$statut <-ifelse(Q12020$statutdet=="10","1","0")
Q22020$statut <-ifelse(Q22020$statutdet=="10","1","0")
Q32020$statut <-ifelse(Q32020$statutdet=="10","1","0")
Q42020$statut <-ifelse(Q42020$statutdet=="10","1","0")

Q12021$statut <-ifelse(Q12021$statutdet=="10","1","0")
Q22021$statut <-ifelse(Q22021$statutdet=="10","1","0")
Q32021$statut <-ifelse(Q32021$statutdet=="10","1","0")


unique(Q12018$statutdet)




##### Regression pour tester l'hypothèse d'identification en comparant par rapport à Q42019

################2018 vs 2019Q4##################################
# Jointure Q42019 et les Q 2018 en conservant les variables qui nous intéressent

Q42019 = subset( Q42019, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n","statutdet"))
Q42018=subset( Q42018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n","statutdet"))
Append_Q2019_Q42018=rbind(Q42019,Q42018)


Q32018=subset( Q32018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n","statutdet"))
Append_Q2019_Q32018=rbind(Q42019,Q32018)

Q22018=subset( Q22018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n","statutdet"))
Append_Q2019_Q22018=rbind(Q42019,Q22018)

Q12018=subset( Q12018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n","statutdet"))
Append_Q2019_Q12018=rbind(Q42019,Q12018)

#Taux d'emploi a chaque trimestre au total et répartition selon le statut
library('tab')
freqstatutQ12018=tabmulti(statutdet ~ emploi, data = Q12018)
freqQ12018=tabmulti(emploi ~ annee, data = Q12018)


freqstatutQ22018=tabmulti(statutdet ~ emploi, data = Q22018)
freqQ22018=tabmulti(emploi ~ annee, data = Q22018)


freqstatutQ32018=tabmulti(statutdet ~ emploi, data = Q32018)
freqQ32018=tabmulti(emploi ~ annee, data = Q32018)


freqstatutQ42018=tabmulti(statutdet ~ emploi, data = Q42018)
freqQ42018=tabmulti(emploi ~ annee, data = Q42018)


#On ne conserve que les individus présents dans les deux vagues d'enquête
require(dplyr)

df=Append_Q2019_Q42018 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q42018 = merge(Append_Q2019_Q42018, df, by=c("ident","noi"))
Append_Q2019_Q42018=Append_Q2019_Q42018 %>% distinct()
Append_Q2019_Q42018=subset(Append_Q2019_Q42018,Append_Q2019_Q42018$num_dups>1)
dim(Append_Q2019_Q42018)
summary(Append_Q2019_Q42018)

#Append_Q2019_Q42018 <- Append_Q2019_Q42018 %>% 
#  mutate_if(is.character, as.factor)
# T-Test emploi by annee

library(rstatix)

Append_Q2019_Q42018$emploi=as.logical(as.integer(Append_Q2019_Q42018$emploi))


t.test(emploi~annee,data=Append_Q2019_Q42018)
#On ne rejette pas H0 : identification hyp verifiee

library(dplyr)
library(broom)

Append_Q2019_Q42018 %>% 
  group_by(sexe) %>% 
  summarise(tidy(t.test(emploi)))
remove.packages("tidyverse");install.packages("tidyverse")

install.packages("cli")

#Regression 
reg=lm(emploi ~ annee + sexe, data=Append_Q2019_Q42018)
summary(reg)

#On ne rejette pas H0 donc hypothese d'identification verifiee
#########2019 vs 2019Q4###############

Q42019 = subset( Q42019, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n"))


Q32019=subset( Q32018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n"))
Append_Q2019_Q32019=rbind(Q42019,Q32019)

Q22019=subset( Q22018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n"))
Append_Q2019_Q22019=rbind(Q42019,Q22019)

Q12019=subset( Q12018, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","chpub","statut","nafentg010n"))
Append_Q2019_Q12019=rbind(Q42019,Q12019)

##Taux d'emploi a chaque trimestre au total et répartition selon le statut

freqstatutQ12019=tabmulti(statutdet ~ emploi, data = Q12019)
freqQ12019=tabmulti(emploi ~ annee, data = Q12019)


freqstatutQ22019=tabmulti(statutdet ~ emploi, data = Q22019)
freqQ22019=tabmulti(emploi ~ annee, data = Q22019)


freqstatutQ32019=tabmulti(statutdet ~ emploi, data = Q32018)
freqQ32019=tabmulti(emploi ~ annee, data = Q32019)


freqstatutQ42019=tabmulti(statutdet ~ emploi, data = Q42019)
freqQ42019=tabmulti(emploi ~ annee, data = Q42019)



#On ne conserve que les individus présents dans les deux vagues d'enquête
require(dplyr)

df=Append_Q2019_Q32019 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q32019 = merge(Append_Q2019_Q32019, df, by=c("ident","noi"))
Append_Q2019_Q32019=Append_Q2019_Q32019 %>% distinct()
Append_Q2019_Q32019=subset(Append_Q2019_Q32019,Append_Q2019_Q32019$num_dups>1)
dim(Append_Q2019_Q32019)
summary(Append_Q2019_Q32019)

# T-Test emploi by trim
install.packages('rstatix')
library(rstatix)
Append_Q2019_Q32019$emploi=as.logical(as.integer(Append_Q2019_Q32019$emploi))

t_test(Append_Q2019_Q32019,emploi~trim)

#Identification verifiée

#Proportion d'ind en emploi entre les deux trimestres
tabmulti(emploi ~  annee , data = Append_Q2019_Q32019)


#Regression 
reg2=lm(emploi ~ trim + sexe, data=Append_Q2019_Q32019)
summary(reg2)

#L'hypothèse d'identification semble vérifiée étant donné les pvalues : on ne rejette pas H0 que les moyennes d'emploi sont les mêmes entre Q42019 et Q32019
#Il en est de même pour Q12019, Q22019 quand on compare avec Q42019


################2020 vs 2019Q4#######################

Q42019 = subset( Q42019, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","statut","chpub","nafentg010n",'age','regio'))
#keep only the employed in 2019 for push out graph
Q42019=subset(Q42019,Q42019$emploi=="1")
dim(Q42019)
#keep only the non employed in 2019 for push in graph
Q42019=subset(Q42019,Q42019$emploi=="0")
dim(Q42019)

Q42020=subset( Q42020, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","statut","chpub","nafentg010n",'age','regio'))
Append_Q2019_Q42020=rbind(Q42019,Q42020)
subset(Append_Q2019_Q42020,Append_Q2019_Q42020$age<75)

Q32020=subset( Q32020, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","statut","chpub","nafentg010n","age",'regio'))
Append_Q2019_Q32020=rbind(Q42019,Q32020)
subset(Append_Q2019_Q32020,Append_Q2019_Q32020$age<75)


Q22020=subset( Q22020, select = c("emploi", "ident","noi","annee","sexe",'age3',"trim","statut","chpub","nafentg010n","age",'regio'))
Append_Q2019_Q22020=rbind(Q42019,Q22020)
subset(Append_Q2019_Q22020,Append_Q2019_Q22020$age<75)

Q12020=subset( Q12020, select = c("emploi","ident","noi","annee","sexe",'age3',"trim","statut","chpub","nafentg010n","age",'regio'))
Append_Q2019_Q12020=rbind(Q42019,Q12020)
subset(Append_Q2019_Q12020,Append_Q2019_Q12020$age<75)


######## 2020 Q1 vs 2019 Q4 #########
#On ne conserve que les individus présents dans les deux vagues d'enquête
require(dplyr)

df=Append_Q2019_Q12020 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q12020 = merge(Append_Q2019_Q12020, df, by=c("ident","noi"))
Append_Q2019_Q12020=Append_Q2019_Q12020 %>% distinct()
Append_Q2019_Q12020=subset(Append_Q2019_Q12020,Append_Q2019_Q12020$num_dups>1)
dim(Append_Q2019_Q12020)
summary(Append_Q2019_Q12020)

# T-Test emploi by trim
library(rstatix)
Append_Q2019_Q12020$emploi=as.logical(as.integer(Append_Q2019_Q12020$emploi))

t_test(Append_Q2019_Q12020,emploi~annee)

#Proportion d'ind en emploi entre les deux trimestres
library('tab')
tableauQ12020=tabmulti(emploi ~ annee, data = Append_Q2019_Q12020)

#taux d'emploi entre les deux trimestres pour chaque region
region=c(unique(Append_Q2019_Q12020$regio))

for (i in region)
{ data=subset(Append_Q2019_Q12020,Append_Q2019_Q12020$regio==i)

tab=tabmulti(emploi ~  annee , data = data)
print(tab)}
#PUSH OUT GRAPH
#On conserve les baisse des taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(3.7,3.2,3.2,3.7,3.3,4.1,4.5,4.1,4.8,4.2,2.1,3.7,5.1,6.7,5.5,5.3,4.4)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ12020 <- data.frame(region, emploi)
emploiQ12020=emploiQ12020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
#Carte evolution taux d'emploi entre 2019 et 2020Q1 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ12020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "-",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Baisse du taux d'emploi entre Q4 2019 et Q1 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  

#PUSH IN GRAPH

#On conserve les hausse des taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(2.5,4.4,2.7,2.9,3.1,3.3,2.7,2.4,2.5,3.3,2.7,1.6,3.2,2.9,2.4,3.0,3.0)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ12020 <- data.frame(region, emploi)
emploiQ12020=emploiQ12020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
#Carte evolution taux d'emploi entre 2019 et 2020Q1 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ12020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "+",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Hausse du taux d'emploi entre Q4 2019 et Q1 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%hc_colorAxis(minColor = "yellow", maxColor =  "red")%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  



#Regression 
regre=lm(emploi ~ annee + sexe, data=Append_Q2019_Q12020)
summary(regre)

#Pas significatif du tout


######## 2020 Q2 vs 2019 Q4 #########
#On ne conserve que les individus présents dans les deux vagues d'enquête
require(dplyr)

df=Append_Q2019_Q22020 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q22020 = merge(Append_Q2019_Q22020, df, by=c("ident","noi"))
Append_Q2019_Q22020=Append_Q2019_Q22020 %>% distinct()
Append_Q2019_Q22020=subset(Append_Q2019_Q22020,Append_Q2019_Q22020$num_dups>1)
dim(Append_Q2019_Q22020)
summary(Append_Q2019_Q22020)

# T-Test emploi by trim
library(rstatix)
Append_Q2019_Q22020$emploi=as.logical(as.integer(Append_Q2019_Q22020$emploi))

t_test(Append_Q2019_Q22020,emploi~annee)
#L'effet est très significatif entre Q42019 et Q22020

#Proportion d'ind en emploi entre les deux trimestres
tableau=tabmulti(emploi ~  annee , data = Append_Q2019_Q22020)


#taux d'emploi entre les deux trimestres pour chaque region
region=c(unique(Append_Q2019_Q22020$regio))

for (i in region)
{ data=subset(Append_Q2019_Q22020,Append_Q2019_Q22020$regio==i)
  
  tab=tabmulti(emploi ~  annee , data = data)
  print(tab)}

#PUSH OUT GRAPH
#On conserve les taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(5.7,6.3,5.8,6.0,5.1,6.6,6.4,6.4,2.5,6.4,5.7,6.7,7.8,10.4,7.0,7.4,8.0)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ22020 <- data.frame(region, emploi)
emploiQ22020=emploiQ22020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
emploiQ22020$emploi=as.numeric(emploiQ22020$emploi)
#Carte evolution taux d'emploi entre 2019 et 2020Q2 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ22020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "-",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Baisse du taux d'emploi entre Q4 2019 et Q2 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
    
    title="Taux d'emploi")%>%

  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  

#PUSH IN GRAPH

#On conserve les hausse des taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(3.0,4.9,3.2,3.1,3.5,3.7,3.2,3.1,2.7,3.6,3.5,3.7,4.2,3.4,3.2,3.7,3.1)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ22020 <- data.frame(region, emploi)
emploiQ22020=emploiQ22020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
#Carte evolution taux d'emploi entre 2019 et 2020Q2 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ22020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "+",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Hausse du taux d'emploi entre Q4 2019 et Q2 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%hc_colorAxis(minColor = "yellow", maxColor =  "red")%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  






#Regression 
regr=lm(emploi ~ annee + sexe, data=Append_Q2019_Q22020)
summary(regr)

#En ne conservant que les independants
ind=subset(Append_Q2019_Q22020,Append_Q2019_Q22020$statut=="1")
ind$emploi=as.logical(as.integer(ind$emploi))

regindn=lm(emploi ~ annee + sexe , data=ind)
summary(regindn) #pas significatif chez les independants : pvalue= 0.314



######## 2020 Q3 vs 2019 Q4 #########
#On ne conserve que les individus présents dans les deux vagues d'enquête
require(dplyr)

df=Append_Q2019_Q32020 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q32020 = merge(Append_Q2019_Q32020, df, by=c("ident","noi"))
Append_Q2019_Q32020=Append_Q2019_Q32020 %>% distinct()
Append_Q2019_Q32020=subset(Append_Q2019_Q32020,Append_Q2019_Q32020$num_dups>1)
dim(Append_Q2019_Q32020)
summary(Append_Q2019_Q32020)

# T-Test emploi by trim
library(rstatix)
Append_Q2019_Q32020$emploi=as.logical(as.integer(Append_Q2019_Q32020$emploi))

t_test(Append_Q2019_Q32020,emploi~annee)

#Proportion d'ind en emploi entre les deux trimestres
tabmulti(emploi ~ annee, data = Append_Q2019_Q32020)


#taux d'emploi entre les deux trimestres pour chaque region
region=c(unique(Append_Q2019_Q32020$regio))

for (i in region)
{ data=subset(Append_Q2019_Q32020,Append_Q2019_Q32020$regio==i)

tab=tabmulti(emploi ~  annee , data = data)
print(tab)}
#PUSH OUT GRAPH
#On conserve les taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(6.2,8.0,6.0,7.1,5.7,6.4,8.5,7.2,6.4,9.3,8.1,7.3,9.0,11.2,8.2,7.8,8.7)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ32020 <- data.frame(region, emploi)
emploiQ32020=emploiQ32020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
emploiQ32020$emploi=as.numeric(emploiQ32020$emploi)
#Carte evolution taux d'emploi entre 2019 et 2020Q3 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ32020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "-",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Baisse du taux d'emploi entre Q4 2019 et Q3 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  


#PUSH IN GRAPH

#On conserve les hausse des taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(5.1,6.6,5.7,3.9,4.5,5.2,3.9,5.1,5.6,5.9,6.3,5.7,8.4,3.5,3.8,4.9,3.7)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ32020 <- data.frame(region, emploi)
emploiQ32020=emploiQ32020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
#Carte evolution taux d'emploi entre 2019 et 2020Q3 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ32020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "+",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Hausse du taux d'emploi entre Q4 2019 et Q3 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%hc_colorAxis(minColor = "yellow", maxColor =  "red")%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  


#Regression 
reg3=lm(emploi ~ annee + sexe, data=Append_Q2019_Q32020)
summary(reg3)

#L'effet est non significatif mais plus qu'en Q12020

######## 2020 Q4 vs 2019 Q4 #########

#On ne conserve que les individus présents dans les deux vagues d'enquête
require(dplyr)

df=Append_Q2019_Q42020 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q42020 = merge(Append_Q2019_Q42020, df, by=c("ident","noi"))
Append_Q2019_Q42020=Append_Q2019_Q42020 %>% distinct()
Append_Q2019_Q42020=subset(Append_Q2019_Q42020,Append_Q2019_Q42020$num_dups>1)
dim(Append_Q2019_Q42020)
summary(Append_Q2019_Q42020)

# T-Test emploi by annee

Append_Q2019_Q42020$emploi=as.logical(as.integer(Append_Q2019_Q42020$emploi))

t_test(Append_Q2019_Q42020,emploi~annee)

#Proportion d'ind en emploi entre les deux trimestres
tabmulti(emploi ~ annee, data = Append_Q2019_Q42020)

#taux d'emploi entre les deux trimestres pour chaque region
region=c(unique(Append_Q2019_Q42020$regio))

for (i in region)
{ data=subset(Append_Q2019_Q42020,Append_Q2019_Q42020$regio==i)

tab=tabmulti(emploi ~  annee , data = data)
print(tab)}
#PUSH OUT GRAPH
#On conserve les taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(8.2,5.3,7.9,6.9,5.8,9.2,8.0,9.5,6.5,9.4,8.0,9.2,6.2,14.6,8.7,9.7,11.8)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ42020 <- data.frame(region, emploi)
emploiQ42020=emploiQ42020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
emploiQ42020$emploi=as.numeric(emploiQ42020$emploi)
#Carte evolution taux d'emploi entre 2019 et Q42020 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ42020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "-",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Baisse du taux d'emploi entre Q4 2019 et Q4 2020 ",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  

#PUSH IN GRAPH
#On conserve les hausse des taux d'emploi par région afin de les utiliser pour la carte
emploi <- c(7.8,5.1,7.1,5.0,6.4,4.3,5.2,4.5,6.5,5.7,4.9,6.7,3.2,3.5,5.5,7.5,6.1)
#labellisation des regions
region<-c("NA","ÎD","BF","GE","NO","BR","PA","AR","CO","OC","CV","HD","PD","MQ","GF","LR","GU")

emploiQ42020 <- data.frame(region, emploi)
emploiQ42020=emploiQ42020 %>% 
  rename(
    'hc-a2' = region,
    emploi = emploi
  )
#Carte evolution taux d'emploi entre 2019 et 2020Q4 par région

library('highcharter')
library(dplyr)

data_fr <- download_map_data("countries/fr/fr-all") %>% 
  
  get_data_from_map() %>% 
  # Une valeur aléatoire pour la coloration
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))

# Carte
data_fr=data_fr%>%filter(!name %in% c("Mayotte"))
hcmap("countries/fr/fr-all",
      data = emploiQ42020,
      value = "emploi",
      joinBy = "hc-a2",
      name = "Taux d'emploi",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#FAFAFA", borderWidth = 0.1,
      tooltip = list(valueDecimals = 1, valuePrefix = "+",
                     valueSuffix = " %")) %>% 
  hc_title(
    text = "Hausse du taux d'emploi entre Q4 2019 et Q4 2020",
    margin = 20,
    align = "left",
    style = list(color = "blue", useHTML = TRUE)
  )%>%hc_colorAxis(minColor = "yellow", maxColor =  "red")%>%
  hc_legend(align = "left",
            verticalAlign = "top",
            layout = "vertical",x=0,y=100,
            
            title="Taux d'emploi")%>%
  
  hc_mapNavigation(enabled = TRUE,enableMouseWheelZoom = TRUE)  






#Regression 
reg4=lm(emploi ~ annee + sexe, data=Append_Q2019_Q42020)
summary(reg4)

#Effet encore moins significatif que Q32020
###############################2021 vs 2019Q4#######################

Q42019 = subset( Q42019, select = c("emploi", "ident","noi","annee","sexe",'age3b',"trim","statut","chpub","nafentg010n"))

#Q32021=subset( Q32021, select = c("emploi", "ident","noi","annee","sexe",'age3b',"trim",'statut',"chpub","nafentg010n"))
#Append_Q2019_Q32021=rbind(Q42019,Q32021)

Q22021=subset( Q22021, select = c("emploi", "ident","noi","annee","sexe",'age3b',"trim",'statut',"chpub","nafentg010n"))
Append_Q2019_Q22021=rbind(Q42019,Q22021)

Q12021=subset( Q12021, select = c("emploi", "ident","noi","annee","sexe",'age3b',"trim",'statut',"chpub","nafentg010n"))
Append_Q2019_Q12021=rbind(Q42019,Q12021)

####### 2021 Q3 vs 2019 Q4 #####
require(dplyr)

df=Append_Q2019_Q32021 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q32021 = merge(Append_Q2019_Q32021, df, by=c("ident","noi"))
Append_Q2019_Q32021=Append_Q2019_Q32021 %>% distinct()
Append_Q2019_Q32021=subset(Append_Q2019_Q32021,Append_Q2019_Q32021$num_dups>1)
dim(Append_Q2019_Q32021)
summary(Append_Q2019_Q32021)

# T-Test emploi by annee
library(rstatix)
Append_Q2019_Q32021$emploi=as.logical(as.integer(Append_Q2019_Q32021$emploi))

t_test(Append_Q2019_Q32021,emploi~annee) #nbre d'observations insuffisantes


#Regression 
reg5=lm(emploi ~ annee + sexe, data=Append_Q2019_Q32021)
summary(reg5)

####### 2021 Q1 vs 2019 Q4 #####

require(dplyr)

df=Append_Q2019_Q12021 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q12021 = merge(Append_Q2019_Q12021, df, by=c("ident","noi"))
Append_Q2019_Q12021=Append_Q2019_Q12021 %>% distinct()
Append_Q2019_Q12021=subset(Append_Q2019_Q12021,Append_Q2019_Q12021$num_dups>1)
dim(Append_Q2019_Q12021)
summary(Append_Q2019_Q12021)

# T-Test emploi by annee
library(rstatix)
Append_Q2019_Q12021$emploi=as.logical(as.integer(Append_Q2019_Q12021$emploi))

t_test(Append_Q2019_Q12021,emploi~annee)



#Regression 
reg5=lm(emploi ~ annee + sexe, data=Append_Q2019_Q12021)
summary(reg5)

#pas significatif
#En ne conservant que les independants
ind=subset(Append_Q2019_Q12021,Append_Q2019_Q12021$statut=="1")
ind$emploi=as.logical(as.integer(ind$emploi))

regind=lm(emploi ~ annee + sexe, data=ind)
summary(regind) #la pvalue a diminué mais ca reste non significatif meme pour les independants


####### 2021 Q2 vs 2019 Q4 #####

require(dplyr)

df=Append_Q2019_Q22021 %>% 
  group_by(ident, noi) %>% 
  mutate(num_dups = n(), 
         dup_id = row_number()) 
df = subset( df, select = c( "ident","noi",'num_dups'))
Append_Q2019_Q22021 = merge(Append_Q2019_Q22021, df, by=c("ident","noi"))
Append_Q2019_Q22021=Append_Q2019_Q22021 %>% distinct()
Append_Q2019_Q22021=subset(Append_Q2019_Q22021,Append_Q2019_Q22021$num_dups>1)
dim(Append_Q2019_Q22021)
summary(Append_Q2019_Q22021)

# T-Test emploi by annee
library(rstatix)
Append_Q2019_Q22021$emploi=as.logical(as.integer(Append_Q2019_Q22021$emploi))

t_test(Append_Q2019_Q22021,emploi~annee) #nbre d'obs insuffisant



#Regression 

reg6=lm(emploi ~ annee + sexe, data=Append_Q2019_Q22021)
summary(reg6)



#En ne conservant que les independants
ind=subset(Append_Q2019_Q22021,Append_Q2019_Q22021$statut=="1")
ind$emploi=as.logical(as.integer(ind$emploi))

t_test(ind,emploi~annee) #nbre d'obs insuffisant

regind=lm(emploi ~ annee + sexe, data=ind)
summary(regind)



### a faire :  comparer les 2021  Q1 Q2 et les 2020 Q2 Q3 Q4 a son annee de reference 

#reg=emploi age age^2 X(controle)
#nafentg010n pour le secteur


