# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 2/11/20
library(tidyverse)
options(digits = 4)
#set.seed(16)
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

2*sd(act_scores) + mean(act_scores)

2*sd(act_scores) + mean(act_scores)

qnorm(0.975, 20.9, 5.7)

sum(z_scores > c)



max(pnorm(zscore, 20.9, 5.7))