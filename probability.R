# Title     : TODO
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/10/2020

library(gtools)
library(tidyverse)
options(digits = 3)


# 1a
medals <- permutations(8, 3)
nrow(medals)

# 1b
medals <- permutations(3, 3)
nrow(medals)

# 1c
jamaica <- c('usain', 'yohan', 'warren')
other_countries <- paste('c', as.character(1:5))
countries <- c(jamaica, other_countries)

places <- permutations(8, 3, v=countries)
table(places)
class(places)

first_place <- places[,1]
second_place <- places[,2]
third_place <- places[,3]

mean(first_place %in% jamaica & second_place %in% jamaica & third_place %in% jamaica)


# 1d
runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")
set.seed(1)

simulation <- replicate(10000, {
  winners <- sample(runners, 3)
  sum(winners == 'Jamaica') == 3
})

mean(simulation)

# 2a
# 6 options, 2 options,
#s 1 entree, 2 sides, and 1 drink
#1 entree from a list of 6 options, a choice of 2 different sides from a list of 6 options,
# and a choice of 1 drink from a list of 2 options.
6 * nrow(combinations(6, 2)) * 2
6 * nrow(combinations(6, 2)) * 3
d <- 6 * nrow(combinations(6, 3)) * 3

# 2d
dishes <- function (entree) {
  entree * nrow(combinations(6, 2)) * 3
}

data <- sapply(1:12, dishes)
df <- data.frame(entry=1:12, combo=data)
df %>% filter(combo > 365) %>% min(.$entry)

# 2e
side <- function (side) {
  6 * nrow(combinations(side, 2)) * 3
}

dt <- sapply(2:12, side)
df <- data.frame(entry=2:12, combo=dt)
df %>% filter(combo > 365) %>% min(.$entry)