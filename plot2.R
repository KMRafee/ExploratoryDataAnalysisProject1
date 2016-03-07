## Exploratory Data Analysis Project1

## assumption is power consumption data downloaded from below URL and unzipped
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

powerConsumptionData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting Data from the dates 2007-02-01 and 2007-02-02

dataSet <- powerConsumptionData[powerConsumptionData$Date %in% c("1/2/2007","2/2/2007") ,]


# striptime to get date and time in the desired format
datetime <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=600, height=600)
plot(datetime, globalActivePower, type="l", main="Global Active Power", xlab="days", ylab="Global Active Power (kilowatts)")
dev.off()