# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 1/31/20

library(dslabs)
data(heights)
options(digits = 3)

str(heights)
names(heights)

avg <- mean(heights$height)

ind <- length(which(heights$height > avg))

length(which(heights$height > avg & heights$sex == "Female"))

question_3 <- c(heights$height > avg & heights$sex == "Female")


mean(heights$sex == "Female")

ind_min <- which.min(heights$height)
min_height <- heights$height[ind_min]

ind_max <- which.max(heights$height)
max_height <- heights$height[ind_max]

ind <- which(heights$height > min_height & heights$height < max_height)
length(ind)

x <- as.integer(range())
id_order <- order(heights$height)
heights$height[id_order]
