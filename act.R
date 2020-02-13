# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 2/11/20
library(tidyverse)
options(digits = 3)

set.seed(16, sample.kind = "Rounding")


K = 10000

act_scores <- replicate(K, {
  act <- rnorm(1:36, 20.9, 5.7)
  #max(act)
})

names(act_scores)

mean(act_scores)
sd(act_scores)

nrow(act_scores >= 36)
sum(act_scores >= 36)


set.seed(16, sample.kind = "Rounding")
act_scores <- rnorm(10000, 20.9, 5.7)
mean(act_scores)

set.seed(16, sample.kind = "Rounding")

act_scores <- rnorm(10000, 20.9, 5.7)
sd(act_scores)


sum(act_scores >= 36)

mean(act_scores > 30)

mean(act_scores <= 10)

x <- 1:36
data.frame(x, f_x = dnorm(x, 20.9, 5.7)) %>% ggplot(aes(x, f_x)) + geom_line()

zscore <- scale(act_scores)
sum(ifelse(zscore >= 2, 1, 0)) / length(zscore)

sum(ifelse(zscore >= 2, 1, 0)) / length(zscore)


z_scores <- (act_scores + mean(act_scores)) / sd(act_scores)

z_scores <- (act_scores - mean(act_scores)) / sd(act_scores)


c <- mean(z_scores < 2)

qnorm(c, 20.9, 5.7)

2 * sd(act_scores) + mean(act_scores)

2 * sd(act_scores) + mean(act_scores)

qnorm(0.975, 20.9, 5.7)


max(pnorm(zscore, 20.9, 5.7))


act_scores
F <- function(a) mean(act_scores <= 0.95)

30 / 0.95


FREQ <- seq(1:36)


act_cores <- sapply(1:36, function(x){
  mean(act_scores <= x)
})

min(which(act_cores >= 0.95))


ccc <- sapply(FREQ, function(x) {
  pnorm(x, 20.9, 5.7)
})

min(which(ccc >= 0.95))

qnorm(0.95, 20.9, 5.7)

p <- seq(0.01, 0.99, 0.01)
sample_quantiles  <- quantile(act_scores, p)
min(which(sample_quantiles >= 26))


p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores, p)
theoretical_quantiles <- qnorm(p, 20.9, 5.7)
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()