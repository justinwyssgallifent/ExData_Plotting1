mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
mydata <- subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")
mydata$Global_active_power = as.numeric(as.character(mydata$Global_active_power)) 
mydata$Sub_metering_1 = as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 = as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 = as.numeric(as.character(mydata$Sub_metering_3))
mydata$Voltage = as.numeric(as.character(mydata$Voltage))
mydata$Global_reactive_power = as.numeric(as.character(mydata$Global_reactive_power))
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))

# First plot
plot(mydata$datetime,mydata$Global_active_power,type="l",ylab="Global Active Power",xlab="")

# Second plot
plot(mydata$datetime,mydata$Voltage,type="l",ylab="Voltage",xlab="datetime")

# Third plot
plot(mydata$datetime,mydata$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(mydata$datetime,mydata$Sub_metering_2,col="red")
lines(mydata$datetime,mydata$Sub_metering_3,col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),cex=0.7,bty="n")

# Fourth plot
plot(mydata$datetime,mydata$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
axis(side=2,at=c(0.1))
axis(side=2,at=c(0.3))
axis(side=2,at=c(0.5))



# dev.copy(png,"plot4.png",width=480,height=480)
# dev.off()

