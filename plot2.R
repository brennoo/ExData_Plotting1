# plot #2

# Read data
data <- read.table("./R/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

# Convert date
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Specify data range
data <- subset(data, as.Date(DateTime) >= as.Date("2007-02-01") & as.Date(DateTime) <= as.Date("2007-02-02"))

# Open file
png("plot2.png", height=480, width=480)

# Start plot
plot(data$DateTime, data$Global_active_power,pch=NA, xlab="", ylab="Global Active Power (kilowatts)")

# Add lines
lines(data$DateTime, data$Global_active_power)

# Close file
dev.off()
