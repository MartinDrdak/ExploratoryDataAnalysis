#PrepareData.R for preparing original data

setwd("~/GitHub/ExploratoryDataAnalysis/data")
Electric <- read.csv("Electric.csv",)
Electric$Datetime<-as.POSIXct(strptime(Electric$DateTime,"%Y-%m-%d %H:%M:%S"))

with(Electric, plot(Datetime, Global_active_power,  type="l",  ylab="Global active power (kilowatts)", xlab=""))


#axis.Date(1, Electric$Datetime, format = "%d.%m.%Y" )

#setwd("..")
#dev.copy(png,file="plot2.png",width=480,height=480)
#dev.off()



