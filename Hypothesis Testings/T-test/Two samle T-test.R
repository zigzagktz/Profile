library(datasets)
df <- CO2 #loading the dataset

install.packages("dplyr")
library(dplyr) #loading the package

Quebec <- df %>% filter(Type=="Quebec") %>% select(uptake) #filtering uptake value for categoru 1

Mississippi <- df %>% filter(Type=="Mississippi") %>% select(uptake) # filtering uptake value for category 2

test <- t.test(Quebec$uptake, Mississippi$uptake, alternative = ("greater"),var.equal = F ) # running the two sample t-test

test #pringint the value of the test
