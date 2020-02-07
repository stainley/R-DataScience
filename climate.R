# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 2/6/20

# Title     : TODO
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/6/2020


library(tidyverse)
library(dslabs)
data(temp_carbon)
data(greenhouse_gases)
data(historic_co2)

names(greenhouse_gases)

greenhouse_gases %>% ggplot(aes(x = year, y = concentration)) +
  geom_line() +
  facet_grid(gas ~ . , scales = "free") +
  geom_vline(xintercept = 1850)
  ylab("Concentration (ch4/n2o ppb, co2 ppm") +
  ggtitle("Atmospheric greenhouse gas concentration by year,0-2000")