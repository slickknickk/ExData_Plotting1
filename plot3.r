##########################################################################################################
#
## Coursera Exploratory Data Analysis Course Project 1 Plot 3
## Nick Greenhagen
## 2016-07-26
#
# plot3.r File Description:
# Plot sub metering over time
#
##########################################################################################################

# Read only data for 2/1/2007 & 2/2/2007, covert Date & Time columns to Date/Time, Add column for combined DateTime
pwrConsumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = T, sep = ";")))
pwrConsumption$DateTime <- paste(pwrConsumption$Date, pwrConsumption$Time, sep = ":")
pwrConsumption$DateTime <- strptime(pwrConsumption$DateTime, "%d/%m/%Y:%H:%M:%S")
pwrConsumption$Date <- as.Date(pwrConsumption$Date, "%d/%m/%Y")
pwrConsumption$Time <- strptime(pwrConsumption$Time, "%H:%M:%S")

# Open png device, construct plot, close device
png("plot3.png")
plot(pwrConsumption$DateTime,pwrConsumption$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(pwrConsumption$DateTime,pwrConsumption$Sub_metering_1)
lines(pwrConsumption$DateTime,pwrConsumption$Sub_metering_2, col="red")
lines(pwrConsumption$DateTime,pwrConsumption$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),lwd = c(1,1,1), col = c("black","red","blue"))
dev.off()