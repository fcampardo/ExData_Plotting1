#read data from household_power_consumption.txt and then subset only from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Plot Global Active Power usage in the date range.
#Need to convert to time both Date and Time fields.  
#weekdays name will be in italian due to my locale specific settings used by strptime...
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=504, height=504)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()