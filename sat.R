# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 2/16/20

options(digits = 3)
library(tidyverse)

#1
1 / 5


e <- (1 * 1 / 5) + (-0.25 * (1 - 1 / 5))

se <- (1 - -0.25) * sqrt(0.2 * 0.8)
44 * e

sde <- sqrt(44) * se

#Central Limit Theorem
# 8 Points, Mean = 0, SD = 3.32
1 - pnorm(8, 0, sde)

set.seed(21, sample.kind = "Rounding")

B <- 10000
n <- 44
#P <- 0.2
mc <- replicate(B, {
  s <- sample(c(1, -0.25), n, replace = TRUE, prob = c(0.2, 0.8))
  sum(s)
})


guessing_8 <- mean(mc > 8)

# 2a
1 / 4

e <- 44 * (1 * 1 / 4) + (0 * 0.75)

p <- seq(0.25, 0.95, 0.05)



