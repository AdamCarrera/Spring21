df08 <- read.csv("Site A-2008.csv", header = TRUE, skip = 3)
speed08 <- df08[,8]
power08 <- df08[,6]

df09 <- read.csv("SiteA-2009.csv", header = TRUE, skip = 3)
speed09 <- df09[,8]
power09 <- df09[,6]

df10 <- read.csv("SiteA-2010.csv", header = TRUE, skip = 3)
speed10 <- df10[,8]
power10 <- df10[,6]

df11 <- read.csv("SiteA-2011.csv", header = TRUE, skip = 3)
speed11 <- df11[,8]
power11 <- df11[,6]

df12 <- read.csv("SiteA-2012.csv", header = TRUE, skip = 3)
speed12 <- df12[,8]
power12 <- df12[,6]

speedTotal = c(speed08, speed09, speed10, speed11, speed12)
powerTotal = c(power08, power09, power10, power11, power12)


speeds = list(speed08, speed09, speed10, speed11, speed12, speedTotal)
powers = list(power08, power09, power10, power11, power12, powerTotal)

speedAnalysis <- function(speedList) {
  
  for (speed in speedList) {
    fit_w <- fitdist(speed, "weibull")
    fit_ln <- fitdist(speed, "lnorm")
    fit_g <- fitdist(speed, "gamma")
    
    x <- gofstat(list(fit_w, fit_ln, fit_g), fitnames = c("weibull", "lnorm", "gamma"))
    #weibull[nrow(weibull) + 1,] = x["ks"]
    print(x["ks"])
  }
  
}

powerAnalysis <- function(powerList) {
  
  for (power in powerList) {
    fit_n <- fitdist(power, "norm")
    fit_c <- fitdist(power, "cauchy")
    fit_l <- fitdist(power, "logis")
    
    x <- gofstat(list(fit_n, fit_c, fit_l), fitnames = c("Normal", "Cauchy", "Logis"))
    #weibull[nrow(weibull) + 1,] = x["ks"]
    print(x["ks"])
  }
  
}


summarize <- function(dataList) {
  for (data in dataList) {
    print(mean(data))
  }
  for (data in dataList) {
    print(sd(data))
  }
}

