#base plot
library(datasets)
data(cars)
with(cars, plot(speed, dist))

#lattice plot
library(lattice)
state<-data.frame(state.x77,region=state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))


#ggplot2
library(ggplot2)
data(mpg)
qplot(displ, hwy, data=mpg)

#examples

summary(state$Income)

#boxplot
#state$Income
boxplot(state$Income, col="blue")
#state$Population
boxplot(state$Population, col="blue")

#Histogram
#state$Income
hist(state$Income, col="green")
abline(v=median(state$Income), col="red", lwd=4)
#state$Population
hist(state$Population, col="green")
#rug
hist(state$Income, col="green")
rug(state$Income)
#breaks
hist(state$Income, col="green", breaks=50)
rug(state$Income)



#2 boxpolots
boxplot(Income ~ region, data = state, col ="red")



#scatterplot
with(state, plot(Murder, Income))
abline(h=median(state$Income), lwd=2, lty=2, col="red")


with(state, plot(Murder, Income, col=region))




library(datasets)

hist(airquality$Ozone)

with(airquality, plot(Wind, Ozone))

airquality <- transform(airquality, Month= factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone (ppb)")


with(airquality, plot(Wind, Ozone))
title(main="Ozone and Winf in New Yoork City")


with(airquality, plot(Wind, Ozone, main="Ozone and Winf in New Yoork City"))
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))



with(airquality, plot(Wind, Ozone, main="Ozone and Winf in New Yoork City", type="n"))
with(subset(airquality, Month==5), points(Wind, Ozone, col="blue"))
with(subset(airquality, Month!=5), points(Wind, Ozone, col="red"))
legend("topright", pch=1, col= c("blue","red"), legend = c("May","Other Months"))



with(airquality, plot(Wind, Ozone, main="Ozone and Winf in New Yoork City", pch=1))

with(airquality, plot(Wind, Ozone, main="Ozone and Winf in New Yoork City", pch=2))

with(airquality, plot(Wind, Ozone, main="Ozone and Winf in New Yoork City", pch=3))

with(airquality, plot(Wind, Ozone, main="Ozone and Winf in New Yoork City", pch=20))
model <- lm(Ozone~Wind, airquality)
abline(model, lwd=1, col="red")



par(mfrow = c(1,2))
with(airquality, {
  plot(Wind, Ozone, main="Ozone and Wind") 
  plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
})


par(mfrow = c(1,3), mar= c(4,4,2,1), oma=c(0,0,2,0))
with(airquality, {
  plot(Wind, Ozone, main="Ozone and Wind") 
  plot(Solar.R, Ozone, main="Ozone and Solar Radiation")
  plot(Temp, Ozone, main="Ozone and Temperature")
  mtext("Ozone and Weater in New York City", outer=TRUE)
})


x<-rnorm(100)
hist(x)
y<-rnorm(100)

plot(x,y)


example(points)



x<-rnorm(100)
y<-rnorm(100)
plot(x,y)
title("test")
text(-2,2,"lala")


#PDF
#1 open
pdf(file="testPlot.pdf")
#2. create classical plot ...
plot(x,y)
title("test")
text(-2,2,"lala")
#3 close
dev.off()



