# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 2/16/20


options(digits = 3)

p <- 5/38
a <- 6
b <- -1
n <- 500


mu <- a * p + b*(1 - p)

sigma <- abs(b - a) * sqrt(p * (1-p))

#Expected Value
mu

#Calculate Standard Error
se <-  sigma/sqrt(n)

#Expected Value
expected_value <- n * mu

#Standard of Error
standard_error <- se * n

pnorm(0, expected_value, standard_error)


