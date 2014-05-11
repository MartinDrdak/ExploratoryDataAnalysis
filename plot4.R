#PrepareData.R for preparing original data

setwd("~/GitHub/ExploratoryDataAnalysis/data")
Electric <- read.csv("Electric.csv",)
Electric$Datetime<-as.POSIXct(strptime(Electric$DateTime,"%Y-%m-%d %H:%M:%S"))

par(mfrow = c(2,2))
with(Electric, {
  plot(Datetime, Global_active_power,  type="l",  ylab="Global active power (kilowatts)", xlab="")
  plot(Datetime, Voltage,  type="l",  ylab="Voltage", xlab="datetime")
  
  #plot(Datetime, Global_active_power,  type="l",  ylab="Global active power (kilowatts)", xlab="")
  
               
  plot(Datetime, Sub_metering_1,  type="l", col="black",
                      ylim=c(0,40),
                      ylab="Energy sub metering",                   
                      xlab=""    
                      
  )
  
  par(new=T)               
  
  plot(Datetime, Sub_metering_2,  type="l", col="red",
                      yaxt="n",                  
                      ylab="",                   
                      xlab="",    
                      ylim=c(0,40)
  )
  
  
  par(new=T)               
  plot(Datetime, Sub_metering_3,  type="l", col="blue",
                      yaxt="n",                  
                      ylab="",                   
                      xlab="",                   
                      ylim=c(0,40)
  )
    
  # Add a legend to the plot
  legend("topright",                       
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),      # Legend labels
         col=c("black", "red", "blue"),   
         lty=c(1,1,1),                    
         lwd=c(1,1,1)
  )
  
  par(new=F)
  plot(Datetime, Global_reactive_power,  type="l", xlab="datetime")
})


setwd("..")
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()