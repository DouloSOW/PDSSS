#rm(list=ls(all=TRUE))
  #edit(GenericML)

library(haven)
library(VIM)
library(doParallel)
library(snow)
path <- "C:/Users/doulo/Dropbox (Personal)/PDSSS/Data/append/"

datatouse<-read_stata(paste0(path,"1_forGML.dta"))

library(dplyr)
# install (if applicable) and load relevant packages
required_packages <- c("ranger", "glmnet", "e1071", "xgboost", "GenericML", "devtools")
missing <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if(length(missing) > 0L) install.packages(missing) 

# install version 0.2.3 which is not yet on CRAN
# devtools::install_github("mwelz/GenericML")
library("GenericML")

# load data
data <- datatouse
data <- data %>%mutate(sexe = ifelse(sexe==2,0,1))
data$emploi <- factor(data$emploi, labels = c("Non", "Oui"), levels = c("0","1"))
                                                            #FUN = function(x) as.numeric(x), MARGIN = 2) 
data<-data%>% select(!starts_with("activite_econo"))%>%
                        select(!starts_with("statut"))%>%
                        select(-c( "Nobs", "noi", 'Append194_202'))

aggr(data, col=c('blue','tomato'), numbers=TRUE, sortVars=FALSE, sortCombs=TRUE, combined=TRUE, only.miss= TRUE, labels=names(data), cex.axis=.6, prop = FALSE, ylab = "Pattern of missing data")
data = data[complete.cases(data),]

#data = data[sample(nrow(data), 50000),]
# specify learners
learners <-
  c("random_forest",
    "mlr3::lrn('cv_glmnet', s = 'lambda.min', alpha = 0.5)",
    "mlr3::lrn('svm')",
    "mlr3::lrn('xgboost')")

cluster <- as.vector(as.numeric(data$ident))

# include BCA and CATE controls
# add fixed effects along variable "vil_pair"
X1 <- setup_X1(funs_Z = c("B", "S")#,
               #fixed_effects = cluster
               )
#D <-  as.vector(as.numeric(data$annee))
D <-  as.vector(as.numeric(data$annee))
Y <- as.vector(as.numeric(data$emploi))

Z <- as.matrix(data %>% 
                 select(-c("emploi","annee","ident"))
                )


# calls functions from the "sandwich" package
# cluster standard errors along "demi_paire"
vcov <- setup_vcov(estimator = "vcovCL",
                   arguments = list(cluster = cluster)
                   )

# consider differences between group K (most affected) with groups 1, 2, and 3, respectively.
diff_GATES <- setup_diff(subtract_from = "most",
                         subtracted = 1:2)
diff_CLAN  <- setup_diff(subtract_from = "most",
                         subtracted = 1:2)

# run GenericML()

genML4 <- GenericML(
  Z = Z, D = D, Y = Y,                      # observed data
  learners_GenericML = learners,            # learners
  learner_propensity_score = "constant",    # = 0.5 (RCT)
  num_splits = 2L,                        # number splits
  #quantile_cutoffs = c(0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8), # grouping
  quantile_cutoffs = c(0.25, 0.5, 0.75),
  significance_level = 0.05,                # significance level
  X1_BLP = X1, X1_GATES = X1,               # regression setup
  diff_CLAN = diff_CLAN,
  diff_GATES = diff_GATES,
  vcov_BLP = vcov, vcov_GATES = vcov,       # covariance setup
  parallel = TRUE, num_cores = detectCores(),          # parallelization
  seed = 1234)                          #  seed

# BLP
results_BLP <- get_BLP(genML4, plot = TRUE)
results_BLP       # print method
plot(results_BLP) # plot method

# GATES
results_GATES <- get_GATES(genML4, plot = TRUE)
results_GATES
plot(results_GATES)

# CLAN
results_CLAN <- get_CLAN(genML4, variable = "nbenfa3", plot = TRUE)
results_CLAN
plot(results_CLAN)

genML4$VEIN$best_learners$CLAN
# best learners
get_best(genML4)

