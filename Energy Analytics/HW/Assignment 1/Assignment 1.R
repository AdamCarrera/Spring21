# Import Data and Convert to Time Series

speed08 <- read.csv("Site A-2008.csv", header = TRUE, skip = 3, nrows=2021)
speed08 <- ts(speed08[,8], start=0, frequency = 288)

speed09 <- read.csv("SiteA-2009.csv", header = TRUE, skip = 3, nrows=2021)
speed09 <- ts(speed09[,8], start = 0, frequency = 288)

speed10 <- read.csv("SiteA-2010.csv", header = TRUE, skip = 3, nrows=2021)
speed10 <- ts(speed10[,8], start = 0, frequency = 288)

speed11 <- read.csv("SiteA-2011.csv", header = TRUE, skip = 3, nrows=2021)
speed11 <- ts(speed11[,8], start = 0, frequency = 288)

speed12 <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3, nrows=2021)
speed12 <- ts(speed12[,8], start = 0, frequency = 288)


speed <- data.frame("2008" = speed08, "2009" = speed09, "2010" = speed10,
                    "2011" = speed11, "2012" = speed12)
weekspeed <- ts(c(speed08[0:2021], speed09[0:2021], speed10[0:2021], speed11[0:2021], speed12[0:2021]),
                start = 2008, frequency = 2021)

yearspeed <- ts(c(speed08, speed09, speed10, speed11, speed12),
                start = 2008, frequency = 105120)


yearmean <- rollmean(yearspeed, k = 8000, fill= NA)

ggseasonplot(weekspeed) + theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())

ggseasonplot(yearmean) + theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())


# Time Series Plots


autoplot(speed08) +
  ggtitle("Wind Speed Site A - 2008") +
  xlab("Time in Days") + 
  ylab("Wind Speed at 100m (m/s)")


png(filename = "figures/speed2009.png")
autoplot(speed09) +
  ggtitle("Wind Speed Site A - 2009") +
  xlab("Time in Days") + 
  ylab("Wind Speed at 100m (m/s)")
dev.off()


png(filename = "figures/speed2010.png")
autoplot(speed10) +
  ggtitle("Wind Speed Site A - 2010") +
  xlab("Time in Days") + 
  ylab("Wind Speed at 100m (m/s)")
dev.off()


png(filename = "figures/speed2011.png")
autoplot(speed11) +
  ggtitle("Wind Speed Site A - 2011") +
  xlab("Time in Days") + 
  ylab("Wind Speed at 100m (m/s)")
dev.off()


png(filename = "figures/speed2012.png")
autoplot(speed12) +
  ggtitle("Wind Speed Site A - 2012") +
  xlab("Time in Days") + 
  ylab("Wind Speed at 100m (m/s)")
dev.off()

#Distributions

# Import the data again, for the whole year

df08 <- read.csv("Site A-2008.csv", header = TRUE, skip = 3)
speed08 <- ts(df08[,8], start=0, frequency = 288)
power08 <- ts(df08[,6], start=0, frequency = 288)

df09 <- read.csv("SiteA-2009.csv", header = TRUE, skip = 3)
speed09 <- ts(df09[,8], start=0, frequency = 288)
power09 <- ts(df09[,6], start=0, frequency = 288)

df10 <- read.csv("SiteA-2010.csv", header = TRUE, skip = 3)
speed10 <- ts(df10[,8], start=0, frequency = 288)
power10 <- ts(df10[,6], start=0, frequency = 288)

df11 <- read.csv("SiteA-2011.csv", header = TRUE, skip = 3)
speed11 <- ts(df11[,8], start = 0, frequency = 288)
power11 <- ts(df11[,6], start=0, frequency = 288)

df12 <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)
speed12 <- ts(df12[,8], start = 0, frequency = 288)
power12 <- ts(df12[,6], start=0, frequency = 288)

speed5years <- c(speed08, speed09, speed10, speed11, speed12)
power5years <- c(power08, power09, power10, power11, power12)

# Histograms - Speed

hist(speed08, freq=F, breaks=100, main="Wind Speed Density - 2008",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(speed08),col="blue")

