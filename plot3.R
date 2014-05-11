#PrepareData.R for preparing original data

setwd("~/GitHub/ExploratoryDataAnalysis/data")
Electric <- read.csv("Electric.csv",)
Electric$Datetime<-as.POSIXct(strptime(Electric$DateTime,"%Y-%m-%d %H:%M:%S"))

par(oma=c(2,2,2,4))               

with(Electric, plot(Datetime, Sub_metering_1,  type="l", col="black",
                    ylim=c(0,40),
                    ylab="Energy sub metering",                   
                    xlab=""    
                    
                    ))

par(new=T,                        
    oma=c(2,2,2,4))               

with(Electric, plot(Datetime, Sub_metering_2,  type="l", col="red",
                    yaxt="n",                  
                    ylab="",                   
                    xlab="",    
                    ylim=c(0,40)
                    ))


par(new=T,                        
    oma=c(2,2,2,4))               
with(Electric, plot(Datetime, Sub_metering_3,  type="l", col="blue",
                    yaxt="n",                  
                    ylab="",                   
                    xlab="",                   
                    ylim=c(0,40)
))


# Add a legend to the plot
legend("topright",                       
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),      # Legend labels
       col=c("black", "red", "blue"),   
       lty=c(1,1,1),                    
       lwd=c(1,1,1)
)


#axis.Date(1, Electric$Datetime, format = "%d.%m.%Y" )

setwd("..")
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()



