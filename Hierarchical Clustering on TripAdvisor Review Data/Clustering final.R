
# In this file I have just commented on the functionality of code but the explanations are in report file already. 

library(cluster)
install.packages("gplots") # installing the gplots package
library(gplots) #loading the gplot pakages


df <- read.csv(file.choose()) # laod the file with file name "tripadvisor"
names <- c("User ID","art gallery","dance club","juice bars","restaurants","museums","resorts","parking","beaches","theaters","religious")  # assigning columns name to a single variable 
colnames(df) <- names # assigning those names to the columns of data frame 

str(df) # checking the stucture of the data frame


summary(df[,2:11]) # checking the summary of the data frame
barplot(sapply(df[,2:11],mean),main="Mean value of reviews",xlab="destination",ylab="mean value") # creating a bar plot by iretrating across all columns. Each bar represents the mean value of that column


par(mfrow=c(2,5)) # converting the window to show 10 plots at a time
# applying the for loop to create 10 histograms so that we can understand the distrubution of data.
for(i in 2:11)
  
{
  hist(df[,i],breaks=100,xlab=names[i])
}
dev.off() # closing the window from showing 10 plots to 1 plot


distance <- dist(df) # calculating the distance of each point from each other point
hc <- hclust(distance) # creating a cluster of numbeers colse to each other 
plot(hc) # ploting the cluters to see a visulization of clusters
rect.hclust(hc, k = 3)  # creatinga rectange around 3 big main clusters

cu <- cutree(hc,3) # cutting the tree into 3 most big clusters 
table(cu) # calculating how many value each cluster holds


heatmap.2(as.matrix(df[,2:11]),trace="none",cexRow=1,cexCol=0.8,margin=c(7,10)) # creating a heatmap that is clustering all the same value together
aggregate(df[,2:11],by=list(cu),mean) # calculating mean of each kind of review in all three clusters to get the difference among them.



