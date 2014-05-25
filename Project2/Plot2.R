data <- readRDS("summarySCC_PM25.rds")

barplot(tapply(data$Emissions[data$fips==24510],data$year[data$fips==24510],sum),xlab="year",ylab="emissions in Baltimore City", col=3)

dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()