# Title     : TODO
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/19/2020

options(digits = 3)
library(tidyverse)
library(dslabs)

data(death_prob)
head(death_prob)

# 1
p <- death_prob %>%
  filter(age == '50' & sex == 'Female') %>%
  pull(prob)

a <- -150000
b <- 1150
n <- 1000

# Expected Value
mu <- a * p + b * (1 - p)

# Standard Error
sigma <- abs(b - a) * sqrt(p * (1 - p))

# Expected Value
e <- n * mu

#Standard Error
se <- sqrt(n) * sigma

# Central Limit Theorem
pnorm(0, n * mu, sqrt(n) * sigma)
pnorm(0, e, se)


# 2
p <- death_prob %>% filter(age == '50' & sex == 'Male') %>% pull(prob)
n <- 1000
a <- -150000
ns <- 700000

#Expected value of the sum of n draws of a random variable:
#b <- (nS/n - a * p) / (1 - p)
b <- (ns/n - a * p) / (1 - p)

# √n * ∣b–a∣ √p(1−p)
sigma_sum <- sqrt(n) * abs(b - a) * sqrt(p * (1 - p))

mu <- a * p + b * (1 - p)
# Expected Value
e <- n * mu

central_limit_theorem <- pnorm(0, e, sigma_sum)

#3