hist(speed09, freq=F, breaks=100, main="Wind Speed Density - 2009",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(speed09),col="blue")

hist(speed10, freq=F, breaks=100, main="Wind Speed Density - 2010",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(speed10),col="blue")

hist(speed11, freq=F, breaks=100, main="Wind Speed Density - 2011",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(speed11),col="blue")

hist(speed12, freq=F, breaks=100, main="Wind Speed Density - 2012",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(speed12),col="blue")

hist(speed5years, freq=F, breaks=100, main="Wind Speed Density - 5 years",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(speed08),col="blue")

# Histograms - Power

hist(power08, freq=F, breaks=100, main="Wind Power Density - 2008",
     xlab = "Power (MW)")
lines(density(power08),col="blue")

hist(power09, freq=F, breaks=100, main="Wind Power Density - 2009",
     xlab = "Power (MW)")
lines(density(power08),col="blue")

hist(power10, freq=F, breaks=100, main="Wind Power Density - 2010",
     xlab = "Power (MW)")
lines(density(power08),col="blue")

hist(power11, freq=F, breaks=100, main="Wind Power Density - 2011",
     xlab = "Power (MW)")
lines(density(power08),col="blue")

hist(power12, freq=F, breaks=100, main="Wind Power Density - 2012",
     xlab = "Power (MW)")
lines(density(power08),col="blue")

hist(power5years, freq=F, breaks=100, main="Wind Power Density - 5 Years",
     xlab = "Power (MW)")
lines(density(power08),col="blue")

# Distribution Fitting - Speed

windspeed <- list(as.numeric(speed08), as.numeric(speed09),
                  as.numeric(speed10), as.numeric(speed11),
                  as.numeric(speed12))

years <- list("2008", "2009", "2010", "2011", "2012")
i <- 1
# 2008

for (wind in windspeed) {
  fit_w <- fitdist(wind, "weibull")
  fit_g <- fitdist(wind, "gamma")
  fit_ln <- fitdist(wind, "lnorm")
  
  plot.legend <- c("Weibull", "lognormal", "gamma")
  
  denscomp(list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
           main = paste("Histogram and theoretical densities,", "Windspeed -", years[i]))
  cdfcomp (list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
           main = paste("Empirical and theoretical CDFs,", "Windspeed -", years[i]))
  qqcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
           main = paste("Q-Q plot,", "Windspeed -", years[i]))
  ppcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
           main = paste("P-P plot,", "Windspeed -", years[i]))
  
  i <- i + 1
}

fit_w <- fitdist(as.numeric(speed08), "weibull")
fit_g <- fitdist(as.numeric(speed08), "gamma")
fit_ln <- fitdist(as.numeric(speed08), "lnorm")


x <- gofstat(list(fit_w, fit_g, fit_ln), fitnames = c("Weibull", "Gamma", "Lnorm"))


p1 <- denscomp(list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
         main = paste("Histogram and theoretical densities,", "Windspeed -", years[1]),
         plotstyle = "ggplot")
p2 <- cdfcomp (list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
         main = paste("Empirical and theoretical CDFs,", "Windspeed -", years[1]))
p3 <- qqcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
         main = paste("Q-Q plot,", "Windspeed -", years[1]))
p4 <- ppcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend,
         main = paste("P-P plot,", "Windspeed -", years[1]))

# Dist fit - power

windpower <- list(as.numeric(power08), as.numeric(power09), as.numeric(power10),
                  as.numeric(power11), as.numeric(power12))


fit_w <- fitdist(na.omit(power08), "weibull",  method="mle", lower=c(0, 0))
fit_g <- fitdist(as.numeric(power08), "gamma")
fit_ln <- fitdist(as.numeric(power08), "norm")

denscomp(fit_ln)

x <- gofstat(fit_ln)

fitnames = c("Weibull", "Gamma", "Lnorm")
creiteria = c("Kolmogorov-Smirnov", "Cramer-von Mises", "Anderson-Darling",
              "Akaike's Information Criterion", "Bayesian Information Criterion")
values = c(x["ks"]["Weibull"])
gofdf <- data.frame()
