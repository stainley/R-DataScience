# Title     : Stars Exercises
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/5/2020

library(tidyverse)
library(dslabs)
data(stars)
options(digits = 3)   # report 3 significant digits

names(stars)
class("magnitude")
mean(stars$magnitude)
sd(stars$magnitude)

stars %>% ggplot(aes(magnitude)) + geom_density()

stars %>% ggplot(aes(temp)) + geom_density()

stars %>% ggplot(aes(x=temp, y=magnitude)) + geom_point()