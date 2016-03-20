#read data from household_power_consumption.txt and then subset only from the dates 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#create a barchart with red bars for the Global_active_power data with the requestes title and x-label
#save it to .png and close the graphic device
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=504, height=504)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

