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

stars %>% ggplot(aes(x=temp, y=magnitude, color=temp)) + geom_point()

stars %>% ggplot(aes(x=log10(temp), y=magnitude, color=temp)) + geom_point() + scale_y_reverse() + scale_x_reverse()


stars %>% filter(type=="G") %>% ggplot(aes(x=log10(temp), y=magnitude, color=temp)) + geom_point() + scale_y_reverse() + scale_x_reverse()


stars %>%  ggplot(aes(x=log10(temp), y=magnitude, color=type)) + geom_point(size=3) + scale_y_reverse() + scale_x_reverse()