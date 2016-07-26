##########################################################################################################
#
## Coursera Exploratory Data Analysis Course Project 1 Plot 1
## Nick Greenhagen
## 2016-07-26
#
# plot1.r File Description:
# Plot histogram for the frequency of Global Active Power (kilowatts)
#
##########################################################################################################

# Read only data for 2/1/2007 & 2/2/2007, covert Date & Time columns to Date/Time, Add column for combined DateTime
pwrConsumption <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", skip = 66637, nrows = 2880, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = T, sep = ";")))
pwrConsumption$DateTime <- paste(pwrConsumption$Date, pwrConsumption$Time, sep = ":")
pwrConsumption$DateTime <- strptime(pwrConsumption$DateTime, "%d/%m/%Y:%H:%M:%S")
pwrConsumption$Date <- as.Date(pwrConsumption$Date, "%d/%m/%Y")
pwrConsumption$Time <- strptime(pwrConsumption$Time, "%H:%M:%S")

# Open png device, construct plot, close device
png("plot1.png")
hist(pwrConsumption$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()