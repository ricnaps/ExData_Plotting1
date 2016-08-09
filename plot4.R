powerData<- read.table("d:/documents/r/household_power_consumption.txt", header=TRUE, sep=";")
subsetPowerData <- data[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subsetPowerData$Date, subsetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalPowerData <- as.numeric(subsetPowerData$Global_active_power)
globalPowerReactiveData <- as.numeric(subsetPowerData$Global_reactive_power)
voltage <- as.numeric(subsetPowerData$Voltage)
subMeter1 <- as.numeric(subsetPowerData$Sub_metering_1)
subMeter2 <- as.numeric(subsetPowerData$Sub_metering_2)
subMeter3 <- as.numeric(subsetPowerData$Sub_metering_3)

png("plot4.png", width=480, height=480)

plot(datetime, globalPowerData, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalPowerReactiveData, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()