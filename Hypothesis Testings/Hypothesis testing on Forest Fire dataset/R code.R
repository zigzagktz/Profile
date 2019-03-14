df <- file.choose() # please choose file named "forest_fire"
df <- read.csv(df) # read the file as csv file

a <- df$area # extract the column that has area value
plot(a) # plot the area variable to get the distribution
a <- a[a>0 & a<=200] # extract only values that are greater than zero and less than 200 (removing outliers)
plot(a) #plot again 

value <- a>12 # extracting boolian value where area is greater than 12

result <- prop.test(sum(value),length(a),alternative="less") # running the propertion test
result # printing the result
