## Exploratory Data Analysis Project1


## assumption is power consumption data downloaded from below URL and unzipped
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

powerConsumptionData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting Data from the dates 2007-02-01 and 2007-02-02

dataSet <- powerConsumptionData[powerConsumptionData$Date %in% c("1/2/2007","2/2/2007") ,]


# striptime to get date and time in the desired format
datetime <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSet$Global_active_power)
globalReactivePower <- as.numeric(dataSet$Global_reactive_power)
voltage <- as.numeric(dataSet$Voltage)

subMetering1 <- as.numeric(dataSet$Sub_metering_1)
subMetering2 <- as.numeric(dataSet$Sub_metering_2)
subMetering3 <- as.numeric(dataSet$Sub_metering_3)

png("plot4.png", width=600, height=600)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()