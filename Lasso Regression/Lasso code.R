install.packages("lars")
library(lars)
install.packages("glmnet")
library(glmnet)
data("diabetes")

#1
df <- diabetes #loading datset
str(df) # checking stuctrue
x <- df$x  # assigning x element to variables x
y <- df$y  #assigning y element to variables y
x2 <- df$x2 #assigning x2 element to variables x2
dim(x)  # cheking dimension of variable x
dim(x2) # cheking dimension of variable x2
length(y) # cheking length of variable y

#2
par(mfrow=c(2,5)) # changing screen to show 10 graphs at a time.

# creating a for loop to iteriate over all the columns of x with respect to y. 
for (i in 1:ncol(x)) {
  plot(x[,i],y,xlab = colnames(x)[i],ylab="progress")
  abline(lm(y~x[,i]),lwd=2)
}
dev.off()   # clsoing the screen to show single plot.


#3

model <- lm(y~x)  #creating a liner model by regressing y on predictors on y
summary(model) # checking the summary of model


#4

lasso <- glmnet(x,y,family = "gaussian",alpha = 1) # running a lasso regression 
plot(lasso) # plotting the result of lasso regression



#5
cv <- cv.glmnet(x,y,alpha=1,nlambda=1000) #using cross validation
plot(cv) # ploting result of cross validation
cv$lambda.min # checking the minimum value possible of lambda


#6 
fit <- glmnet(x,y,family="gaussian",lambda = cv$lambda.min) #running lasso at minimum value of lambda
fit$beta # extracting beta matrix

#7
fit <- glmnet(x,y,family="gaussian",lambda = cv$lambda.1se) # running lasso at 1 standard deviation value of lambda
fit$beta # extarcting beta matrix at that value. 

#8
model_2 <- lm(y~x2) # runing liner model on x2
summary(model_2) # summary of liner model

#9
lasso_2 <- glmnet(x2,y,family="gaussian",alpha=1) # running lasso on to regress y on x2
plot(lasso_2) # plotting lasso result. 



#10 
cv_2 <- cv.glmnet(x2,y,nlambda=1000)  #running cross validation 
plot(cv_2) #ploting result of cross validation 
cv_2$lambda.min #extarcting minimum value of lambda

#11
fit_2 <- glmnet(x2,y,family="gaussian",alpha=1, lambda = cv_2$lambda.min) #running lasso at minimum value of lambda
fit_2$beta # extracting beta matrix at minimum value of lambda

#12
fit_2 <- glmnet(x2,y,family="gaussian",alpha=1, lambda = cv_2$lambda.1se) #running lasso at 1 sd value of lambda
fit_2$beta # extracting beta matrix at 1 sd value of lambda
