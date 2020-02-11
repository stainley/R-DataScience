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
# Created by: slebron
# Created on: 2/7/20


beads <- rep(c("red", "blue"), times = c(2,3))
beads
sample(beads, 1)  # Sample 1 bead at random


dice <- sample(1:6)


B <- 10000
events <- replicate(B, sample(beads, 1))
tab <- table(events)
tab
prop.table(tab)


set.seed(1)
set.seed(1, sample.kind = "Rounding")

mean(beads == "blue")

numebr <- "Three"
suit <- "Hearts"

paste(numebr, suit)


paste(letters[1:5], as.character(1:5))

expand.grid(pants = c("blue", "black"), shirt= c("white", "gray", "plaid"))


suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
deck <- paste(deck$number, deck$suit)

# probability of drawing a king
kings <- paste("King", suits)
mean(deck %in% kings)



library(gtools)
permutations(5,2)    # ways to choose 2 numbers in order from 1:5
all_phone_numbers <- permutations(10, 7, v = 0:9)
n <- nrow(all_phone_numbers)
index <- sample(n, 5)
all_phone_numbers[index,]

permutations(3,2)    # order matters
combinations(3,2)    # order does not matter


hands <- permutations(52,2, v = deck)
first_card <- hands[,1]
second_card <- hands[,2]
sum(first_card %in% kings)

sum(first_card %in% kings & second_card %in% kings) / sum(first_card %in% kings)




aces <- paste("Ace", suits)
facecard <- c("King", "Queen", "Jack", "Ten")
facecard <- expand.grid(number = facecard, suit = suits)
facecard <- paste(facecard$number, facecard$suit)

hands <- combinations(52, 2, v=deck) # all possible hands

# probability of a natural 21 given that the ace is listed first in `combinations`
mean(hands[,1] %in% aces & hands[,2] %in% facecard)

# probability of a natural 21 checking for both ace first and ace second
mean((hands[,1] %in% aces & hands[,2] %in% facecard)|(hands[,2] %in% aces & hands[,1] %in% facecard))


# code for one hand of blackjack
hand <- sample(deck, 2)
hand

# code for B=10,000 hands of blackjack
B <- 10000
results <- replicate(B, {
    hand <- sample(deck, 2)
    (hand[1] %in% aces & hand[2] %in% facecard) | (hand[2] %in% aces & hand[1] %in% facecard)
})
mean(results)




# checking for duplicated bdays in one 50 person group
n <- 50
bdays <- sample(1:365, n, replace = TRUE)    # generate n random birthdays
any(duplicated(bdays))    # check if any birthdays are duplicated

# Monte Carlo simulation with B=10000 replicates
B <- 10000
results <- replicate(B, {    # returns vector of B logical values
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
})
mean(results)    # calculates proportion of groups with duplicated bdays


# function to calculate probability of shared bdays across n people
compute_prob <- function(n, B = 10000) {
	same_day <- replicate(B, {
    	bdays <- sample(1:365, n, replace = TRUE)
        any(duplicated(bdays))
    })
    mean(same_day)
}

n <- seq(1, 60)


x <- 1:10
sqrt(x)    # sqrt operates on each element of the vector

y <- 1:10
x*y    # * operates element-wise on both vectors

compute_prob(n)    # does not iterate over the vector n without sapply

x <- 1:10
sapply(x, sqrt)    # this is equivalent to sqrt(x)

prob <- sapply(n, compute_prob)    # element-wise application of compute_prob to n
plot(n, prob)


# function for computing exact probability of shared birthdays for any n
exact_prob <- function(n){
    prob_unique <- seq(365, 365-n+1)/365   # vector of fractions for mult. rule
    1 - prod(prob_unique)    # calculate prob of no shared birthdays and subtract from 1
}

# applying function element-wise to vector of n values
eprob <- sapply(n, exact_prob)

# plotting Monte Carlo results and exact probabilities on same graph
plot(n, prob)    # plot Monte Carlo results
lines(n, eprob, col = "red")    # add line for exact prob


B <- 10^seq(1, 5, len = 100)    # defines vector of many B values
compute_prob <- function(B, n = 22){    # function to run Monte Carlo simulation with each B
	same_day <- replicate(B, {
    	bdays <- sample(1:365, n, replace = TRUE)
        any(duplicated(bdays))
    })
    mean(same_day)
}

prob <- sapply(B, compute_prob)    # apply compute_prob to many values of B
plot(log10(B), prob, type = "l")    # plot a line graph of estimates