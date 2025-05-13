#picking variable through picked lambda lasso
library(tidyverse)

coef(cv.lasso, s = "lambda.1se")
select.ind_lasso <-  which(abs(coef(cv.lasso, s = "lambda.1se")) !=0)
select.ind_lasso <-  select.ind_lasso[-1]  # ignore interval
select.ind_lasso 
select.varialbes_lasso = colnames(train)[select.ind_lasso]
select.varialbes_lasso
america_lasso_rg <- glm(log_vix_adj_close ~  new_cases_smoothed +new_deaths_smoothed + reproduction_rate + new_tests_smoothed +tests_per_case +people_vaccinated 
                        +people_fully_vaccinated + new_vaccinations_smoothed +stringency_index+ death_rate + 
                          +factor(new_york_lockdown) + factor(California_lockdown) 
                        +factor(China_factory_shutdown) + factor(federal_rate_cut)
                        ,data = america_covid_variable)
rm_var3 <- "factor(California_lockdown)"
america_lasso_rg  <- update(america_lasso_rg , paste0(".~. - ", rm_var3))



summary(america_lasso_rg)
library(car)
a <- vif(america_lasso_rg)
a
library(broom)
plot(density(america_lasso_rg$residuals))
#picking variable through picked lambda ridge
coef(cv.ridge, s = "lambda.min")
select.ind_ridge <-  which(abs(coef(cv.lasso, s = "lambda.min")) !=0)
select.ind_ridge <- select.ind_ridge[-1] # ignore interval
select.ind_ridge
select.varialbes_ridge = colnames(train)[select.ind_ridge]
select.varialbes_ridge

america_ridge_rg <- lm(vix$Adj.Close ~ ., america_covid_variable[, c(select.varialbes_ridge)])
summary(america_ridge_rg)
