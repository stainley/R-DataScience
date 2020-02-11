# Title     : TODO
# Objective : TODO
# Created by: slebron
# Created on: 2/10/20

options(digits = 3)
library(tidyverse)
head(esoph)

all_cases <- sum(esoph$ncases)
all_controls <- sum(esoph$ncontrols)

esoph %>%
  filter(alcgp == max(alcgp)) %>%
  summarize(cases = sum(ncases), control = sum(ncontrols)) %>%
  mutate(cancel = cases / (cases + control)) %>%
  .$cancel


esoph %>%
  filter(alcgp == min(alcgp)) %>%
  summarize(cases = sum(ncases), control = sum(ncontrols)) %>%
  mutate(cancel = cases / (cases + control)) %>%
  .$cancel


esoph$tobgp


esoph %>%
  filter(tobgp %in% c('10-19', '20-29', '30+')) %>%
  summarize(case = sum(ncases) / all_cases)

esoph %>%
  filter(tobgp %in% c('10-19', '20-29', '30+')) %>%
  summarize(case = sum(ncontrols) / all_controls)


high_aalcgp <- esoph %>%
  filter(alcgp == max(alcgp)) %>%
  summarize(case = sum(ncases) / all_cases)

#High Tabacco Cases
esoph %>%
  filter(tobgp == max(tobgp)) %>%
  summarize(case = sum(ncases) / all_cases)


esoph %>%
  filter(alcgp == max(alcgp) & tobgp == max(tobgp)) %>%
  summarize(case = sum(ncases) / all_cases)


cases_group_or <- esoph %>%
  filter(alcgp == max(alcgp) | tobgp == max(tobgp)) %>%
  summarize(case = sum(ncases) / all_cases)


high_control_gp <- esoph %>%
  filter(alcgp == max(alcgp)) %>%
  summarize(case = sum(ncontrols) / all_controls)

# Many times high alcohol
high_aalcgp / high_control_gp

high_tabacco_control <- esoph %>%
  filter(tobgp == max(tobgp)) %>%
  summarize(group = sum(ncontrols) / all_controls)


esoph %>%
  filter(tobgp == max(tobgp) & alcgp == max(alcgp)) %>%
  summarize(group = sum(ncontrols) / all_controls)

controlls_group_or <- esoph %>%
  filter(tobgp == max(tobgp) | alcgp == max(alcgp)) %>%
  summarize(group = sum(ncontrols) / all_controls)


cases_group_or/controlls_group_or

library(gtools)

# combinations(entries, sides ) * drinks