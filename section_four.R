# Title     : TODO
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/1/20

library(dslabs)
data(heights)
options(digits=3)

x <- vector()

x <- ifelse(heights$sex == "Female", 1, 2)

sum(x)

x <- ifelse(heights$height > 72, heights$height, 0)

mean(x)

inches_to_ft <- function (x) {
  s <- (x / 12)
  s
}

inches_to_ft(144)


x <- ifelse(inches_to_ft(heights$height) < 5, 1, 0)

sum(x)


any(TRUE, TRUE, TRUE)
any(TRUE, TRUE, FALSE)
any(TRUE, FALSE, FALSE)
any(FALSE, FALSE, FALSE)
all(TRUE, TRUE, TRUE)
all(TRUE, TRUE, FALSE)
all(TRUE, FALSE, FALSE)
all(FALSE, FALSE, FALSE)


# define a vector of length m
m <- 10
f_n <- vector(length = m)

# make a vector of factorials
for(n in 1:m){
f_n[n] <- factorial(n)
}

# inspect f_n
f_n


library(dslabs)
data(heights)
options(digits = 3)

summary(heights$height)

p <- seq(0.01,0.99, 0.01)
percentiles <- quantile(heights$height, p)

percentiles[names(percentiles) == "25%"]
percentiles[names(percentiles) == "75%"]

pnorm(-1.96)
qnorm(0.025)

pnorm(qnorm(0.025))

p <- seq(0.01, 0.99, 0.01)
theoretical_quantiles <- qnorm(p, 69, 3)

library(dslabs)
data(murders)

library(tidyverse)

p <- ggplot(murders)