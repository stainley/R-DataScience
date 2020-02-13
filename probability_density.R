# Title     : TODO
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/11/2020

library(tidyverse)

x <- seq(-4, 4, length=100)
data.frame(x, f = dnorm(x)) %>% ggplot(aes(x, f)) + geom_line()
#dnorm(z, mu, sigma)

pnorm(60, mean(64), sd(3))