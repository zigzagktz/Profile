install.packages("ggplot2") # installing the package
library(ggplot2) # loading the ggplot package
df <- diamonds # laoding the diamond dataset into a variable

total_count <- nrow(df) # counting total number of trials (n)

proportion <- (sum(df$cut=="Ideal")/total_count)*100 # calculating propertion of the item that has to be investegated

result <- prop.test(proportion,total_count,p=0.45,alternative="less") # running a population propertion test
result # printing the test result
