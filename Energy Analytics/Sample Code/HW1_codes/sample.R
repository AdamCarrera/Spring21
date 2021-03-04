#######install packages#####
install.packages('fitdistrplus')
#######load packages#####
library(fitdistrplus)
#######Set up working directly######
root <- "/Users/ancar/Desktop/"
#######Read in data######
data_frame <- read.csv(paste0('windspeed.csv'))
#######Select desired time series data#####
wind_speed <- data_frame[,5]
####Statistics#####
y = ts(wind_speed, start = 0, frequency = 288)
plot(y)

mean(wind_speed)

sd(wind_speed)

var(wind_speed)

summary(wind_speed)
#######Distribution fitting######
hist(wind_speed, freq=F, breaks=100, main="Hist...")

lines(density(wind_speed),col="blue")

fit_w <- fitdist(wind_speed, "weibull")

fit_g <- fitdist(wind_speed, "gamma")

fit_ln <- fitdist(wind_speed, "lnorm")
#par(mfrow=c(2,2))

plot.legend <- c("Weibull", "lognormal", "gamma")

denscomp(list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

cdfcomp (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

qqcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

ppcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

######Goodness of fit######
gofstat(list(fit_w, fit_g, fit_ln), fitnames = c("Weilbull", "Gamma", "Lnorm"))
