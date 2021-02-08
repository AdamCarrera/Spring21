a <- 1
data(iris)

plot(iris)

SiteA_2008 <- read.csv(file = "Site A-2008.csv",
                      sep = ",", header=TRUE, skip = 3, nrows=2021)

plot(SiteA_2008$wind.speed.at.100m..m.s.,
     main="Wind Speed Site A - 2008", 
     xlab="Time in Days",
     ylab = "Wind Speed at 100m (m/s)",
     xaxt= "n")
axis(1, at= c(0, 288, 576, 864, 1152, 1440, 1728, 2016), 
     labels = c(0,1,2,3,4,5,6,7))


SiteA_2009 <- read.csv(file = "SiteA-2009.csv",
                  sep = ",", header=TRUE, skip = 3, nrows=2021)

SiteA_2010 <- read.csv(file = "SiteA-2010.csv",
                       sep = ",", header=TRUE, skip = 3, nrows=2021)

SiteA_2011 <- read.csv(file = "SiteA-2011.csv",
                       sep = ",", header=TRUE, skip = 3, nrows=2021)

SiteA_2012 <- read.csv(file = "SiteA-2012.csv",
                       sep = ",", header=TRUE, skip = 3, nrows=2021)


#2008
ggplot(SiteA_2008, aes(x=seq_along(wind.speed.at.100m..m.s.), 
                       y=wind.speed.at.100m..m.s.)) +
  geom_line(colour="blue") +
  ggtitle("Windspeed Site A - 2008") +
  xlab("Time in Days") + ylab("Windspeed at 100m (m/s)") +
  scale_x_continuous(breaks=seq(0,2021,288), 
                     labels = c("0" = "0", "288" = "1",
                                "576" = "2", "864" = "3",
                                "1152" = "4", "1440" = "5",
                                "1728" = "6", "2016" = "7"))

#2009
ggplot(SiteA_2009, aes(x=seq_along(wind.speed.at.100m..m.s.), 
                       y=wind.speed.at.100m..m.s.)) +
  geom_line(colour="red") +
  ggtitle("Windspeed Site A - 2009") +
  xlab("Time in Days") + ylab("Windspeed at 100m (m/s)") +
  scale_x_continuous(breaks=seq(0,2021,288), 
                     labels = c("0" = "0", "288" = "1",
                                "576" = "2", "864" = "3",
                                "1152" = "4", "1440" = "5",
                                "1728" = "6", "2016" = "7"))

#2010
ggplot(SiteA_2010, aes(x=seq_along(wind.speed.at.100m..m.s.), 
                       y=wind.speed.at.100m..m.s.)) +
  geom_line(colour="black") +
  ggtitle("Windspeed Site A - 2010") +
  xlab("Time in Days") + ylab("Windspeed at 100m (m/s)") +
  scale_x_continuous(breaks=seq(0,2021,288), 
                     labels = c("0" = "0", "288" = "1",
                                "576" = "2", "864" = "3",
                                "1152" = "4", "1440" = "5",
                                "1728" = "6", "2016" = "7"))

#2011
ggplot(SiteA_2011, aes(x=seq_along(wind.speed.at.100m..m.s.), 
                       y=wind.speed.at.100m..m.s.)) +
  geom_line(colour="purple") +
  ggtitle("Windspeed Site A - 2011") +
  xlab("Time in Days") + ylab("Windspeed at 100m (m/s)") +
  scale_x_continuous(breaks=seq(0,2021,288), 
                     labels = c("0" = "0", "288" = "1",
                                "576" = "2", "864" = "3",
                                "1152" = "4", "1440" = "5",
                                "1728" = "6", "2016" = "7"))

#2012
ggplot(SiteA_2012, aes(x=seq_along(wind.speed.at.100m..m.s.), 
                       y=wind.speed.at.100m..m.s., col=wind.direction.at.100m..deg.)) +
  geom_line(size=1) +
  ggtitle("Windspeed Site A - 2012") +
  xlab("Time in Days") + ylab("Windspeed at 100m (m/s)") +
  scale_x_continuous(breaks=seq(0,2021,288), 
                     labels = c("0" = "0", "288" = "1",
                                "576" = "2", "864" = "3",
                                "1152" = "4", "1440" = "5",
                                "1728" = "6", "2016" = "7"))

wind_speed = SiteA_2008[,8]

hist(wind_speed, freq=F, breaks=10, main="Wind Speed Density",
     xlab = "Wind Speed at 100m (m/s)")
lines(density(wind_speed),col="blue")

fit_w <- fitdist(wind_speed, "weibull")
fit_g <- fitdist(wind_speed, "gamma")
fit_ln <- fitdist(wind_speed, "lnorm")

plot.legend <- c("Weibull", "lognormal", "gamma")

denscomp(list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

cdfcomp (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

qqcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

ppcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)
