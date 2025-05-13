library(tidyverse)
summary_data <- read.csv('owid-covid-data.csv')
vix <- read.csv('vix.csv')

summary_data <- summary_data %>% filter(date %in% vix$Date) #挑出美股有開市的日期
summary_data %>% glimpse

#pick the data with no replicated and the number of NAN is acceptable
world_summary_cleaned <- summary_data %>% transmute(location,
                                                    continent,
                                                    date,
                                                    new_cases_smoothed,
                                                    new_deaths_smoothed,
                                                    reproduction_rate,  
                                                    new_tests_smoothed,
                                                    positive_rate,
                                                    tests_per_case,
                                                    people_vaccinated,
                                                    people_fully_vaccinated,
                                                    new_vaccinations_smoothed,
                                                    total_deaths,
                                                    total_cases,
                                                    stringency_index,
                                                    population,
                                                    population_density,
)



time_line <- function(start,end,data){
  cut(as.Date(data$date),c(as.Date('2020-01-01'),as.Date(start),as.Date(end),as.Date('2022-07-05')),c(0,1,0))
}
c_time_line <- function(start1,end1,start2,end2,data){
  cut(as.Date(data$date),c(as.Date('2020-01-01'),as.Date(start1),as.Date(end1),as.Date(start2),as.Date(end2),as.Date('2022-07-05')),c(0,1,0,1,0))
}

#input statistic and policy
world_summary_cleaned_policy <- world_summary_cleaned %>% mutate(death_rate = total_deaths/total_cases,
                                                           new_york_lockdown = time_line(start = '2020-03-22', end = '2020-05-15', world_summary_cleaned),
                                                           California_lockdown = time_line(start = '2020-03-19', end = '2020-05-17', world_summary_cleaned),
                                                           China_factory_shutdown = c_time_line(start1 = '2020-01-18', end1 = '2020-02-14', start2 = '2022-03-28',end2 = '2022-06-01', world_summary_cleaned),
                                                           federal_rate_cut = time_line(start = '2020-03-15', end = '2020-05-07', world_summary_cleaned))

world_summary_cleaned_policy[is.na(world_summary_cleaned_policy)] <- 0
world_summary_cleaned_policy %>% as_tibble

