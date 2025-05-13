#evaluate
ridge.test = predict(ridge, 
                     s = best.lambda_ridge, 
                     newx = as.matrix(test[, -1]))
SSE_ridge <- mean((exp(test$log_vix_adj_close) - exp(ridge.test))^2)
SST <- mean((exp(test$log_vix_adj_close) - exp(mean(test$log_vix_adj_close)))^2)
R_square_ridge <- 1 - SSE_ridge/SST
R_square_ridge

lasso.test = predict(lasso, 
                     s = best.lambda_lasso, 
                     newx = as.matrix(test[, -1]))
SSE_lasso <- mean((exp(test$log_vix_adj_close) - exp(lasso.test))^2)
SST <- mean((exp(test$log_vix_adj_close) - exp(mean(test$log_vix_adj_close)))^2)
R_square_lasso <- 1 - SSE_lasso/SST
R_square_lasso



