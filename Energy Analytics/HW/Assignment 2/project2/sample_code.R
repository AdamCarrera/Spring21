#install.packages('e1071')
library('e1071')
#root <-  "C:/Users/don/Documents/UTD GRAD/TA-Energy Analytics/project2/"

###########Linear regression model###############
data <- read.csv(paste0('cars.csv'))

#data <- read.csv('cars.csv')


n=30 #number of training data


train_data <- data[1:n,]
test_data <- data[(n+1):nrow(data),]

#train linear regression model
linear_model <- lm(dist ~ speed, data = train_data)

linear_model$coefficients
##visualize the trained model##
plot(train_data$speed, train_data$dist, main="Scatterplot Example", xlab="Car Speed ", ylab="Distance ", pch=19)

#add estimated regression line to scatter plots
abline(linear_model)

#summary of trained linear regression model
print(linear_model)
summary(linear_model)

#make prediction
prediction <- predict(linear_model, test_data)  # predict distance


plot(test_data$speed,test_data$dist,pch=15)
lines(test_data$speed,prediction)

#############Nonlinear model################
data <-read.csv(paste0(root,'sampledata.csv'))
n <- 60 #number of training data
x_train <- data[1:n,1]   
y_train <- data[1:n,2] 
x_predict <- data[(n+1):nrow(data),1]
y_real <- data[(n+1):nrow(data),2]
#train nonlinear regression model
model <- svm(x_train,y_train,type="eps-regression",kernal=kernel_type,gamma = 0.001,degree = 5,epsilon = 0.001)
#make prediction
y_predict<-predict(model,x_predict) 



###########evaluation metrics############
error<-(y_predict-y_real)  #two column data, one is actual, another is predict, you should name y_predict and y_actual by yourself
predictionMAE <- mean(abs(error))  # Mean absoulte error calculation
predictionRMSE <- sqrt(mean(error^2)) #Root mean square error calculation

####################
#Tune the SVM model

OptModelsvm=tune(svm, y_train~x_train, data=data,ranges=list(epsilon=seq(0,1,0.1), cost=1:100))

#Find out the best model
BstModel=OptModelsvm$best.model
#Predict Y using best model
PredYBst=predict(BstModel,x_predict)

#Print optimum value of parameters
print(OptModelsvm)
