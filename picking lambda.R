library(tidyverse)

target_contry <- function(data, place){
  subset(data,data$location == place)
}

world_summary_ <- read.csv('world_summary_cleaned_policy.csv')
world_summary <- world_summary_[,-c(13,14,16,17)] #delete the data with total and population
vix <- read.csv('vix.csv')

america_summary_data <- target_contry(data = world_summary, place = 'United States')
america_summary_data <- america_summary_data %>% mutate(log_vix_adj_close = log(vix$Adj.Close),
                      .before= "location")

#pick the numeric variable
covid_variable <- world_summary %>% select(where(~is.numeric(.x)))
america_covid_variable <- america_summary_data %>% select(where(~is.numeric(.x)))

#scale ############
covid_variable <- covid_variable %>% scale %>% as.data.frame()
america_covid_variable <- america_covid_variable %>% scale %>% as.data.frame()
china_covid_variable <- china_covid_variable %>% scale %>% as.data.frame()

library(glmnet)

set.seed(22)
train.index = sample(x=1:nrow(america_covid_variable),
                     size=ceiling(0.8*nrow(america_covid_variable)))

train = america_covid_variable[train.index, ]
test = america_covid_variable[-train.index, ]

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

#picking lambda lasso (by min MSE)
cv.lasso = cv.glmnet(x = as.matrix(train[, -1]), 
                     y = train[, 1], 
                     alpha = 1,  # lasso
                     family = "gaussian")

par(mfcol = c(1, 2))
plot(cv.lasso)
best.lambda_lasso = cv.lasso$lambda.1se
best.lambda_lasso

#picking lambda ridge (by min MSE)
cv.ridge = cv.glmnet(x = as.matrix(train[, -1]), 
                     y = train[, 1], 
                     alpha = 0,  # ridge
                     family = "gaussian")

plot(cv.ridge)
best.lambda_ridge = cv.ridge$lambda.min
best.lambda_ridge
par(mfcol = c(1, 2))
plot(lasso, xvar='lambda', main="Lasso")
abline(v=log(best.lambda_lasso), col="blue", lty=5.5 )
plot(ridge, xvar='lambda', main="Ridge")
abline(v=log(best.lambda_ridge), col="blue", lty=5.5 )


