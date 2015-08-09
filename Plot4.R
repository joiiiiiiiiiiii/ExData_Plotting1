# Produce figure 4

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
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

# 2 by 2 plots
par(mfrow=c(2,2))

# plot 1,1 (almost the same as plot 2 from assignment)
plot(as.POSIXct(dataSet$Time),
	dataSet$Global_active_power,
	type ="l",
	xlab ="", ylab ="Global Active Power")

# plot 1,2
plot(as.POSIXct(dataSet$Time),
	dataSet$Voltage,
	type ="l",
	xlab ="datetime", ylab ="Voltage")

# plot 2,1 (same as plot 1 from assignment)
plot(as.POSIXct(dataSet$Time), dataSet$Sub_metering_1, type = "l", xlab ="", ylab ="Energy sub metering")
lines(as.POSIXct(dataSet$Time),dataSet$Sub_metering_2, type = "l", col = "red")
lines(as.POSIXct(dataSet$Time),dataSet$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

# plot 2,2
plot(as.POSIXct(dataSet$Time),
	dataSet$Global_reactive_power,
	type ="l",
	xlab ="datetime", ylab ="Global_reactive_power")

# close device
dev.off()


