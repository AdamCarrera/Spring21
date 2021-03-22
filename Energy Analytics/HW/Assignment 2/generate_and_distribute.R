# Packages
library(e1071)
library(ggplot2)
library(forecast)
library(zoo)

# Read in data sets

a_2008 <- read.csv("Site A-2008.csv", header = TRUE, skip = 3)
a_2009 <- read.csv("SiteA-2009.csv", header = TRUE, skip = 3)
a_2010 <- read.csv("SiteA-2010.csv", header = TRUE, skip = 3)
a_2011 <- read.csv("SiteA-2011.csv", header = TRUE, skip = 3)
a_2012 <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)

b_2008 <- predict.lm(linear_model, a_2008)
b_2008_mean <- rollmean(b_2008, k = 8000, fill = NA)

y <- a_2008$wind.speed.at.100m..m.s.
y <- rollmean(y, k = 8000, fill = NA)

plot(b_2008_mean)
plot(y)

