#PrepareData.R for preparing original data

setwd("~/GitHub/ExploratoryDataAnalysis/data")
Electric <- read.csv("Electric.csv",)
hist(Electric$Global_active_power,col="red",xlab="Global active power (kilowatts)", main="Global active power")
setwd("..")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()
