Electric <- read.csv("c:/users/martin.drdak/Downloads/exdata-data-household_power_consumption/household_power_consumption.csv",sep=";")
#names(Electric)
#head(Electric)
Electric$DateTime<-paste(Electric$Date,Electric$Time)
Electric$Date<-as.Date(Electric$Date,"%d/%m/%Y")
Electric$DateTime<-strptime(Electric$DateTime,"%d/%m/%Y %H:%M:%S")
Electric <- Electric[(Electric$Date == as.Date("1.2.2007","%d.%m.%Y")) | (Electric$Date == as.Date("2.2.2007","%d.%m.%Y")),]
setwd("~/GitHub/ExploratoryDataAnalysis/data")
write.csv(Electric,"Electric.csv")
