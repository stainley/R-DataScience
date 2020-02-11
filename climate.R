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
names(temp_carbon)

greenhouse_gases %>% ggplot(aes(x = year, y = concentration)) +
  geom_line() +
  facet_grid(gas ~ ., scales = "free") +
  geom_vline(xintercept = 1850)
ylab("Concentration (ch4/n2o ppb, co2 ppm") +
  ggtitle("Atmospheric greenhouse gas concentration by year,0-2000")


temp_carbon %>% ggplot(aes(x = year, y = carbon_emissions, color = year)) +
  geom_line(na.rm = TRUE) +
  geom_vline(xintercept = 1960, show.legend = year)


names(historic_co2)

co2_time <- historic_co2 %>% ggplot(aes(x = year, y = co2, color = source)) +
  geom_line() +
  ggtitle("Atmospheric CO2 concentration, -800,000 BC to today") +
  geom_hline(yintercept = 200) +
  ylab("co2 (ppmv)")

co2_time + xlim(-3000,  2018)