# Title     : TODO
# Objective : TODO
# Created by: Stainley Lebron
# Created on: 2/4/2020

options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

titanic %>%
  group_by(Age) %>%
  ggplot(aes(sample = Age)) +
  geom_qq(dparams = params, na.rm = TRUE) +
  geom_abline()


titanic %>% ggplot(aes(x=Survived, fill=Sex)) + geom_bar(position = position_dodge()) + geom_abline()

titanic %>% ggplot(aes(x=Age, y=..count.., fill=Sex)) + geom_density(alpha=0.5)
titanic %>% ggplot(aes(x=Age, y=..count.., fill=Survived)) + geom_density(alpha=0.5)

titanic %>% ggplot(aes(x=Pclass, y=..count.., fill=Survived)) + geom_bar()
titanic %>% ggplot(aes(x=Pclass, y=..count.., fill=Survived)) + geom_bar(position = position_fill())
titanic %>% ggplot(aes(x=Survived, y=..count.., fill=Pclass)) + geom_bar(position = position_fill())

titanic %>% ggplot(aes(x=Age, y=..count..,fill=Survived)) + geom_density(alpha=0.4) + facet_grid(Sex ~ Pclass ~.)