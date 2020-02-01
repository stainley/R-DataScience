# Title     : Programming Language R
# Objective : Practice Lenguage R
# Created by: Stainley Lebron
# Created on: 1/31/20

library(dslabs)
data(heights)
options(digits = 3)

str(heights)
names(heights)

avg <- mean(heights$height)

ind <- length(which(heights$height > avg))

length(which(heights$height > avg & heights$sex == "Female"))

question_3 <- (heights$height > avg & heights$sex == "Female")


mean(heights$sex == "Female")

ind_min <- which.min(heights$height)
min_height <- heights$height[ind_min]

ind_max <- which.max(heights$height)
max_height <- heights$height[ind_max]

ind <- which(heights$height > min_height & heights$height < max_height)

#823 Integer
d <- which.max(heights$height[which(as.integer(heights$height) == heights$height)])



x <- heights$height[which(heights$height >= as.integer(heights$height[which.min(heights$height)]) & heights$height <= as.integer(heights$height[which.max(heights$height)]))]

x <- heights$height[which(heights$height %in% as.integer(heights$height[which(heights$height >= as.integer(heights$height[which.min(heights$height)]) & heights$height <= as.integer(heights$height[which.max(heights$height)]))]))]

x[which.max(x)]

x <- c(50:82)
sum(!x %in% heights$height)

library(tidyverse)
heights2 <- data.frame(heights, ht_cm=heights$height * 2.54)

heights2$ht_cm[18]
mean(heights2$ht_cm)

head(heights2)


female <- filter(heights2, sex == "Female")

length((heights2$sex[which((heights2$sex == "Female"))]))

mean(female$ht_cm)


library(dslabs)
data(olive)
head(olive)


plot(olive$palmitic, olive$palmitoleic)

hist(olive$eicosenoic)

boxplot(palmitic~region, olive)