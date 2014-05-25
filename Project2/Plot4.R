data <- readRDS("data/summarySCC_PM25.rds")
code <- readRDS("data/Source_Classification_Code.rds")
library(ggplot2)
sources<-aggregate(data$Emissions[data$SCC %in% code$SCC[grep("Coal",code$Short.Name)]] ~ data$year[data$SCC %in% code$SCC[grep("Coal",code$Short.Name)]] , data, sum)
colnames(sources)<-c("year","emissions")
ggplot(sources, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") +  ggtitle("Emissions by Coal Combustion") + labs(x = "Years", y="Emissions")

dev.copy(png,file="plot4.png",width=600,height=600)
dev.off()