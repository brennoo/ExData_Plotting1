# plot3.R 

# Read data
data <- read.table("./R/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

# Convert dates
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Specify data range
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Open file
png("plot3.png", height=480, width=480)

# Start plot
plot(data$DateTime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")

# Add lines
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')

# Add legend
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))

# Close file
dev.off()
