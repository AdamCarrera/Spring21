#----------------------------Correlation---------------------------------

# Read in csv files

site_b <- read.csv("SiteB-2012.csv", header = TRUE, skip = 3)
site_a <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)

# Create data frame containing predictor variables

df = data.frame(a_speed = site_a$wind.speed.at.100m..m.s., b_speed = site_b$wind.speed.at.100m..m.s.,
                a_power = site_a$power..MW., b_power = site_b$power..MW.)

# Create linear model, splitting the training data and testing data in half

linear_model <- lm(formula = b_speed ~ a_speed + a_power,
                   data = df[1:52560,]) # hard coded :(
prediction <- predict(linear_model, df[52561:105120,])

# measure model accuracy

error <- prediction - df$b_speed[52561:105120]
predictionMAE <- mean(abs(error))
predictionRMSE <- sqrt(mean(error^2))

#------------------------Generation-----------------------------


# load data frames, repeating steps preformed above
a_2008 <- read.csv("Site A-2008.csv", header = TRUE, skip = 3)
a_2009 <- read.csv("SiteA-2009.csv", header = TRUE, skip = 3)
a_2010 <- read.csv("SiteA-2010.csv", header = TRUE, skip = 3)
a_2011 <- read.csv("SiteA-2011.csv", header = TRUE, skip = 3)
a_2012 <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)

a_2008 <- data.frame(a_speed = a_2008$wind.speed.at.100m..m.s., 
                     a_power = a_2008$power..MW.)

a_2009 <- data.frame(a_speed = a_2009$wind.speed.at.100m..m.s., 
                     a_power = a_2009$power..MW.)

a_2010 <- data.frame(a_speed = a_2010$wind.speed.at.100m..m.s., 
                     a_power = a_2010$power..MW.)

a_2011 <- data.frame(a_speed = a_2011$wind.speed.at.100m..m.s., 
                     a_power = a_2011$power..MW.)

# Generate site b data

b_2008 <- predict(linear_model, a_2008)
b_2009 <- predict(linear_model, a_2009)
b_2010 <- predict(linear_model, a_2010)
b_2011 <- predict(linear_model, a_2011)
