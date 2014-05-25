data <- readRDS("data/summarySCC_PM25.rds")
barplot(tapply(data$Emissions,data$year,sum),xlab="year",ylab="emissions",col=2)

dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()