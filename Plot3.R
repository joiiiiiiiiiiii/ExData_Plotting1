# Produce figure 3

# Read file
fileName <- "household_power_consumption.txt"
dataSet <- read.table(fileName, header = T, sep =";", na.strings = "?")

# Format Date & Time
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")
dataSet$Time <- paste(dataSet$Date,dataSet$Time)
	
# Subset for dates between 2007-02-01 && 2007-02-02
dataSet <- subset(dataSet, dataSet$Date >= as.Date("2007-02-01"))
dataSet <- subset(dataSet, dataSet$Date <= as.Date("2007-02-02"))

# Open png device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")

#Plot base graph with the first line
plot(as.POSIXct(dataSet$Time), dataSet$Sub_metering_1, type = "l", xlab ="", ylab ="Energy sub metering")

#add lines and legend to base plot
lines(as.POSIXct(dataSet$Time),dataSet$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(dataSet$Time),dataSet$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# close device
dev.off()

