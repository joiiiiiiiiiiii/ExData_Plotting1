# Produce figure 1

# Read file
fileName <- "household_power_consumption.txt"
dataSet <- read.table(fileName, header = T, sep =";", na.strings = "?")

# Format Date
dataSet$Date <- as.Date(dataSet$Date, format = "%d/%m/%Y")

# Subset for dates between 2007-02-01 && 2007-02-02
dataSet <- subset(dataSet, dataSet$Date >= as.Date("2007-02-01"))
dataSet <- subset(dataSet, dataSet$Date <= as.Date("2007-02-02"))

# Open png device and plot histogram
png(filename = "plot1.png",
    width = 480, height = 480, units = "px") 


hist(dataSet$Global_active_power, col = "red",
	xlab = "Global Active Power (kilowatts)",
	ylab = "Frequency",
	main ="Global Active Power")

# close device
dev.off()
