

#step 1
df <- file.choose() #file name is rooftop
df <- read.csv(df) # convert the file into csv
str(df) # check the stuctur of data
df <- df[,-c(9,10,8,7,6,11,12)]
str(df) # seeing stucture of data frame
summary(df)  # seeing summary of data frame
df <- na.omit(df) # removing na

  
#step 2  
r <- sample(1:768,.50*768) # generating random sample

df["color"] <- "0"    # creating a extra column in data frame

df$color[r] <- "red"    # assiging 50% random values to be red
 df$color[-r] <- "green"  #assigning other 50% values to be green
 
 table(df$color) # to check the result are 50-50


#step 3
measure <- df[,1:5] # extracting continous values
color <- df[,6] # extracting categorical values
plot(measure,col=color,pch=19,)  # plotting the cross sectional graph 
 

#step4  
install.packages("rgl") #installing pa new package
library(rgl)  # laoding the new package
plot3d(measure,type="s",col=color)  # plotting a 3d graph 


#step5
lims <- c(min(measure),max(measure))  # defining the minimum and maximum limit
plot3d(measure,type="s",col=color,xlim = lims,ylim = lims,zlim = lims) #plotting a 3d graph
sapply(measure,mean) #applying mean function across columns



#step6
centered_measure <- scale(measure,center = T,scale = F) # cernteralizing the data not nomalizing, becuase we want to bring all the value in plain to origin

summary(centered_measure) #calculating summary

lims <- c(min(centered_measure),max(centered_measure))  # definin limites
plot3d(centered_measure,type="s",col=color,xlim = lims,ylim = lims,zlim = lims) # creating a 3d plot
 
sapply(as.data.frame(centered_measure),sd) # calculating standard deviation across all columns of data frame

#step7
reduced_measure <- scale(measure) # this function scales as well as centeres
summary(reduced_measure)  # calculating summary
lims <- c(min(reduced_measure),max(reduced_measure))  # defining limits
plot3d(reduced_measure,type="s",col=color,xlim = lims,ylim = lims,zlim = lims) #calculating 3d plot 

