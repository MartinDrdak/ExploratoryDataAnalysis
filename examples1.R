library(datasets)
with(airquality, plot(Wind, Ozone, type="l"))


with(beaver1, {
  time <- strptime(paste(1990, day, time %/% 100, time %% 100),
                   "%Y %j %H %M")
  plot(time, temp, type = "l") # axis at 4-hour intervals.
  # now label every hour on the time axis
  plot(time, temp, type = "l", xaxt = "n")
  r <- as.POSIXct(round(range(time), "hours"))
  axis.POSIXct(1, at = seq(r[1], r[2], by = "hour"), format = "%H")
})

plot(.leap.seconds, seq_along(.leap.seconds), type = "n", yaxt = "n",
     xlab = "leap seconds", ylab = "", bty = "n")
rug(.leap.seconds)
## or as dates
lps <- as.Date(.leap.seconds)
plot(lps, seq_along(.leap.seconds),
     type = "n", yaxt = "n", xlab = "leap seconds",
     ylab = "", bty = "n")
rug(lps)

## 100 random dates in a 10-week period
random.dates <- as.Date("2001/1/1") + 70*sort(stats::runif(100))
plot(random.dates, 1:100)
# or for a better axis labelling
plot(random.dates, 1:100, xaxt = "n")
axis.Date(1, at = seq(as.Date("2001/1/1"), max(random.dates)+6, "weeks"))
axis.Date(1, at = seq(as.Date("2001/1/1"), max(random.dates)+6, "days"),
          labels = FALSE, tcl = -0.2)



r=runif(1000)
d <- as.Date("2001/1/1") + 70*sort(r)
plot(d,r,type="l",xaxt="n")
axis.Date(1, at=seq(d[1],d[1000],"month"), format="%m/%d/%Y")



set.seed(53)
f <- rnorm(700, 2)
dates <- seq(as.Date("04/01/2012", format = "%d/%m/%Y"),
             by = "days", length = length(f))
head(f)
The plotting is slightly more involved but not much

op <- par(mar = c(7,4,4,2) + 0.1) ## more space for the labels
plot(dates, f, xaxt = "n", ann = FALSE)
labDates <- seq(as.Date("01/01/2012", format = "%d/%m/%Y"), tail(dates, 1),
                by = "months")
axis.Date(side = 1, dates, at = labDates, format = "%b %y", las = 2)
title(ylab = "f") ## draw the axis labels
title(xlab = "dates", line = 5) ## push this one down a bit in larger margin
par(op) ## reset margin