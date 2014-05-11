# plot4.R

# Read data
data <- read.table("./R/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

# Convert dates
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Specify the data range
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") &
                 as.Date(DateTime) <= as.Date("2007-02-02"))

# Open file
png("plot4.png", height=480, width=480)

# set parameter for multiplot
par(mfrow=c(2,2))

# Start plot
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")

# Add lines
lines(data$DateTime, data$Global_active_power)


# Plot voltage
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)

# Add line
lines(data$DateTime, data$Voltage)

# Plot sub_metering
plot(data$DateTime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

# Add lines
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')

# Add legend
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

# last plot
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

# Close file
dev.off()
