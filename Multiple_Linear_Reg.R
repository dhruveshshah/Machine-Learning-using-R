#Multiple Linear Regression

#Import the dataset
setwd("File_Path")
dataset<-read.csv("50_Startups.csv")
summary(dataset)
str(dataset)

#Converting the categorical data to factor
dataset$State<-factor(dataset$State,
                      levels = c("New York","California","Florida"),
                      labels = c(1,2,3))


library(caTools)
set.seed(123)
split<-sample.split(dataset$Profit,SplitRatio = 0.8)
split

#Creating training data
train_set<-subset(dataset,split==T)
train_set
#Creating test data
test_set<-subset(dataset,split==F)
test_set

#Building the multiple linear regression model
regressor = lm(formula = Profit ~ ., data =train_set)
summary(regressor)

#Building optimal model using Backward Elimination method
regressor = lm(formula=Profit~R.D.Spend,Marketing.Spend,
               data=datset)
#Removing variable whose p value is greater than 0.05
regressor = lm(formula = Profit~R.D.Spend,
               data=dataset)

pred_y<-predict(regressor,newdata=test_set)
summary(pred_y)