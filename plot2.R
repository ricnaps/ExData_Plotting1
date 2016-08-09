powerData<- read.table("d:/documents/r/household_power_consumption.txt", header=TRUE, sep=";")
subsetPowerData <- data[powerData$Date %in% c("1/2/2007","2/2/2007") ,]

dateTimeData <- strptime(paste(subsetPowerData$Date, subsetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalPowerData <- as.numeric(subsetPowerData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTimeData, globalPowerData, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()