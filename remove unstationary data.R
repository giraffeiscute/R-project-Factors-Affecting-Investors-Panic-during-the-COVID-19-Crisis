library(tidyverse)
library(ggplot2)
library(patchwork)
usa_summary_data <- summary_data %>% filter(location == 'United States') 

Cor <- cor(usa_summary_data$total_deaths[220:581],usa_summary_data$total_vaccinations[220:581])
cat('累計資料相關係數為',Cor)
usa_total_deaths <- usa_summary_data %>% ggplot(aes(x = 1:581)) + geom_line(aes(y = total_deaths),color = "blue") + 
                                                                labs(x = "index") + theme_bw()
usa_total_vaccinations <- usa_summary_data %>% ggplot(aes(x = 1:581)) + geom_line(aes(y = total_vaccinations),color = "red")+ 
  labs(x = "index") + theme_bw()
(usa_total_deaths|usa_total_vaccinations) 

Cor <- cor(usa_summary_data$new_deaths[220:581],usa_summary_data$new_vaccinations[220:581])
cat('差分處理後的相關係數為',Cor)
usa_new_deaths <- usa_summary_data %>% ggplot(aes(x = 1:581)) + geom_line(aes(y = new_deaths),color = "black") + 
  labs(x = "index")+
  geom_vline(xintercept = 250,size = 1,color ="red")+
  geom_vline(xintercept = 350,size = 1,color ="red")+
  theme_bw()
usa_new_vaccination <- usa_summary_data %>% ggplot(aes(x = 1:581)) + geom_line(aes(y = new_vaccinations),color = "black") + 
  labs(x = "index")+ 
  geom_vline(xintercept = 250,size = 1,color ="red")+
  geom_vline(xintercept = 350,size = 1,color ="red")+ 
  theme_bw()
(usa_new_deaths|usa_new_vaccination)

