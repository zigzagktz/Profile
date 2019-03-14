library(datasets)
df<- CO2 #loading the dataset

install.packages("dplyr")
library(dplyr) # loading library for filtering data

a <- df%>% filter(Type=="Quebec") %>% select(uptake) # filtering out updatke value of Quebec
result<- t.test(a,alternative="greater",mu=30) # running test in comparision mean value to be 30
result # printing the result.
