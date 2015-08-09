# Read in all the data
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.string = "?")

# Convert date and time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Subset the data for the two days
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

# Plot 1 and save as png file
png(file = "plot2.png", width = 480, height = 480)
plot(data$DateTime,data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()
