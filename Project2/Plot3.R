library(ggplot2)
data <- readRDS("summarySCC_PM25.rds")
sources<-aggregate(data$Emissions[data$fips==24510] ~ data$type[data$fips==24510]+data$year[data$fips==24510] , data, sum)
colnames(sources)<-c("type","year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=type)) + geom_line(aes(colour=type)) + ggtitle("Emissions in Baltimore City") + labs(x = "Years", y="Emissions")

dev.copy(png,file="plot3.png",width=600,height=600)
dev.off()