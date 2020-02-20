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
p <- death_prob %>%
  filter(age == '50' & sex == 'Male') %>%
  pull(prob)
n <- 1000
a <- -150000
ns <- 700000

#Expected value of the sum of n draws of a random variable:
#b <- (nS/n - a * p) / (1 - p)
b <- (ns / n - a * p) / (1 - p)

# √n * ∣b–a∣ √p(1−p)
sigma_sum <- sqrt(n) * abs(b - a) * sqrt(p * (1 - p))

mu <- a * p + b * (1 - p)
# Expected Value
e <- n * mu

central_limit_theorem <- pnorm(0, e, sigma_sum)

#3
p <- .015    # probability of claim
a <- -150000    # loss per claim
b <- 1150    # premium - profit when no claim
n <- 1000

e <- n * (a * p + b * (1 - p))


sigma <- abs(b - a) * sqrt(p * (1 - p))
# Standard of Error
se <- sqrt(n) * sigma

# Probability Loosing money
pnorm(0, e, se)

pnorm(-1000000, exp_val, se)

p <- seq(.01, .03, .001)

#3e

loose_money <- sapply(p, function(p) {
  e <- n * (a * p + b * (1 - p))
  se <- sqrt(n) * abs(b - a) * sqrt(p * (1 - p))
  pnorm(0, e, se)
})


d <- data.frame(p = p, p_loose = loose_money) %>%
  filter(p_loose > 0.9) %>%
  pull(p) %>%
  min()


p <- seq(.01, .03, .0025)

loose_1KK <- sapply(p, function(p) {
  e <- n * (a * p + b * (1 - p))
  se <- sqrt(n) * abs(b - a) * sqrt(p * (1 - p))
  pnorm(-1000000, e, se)
})


d <- data.frame(p = p, p_loose = loose_1KK) %>%
  filter(p_loose > 0.9) %>%
  pull(p) %>%
  min()

# 4a

set.seed(25, sample.kind = "Rounding")

loss <- -150000
p_loss <- .015
profit <- 1150
n <- 1000

result <- sample(c(loss, profit), n, replace = TRUE, prob = c( p_loss, (1 - p_loss)))
sum(result)/10^6


set.seed(27, sample.kind = "Rounding")
set.seed(27)

B <- 10000

S <- replicate(B, {
  result <- sample(c(loss, profit), n, replace = TRUE, prob = c(p_loss, (1- p_loss)))
  sum(result)

})


mean(S < -10^6)