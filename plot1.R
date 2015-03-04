# Plot #1 - code from my 1st try

# Read data
data <- read.table("./R/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors =FALSE)

# Specify the data range
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Open file
png("plot1.png", width = 480, height = 480)

# Plot data
hist(as.numeric(data$Global_active_power), col="red", main = "Global Active Power",xlab="Global Active Power (kilowatts)")

# Close file
dev.off()
