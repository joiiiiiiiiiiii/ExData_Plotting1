# Produce figure 2

# Read file
fileName <- "household_power_consumption.txt"
dataSet <- read.table(fileName, header = T, sep =";", na.strings = "?")

# Format Date & Time
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")
dataSet$Time <- paste(dataSet$Date,dataSet$Time)
	
# Subset for dates between 2007-02-01 && 2007-02-02
dataSet <- subset(dataSet, dataSet$Date >= as.Date("2007-02-01"))
dataSet <- subset(dataSet, dataSet$Date <= as.Date("2007-02-02"))

# Open png device and plot graph with an adequate class for dataSet$time
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(as.POSIXct(dataSet$Time),
	dataSet$Global_active_power,
	type ="l",
	xlab ="", ylab ="Global Active Power (kilowatts)")

# close device
dev.off()


