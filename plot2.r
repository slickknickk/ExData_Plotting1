##########################################################################################################
#
## Coursera Exploratory Data Analysis Course Project 1 Plot 2
## Nick Greenhagen
## 2016-07-26
#
# plot2.r File Description:
# Plot Global Active Power (kilowatts) over time
#
##########################################################################################################

# Read only data for 2/1/2007 & 2/2/2007, covert Date & Time columns to Date/Time, Add column for combined DateTime
pwrConsumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = T, sep = ";")))
pwrConsumption$DateTime <- paste(pwrConsumption$Date, pwrConsumption$Time, sep = ":")
pwrConsumption$DateTime <- strptime(pwrConsumption$DateTime, "%d/%m/%Y:%H:%M:%S")
pwrConsumption$Date <- as.Date(pwrConsumption$Date, "%d/%m/%Y")
pwrConsumption$Time <- strptime(pwrConsumption$Time, "%H:%M:%S")

# Open png device, construct plot, close device
png("plot2.png")
plot(pwrConsumption$DateTime,pwrConsumption$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(pwrConsumption$DateTime,pwrConsumption$Global_active_power)
dev.off()