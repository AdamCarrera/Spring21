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

plot.legend <- c("Weibull", "lognormal", "gamma")

fit_w <- fitdist(speedTotal, "weibull")
fit_ln <- fitdist(speedTotal, "lnorm")
fit_g <- fitdist(speedTotal, "gamma")

denscomp(list(fit_w, fit_ln, fit_g), legendtext = plot.legend)
qqcomp  (list(fit_w, fit_g, fit_ln), legendtext = plot.legend)

plot.legend <- c("Normal", "Cauchy", "Logis")

fit_n <- fitdist(powerTotal, "norm")
fit_c <- fitdist(powerTotal, "cauchy")
fit_l <- fitdist(powerTotal, "logis")

denscomp(list(fit_n, fit_c, fit_l), legendtext = plot.legend)
ppcomp(list(fit_n, fit_c, fit_l), legendtext = plot.legend)

gofstat(list(fit_n, fit_c, fit_l), fitnames = c("Normal", "Cauchy", "Logis"))
