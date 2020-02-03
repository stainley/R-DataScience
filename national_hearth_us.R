# Title     : Data Science Practice
# Objective : National Hearth Statistic
# Created by: Stainley Lebron
# Created on: 2/2/20

# Install National Hearths Statistic
# install.packages("NHANES")
#library(tidyverse)
#library(NHANES)

data(NHANES)
options(digits=3)
names(NHANES)
head(NHANES)

ref <- NHANES %>% filter(AgeDecade == " 20-29" & Gender == "female") %>% summarize(average=mean(BPSysAve, na.rm = TRUE), standard_desviation=sd(BPSysAve, na.rm = TRUE)) %>% .$average


NHANES %>%
      filter(AgeDecade == " 20-29"  & Gender == "female") %>% summarize(minbp = min(BPSysAve, na.rm=TRUE), maxbp=max(BPSysAve, na.rm=TRUE))



NHANES %>% filter(Gender == "female") %>% group_by(AgeDecade) %>% summarize(average= mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve, na.rm=TRUE))


NHANES %>% filter(Gender == "male" & AgeDecade==" 40-49") %>% group_by(Race1) %>% summarize(average= mean(BPSysAve, na.rm=TRUE), standard_deviation=sd(BPSysAve, na.rm=TRUE))%>% arrange(average)