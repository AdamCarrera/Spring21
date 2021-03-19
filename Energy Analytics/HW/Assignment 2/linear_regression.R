# Packages
library(e1071)
library(ggplot2)
library(forecast)
library(zoo)

# Read in Site B data
site_b <- read.csv("SiteB-2012.csv", header = TRUE, skip = 3)

train_data_b <- site_b[1:52560,]
test_data_b <- site_b[52561:105120,]

# Read in Site A data
site_a <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)

train_data_a <- site_a[1:52560,]
test_data_a <- site_a[52561:105120,]

linear_model <- lm(train_data_b$wind.speed.at.100m..m.s. ~ train_data_a$wind.speed.at.100m..m.s. 
                   + train_data_a$power..MW. + train_data_b$power..MW.)
linear_model$coefficients

prediction <- predict(linear_model, test_data_a)
mean_prediction <- rollmean(prediction, k = 8000, fill = NA)
plot(mean_prediction)



# Determine Accuracy

error <- prediction - test_data_b$wind.speed.at.100m..m.s.
predictionMAE <- mean(abs(error))
predictionRMSE <- sqrt(mean(error^2))






linear_model$coefficients
print(linear_model)
summary(linear_model)

ggplot(data = site_b, aes(y = power..MW., x = wind.speed.at.100m..m.s.)) +
  geom_point() + geom_smooth(method = 'lm', se=FALSE)

prediction <- predict(linear_model, site_a)

mean_prediction <- rollmean(prediction, k = 8000, fill = NA)

plot(mean_prediction, main = "title")

#linear_model = lm(wind.speed.at.100m..m.s. ~ wind.direction.at.100m..deg., data = site_b)
#plot(site_b$wind.direction.at.100m..deg., site_b$wind.speed.at.100m..m.s.)
#abline(linear_model)
