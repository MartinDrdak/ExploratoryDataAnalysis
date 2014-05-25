data <- readRDS("data/summarySCC_PM25.rds")
code <- readRDS("data/Source_Classification_Code.rds")


library(ggplot2)

sources<-aggregate(data$Emissions[data$SCC %in% code$SCC[grep("Veh",code$Short.Name)] & (data$fips==24510 | data$fips=="06037")] ~ data$year[data$SCC %in% code$SCC[grep("Veh",code$Short.Name)] & (data$fips==24510 | data$fips=="06037")] + data$fips[data$SCC %in% code$SCC[grep("Veh",code$Short.Name)] & (data$fips==24510 | data$fips=="06037")], data, sum)
colnames(sources)<-c("year","fips","emissions")
ggplot(sources, aes(x=factor(year),y=emissions,group=fips)) + geom_line(aes(colour=fips)) +
  ggtitle("Emissions by vehicle sources") + labs(x = "Years", y="Emissions") +
  scale_colour_manual (values=c("orange","black"), labels=c("Los Angeles County","Baltimore City"))


dev.copy(png,file="plot6.png",width=600,height=600)
dev.off()