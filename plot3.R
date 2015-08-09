# Read in all the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?")

# Convert date and time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Subset the data for the two days
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Plot 1 and save as png file
png(file = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
	lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
	lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
	legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
dev.off()
