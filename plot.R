plot(x = america_covid_variable$new_cases,y = america_covid_variable$log_vix_adj_close)
plot(x = log(america_covid_variable$new_cases_smoothed),y = america_covid_variable$log_vix_adj_close)
plot(x = log(america_covid_variable$new_deaths_smoothed),y = america_covid_variable$log_vix_adj_close)
plot(x = log(america_covid_variable$total_deaths),y = america_covid_variable$log_vix_adj_close)
plot(x = america_covid_variable$reproduction_rate,y = america_covid_variable$log_vix_adj_close)
qqnorm(america_covid_variable$log_vix_adj_close)
qqline(america_covid_variable$log_vix_adj_close)


plot1 <- function(v1){
  plot(x = v1,y = america_covid_variable$log_vix_adj_close)
  regr_heavy <- lm(america_covid_variable$log_vix_adj_close~v1)
  abline(regr_heavy, col=2, lwd=2)
}
plot1(log(america_covid_variable$federal_rate_cut))
plot1(america_covid_variable$death_rate)
