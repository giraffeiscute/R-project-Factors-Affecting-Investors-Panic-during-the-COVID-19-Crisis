set.seed(20210522)
my_control <-trainControl(method="cv", number=5)  #use cross validation as controller
lassoGrid <- expand.grid(alpha = 1, lambda = seq(0.001,0.1,by = 0.0005))
lasso_mod <- train(x=train[, -1], y=train[, 1], method='glmnet', trControl= my_control, tuneGrid=lassoGrid) 
a <- lasso_mod$bestTune 