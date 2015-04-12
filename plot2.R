mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
mydata <- subset(mydata,Date=="1/2/2007" | Date=="2/2/2007")
mydata$Global_active_power = as.numeric(as.character(mydata$Global_active_power)) 
mydata$datetime <- as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
plot(mydata$datetime,mydata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
# dev.copy(png,"plot2.png",width=480,height=480)
# dev.off()

