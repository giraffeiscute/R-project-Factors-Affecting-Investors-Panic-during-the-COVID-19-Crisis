china_summary_data <- target_contry(data = world_summary, place = 'China')
china_summary_data <- china_summary_data %>% mutate(log_vix_adj_close = log(vix$Adj.Close),
                                                    .before= "location")
china_covid_variable <- china_summary_data %>% select(where(~is.numeric(.x)))

#scale
china_covid_variable <- china_covid_variable %>% scale %>% as.data.frame()

china_usa_covid_variable <- america_covid_variable %>% mutate(china_new_cases_smoothed = china_covid_variable$new_cases_smoothed,
                                                              china_new_deaths_smoothed = china_covid_variable$new_deaths_smoothed,
                                                              china_reproduction_rate = china_covid_variable$reproduction_rate,
                                                              china_new_tests_smoothed = china_covid_variable$new_tests_smoothed,
                                                              china_positive_rate = china_covid_variable$positive_rate,
                                                              china_tests_per_case = china_covid_variable$tests_per_case,
                                                              china_people_vaccinated = china_covid_variable$people_vaccinated,
                                                              china_people_fully_vaccinated = china_covid_variable$people_fully_vaccinated,
                                                              china_new_vaccinations_smoothed = china_covid_variable$new_vaccinations_smoothed,
                                                              china_stringency_index = china_covid_variable$stringency_index,
                                                              china_death_rate = china_covid_variable$death_rate
                                                          )

library(glmnet)

set.seed(22)
train.index = sample(x=1:nrow(china_usa_covid_variable),
                     size=ceiling(0.8*nrow(china_usa_covid_variable)))

train = china_usa_covid_variable[train.index, ]
test = china_usa_covid_variable[-train.index, ]

ridge = glmnet(x = as.matrix(train[, -1]), 
               y = train[, 1], 
               alpha = 0,
               family = "gaussian")

lasso = glmnet(x = as.matrix(train[, -1]), 
               y = train[, 1], 
               alpha = 1,
               family = "gaussian")

par(mfcol = c(1, 2))
plot(lasso, xvar='lambda', main="Lasso")
plot(ridge, xvar='lambda', main="Ridge")

#picking lambda lasso 
cv.lasso = cv.glmnet(x = as.matrix(train[, -1]), 
                     y = train[, 1], 
                     alpha = 1,  # lasso
                     family = "gaussian")
par(mfcol = c(1, 2))
plot(cv.lasso)
best.lambda_lasso = cv.lasso$lambda.1se
best.lambda_lasso

#picking lambda ridge 
cv.ridge = cv.glmnet(x = as.matrix(train[, -1]), 
                     y = train[, 1], 
                     alpha = 0,  # ridge
                     family = "gaussian")

plot(cv.ridge)
best.lambda_ridge = cv.ridge$lambda.1se
best.lambda_ridge
par(mfcol = c(1, 2))
plot(lasso, xvar='lambda', main="Lasso")
abline(v=log(best.lambda_lasso), col="blue", lty=5.5 )
plot(ridge, xvar='lambda', main="Ridge")
abline(v=log(best.lambda_ridge), col="blue", lty=5.5 )

####################################
coef(cv.lasso, s = "lambda.1se")
select.ind_lasso <-  which(abs(coef(cv.lasso, s = "lambda.1se")) != 0)
select.ind_lasso <-  select.ind_lasso[-1]  # ignore interval
select.ind_lasso 
select.varialbes_lasso = colnames(train)[select.ind_lasso]
select.varialbes_lasso

####################################

lasso.test = predict(lasso, 
                     s = best.lambda_lasso, 
                     newx = as.matrix(test[, -1]))
SSE <- mean((exp(test$log_vix_adj_close) - exp(lasso.test))^2)
SST <- mean((exp(test$log_vix_adj_close) - exp(mean(test$log_vix_adj_close)))^2)
R_square <- 1 - SSE/SST
R_square




