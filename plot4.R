#read data from household_power_consumption.txt and then subset only from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Need to convert to time both Date and Time fields.  
#weekdays name will be in italian due to my locale specific settings used by strptime...
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Arrange 4 plots in a 2x2 graphics on a .png file
png("plot4.png", width=504, height=504)
par(mfrow = c(2, 2))
plot(datetime, subSetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, subSetData$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subSetData$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(datetime, subSetData$Sub_metering_2, type="l", col="red")
lines(datetime, subSetData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n", lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(datetime, subSetData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()