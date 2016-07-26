##########################################################################################################
#
## Coursera Exploratory Data Analysis Course Project 1 Plot 4
## Nick Greenhagen
## 2016-07-26
#
# plot4.r File Description:
# Plot Global Active Power (kilowatts) over time
# Plot sub metering over time
# Plot voltage over time
# Plot Global reactive power over time
#
##########################################################################################################

# Read only data for 2/1/2007 & 2/2/2007, covert Date & Time columns to Date/Time, Add column for combined DateTime
pwrConsumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = T, sep = ";")))
pwrConsumption$DateTime <- paste(pwrConsumption$Date, pwrConsumption$Time, sep = ":")
pwrConsumption$DateTime <- strptime(pwrConsumption$DateTime, "%d/%m/%Y:%H:%M:%S")
pwrConsumption$Date <- as.Date(pwrConsumption$Date, "%d/%m/%Y")
pwrConsumption$Time <- strptime(pwrConsumption$Time, "%H:%M:%S")

# Open png device
png("plot4.png")

# Set up plot window
par(mfcol=c(2,2))

# Plot Global Active Power over time
plot(pwrConsumption$DateTime,pwrConsumption$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
lines(pwrConsumption$DateTime,pwrConsumption$Global_active_power)

# Plot sub metering over time
plot(pwrConsumption$DateTime,pwrConsumption$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pwrConsumption$DateTime,pwrConsumption$Sub_metering_1)
lines(pwrConsumption$DateTime,pwrConsumption$Sub_metering_2, col="red")
lines(pwrConsumption$DateTime,pwrConsumption$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),lwd = c(1,1,1), col = c("black","red","blue"),bty = "n")

# Plot voltage over time
plot(pwrConsumption$DateTime,pwrConsumption$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(pwrConsumption$DateTime,pwrConsumption$Voltage)

# Plot Global Reactive Power over time
plot(pwrConsumption$DateTime,pwrConsumption$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(pwrConsumption$DateTime,pwrConsumption$Global_reactive_power)

# Close device
dev.off()