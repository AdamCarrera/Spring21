df08 <- read.csv("Site A-2008.csv", header = TRUE, skip = 3)
power08 <- ts(df08[,6], start = 0, frequency = 288)
speed08 <- ts(df08[,8], start=0, frequency = 288)

df09 <- read.csv("SiteA-2009.csv", header = TRUE, skip = 3)
power09 <- ts(df09[,6], start = 0, frequency = 288)
speed09 <- ts(df09[,8], start = 0, frequency = 288)

df10 <- read.csv("SiteA-2010.csv", header = TRUE, skip = 3)
power10 <- ts(df10[,6], start = 0, frequency = 288)
speed10 <- ts(df10[,8], start = 0, frequency = 288)

df11 <- read.csv("SiteA-2011.csv", header = TRUE, skip = 3)
power11 <- ts(df11[,6], start = 0, frequency = 288)
speed11 <- ts(df11[,8], start = 0, frequency = 288)

df12 <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)
power12 <- ts(df12[,6], start = 0, frequency = 288)
speed12 <- ts(df12[,8], start = 0, frequency = 288)

weekPower <- ts(c(power08[0:2021], power09[0:2021], power10[0:2021], 
                 power11[0:2021], power12[0:2021]), 
               start = 2008, frequency = 2021)

weekSpeed <- ts(c(speed08[0:2021], speed09[0:2021], speed10[0:2021], 
                  speed11[0:2021], speed12[0:2021]), 
                start = 2008, frequency = 2021)
yearsList <- list("2008", "2009", "2010", "2011", "2012")

year08 <- c()
year09 <- c()
year10 <- c()
year11 <- c()
year12 <- c()

for (x in power08[0:2021]) {
  year08 <- c(year08, "2008")
  year09 <- c(year09, "2009")
  year10 <- c(year10, "2010")
  year11 <- c(year11, "2011")
  year12 <- c(year12, "2012")
}

years <- c(year08, year09, year10, year11, year12)

ggseasonplot(weekPower, main="One Week - Wind Power Time Series",
             ylab = "Power (MW)") + 
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())

yearPower <- ts(c(power08, power09, power10, power11, power12),
                start = 2008, frequency = 105120)

yearSpeed <- ts(c(speed08, speed09, speed10, speed11, speed12),
                start = 2008, frequency = 105120)

powerMean <- rollmean(as.numeric(yearPower), k = 8640, fill= NA)
speedMean <- rollmean(as.numeric(yearSpeed), k = 8640, fill= NA)

scatter <- data.frame(powerMean, speedMean)
scatter2 <- data.frame(weekSpeed, weekPower, years)

ggplot(scatter2, aes(x = weekSpeed, y = weekPower, col = years)) +
  geom_point(alpha=0.25) + ggtitle("Wind Speed vs Wind Power - One Week") +
  facet_wrap(~years) +
  labs(y = "Wind Power (MW)", x = "Wind Speed (m/s)")

powerMean <- rollmean(yearPower, k = 8640, fill= NA)
speedMean <- rollmean(yearSpeed, k = 8640, fill= NA)


ggseasonplot(weekSpeed, main="1 Week - Wind Speed Time Series",
             ylab = "Wind Speed (m/s)") + 
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank())




ggseasonplot(speedMean, main="30 Day Rolling Mean - Wind Speed Time Series",
             ylab = "Wind Speed (m/s)") + 
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank()) +
  geom_vline(xintercept=0.25) + geom_vline(xintercept = 0.5) +
  geom_vline(xintercept = 0.75) # + geom_vline(xintercept = 1)


ggseasonplot(powerMean, main="30 Day Rolling Mean - Wind Power Time Series",
             ylab = "Power (MW)") + 
  theme(axis.ticks.x = element_blank(), axis.text.x = element_blank()) +
  geom_vline(xintercept=0.25) + geom_vline(xintercept = 0.5) +
  geom_vline(xintercept = 0.75) # + geom_vline(xintercept = 1)
