
## Exploratory Data Analysis Project1

## Plot1 is to read household power consumption data and draw histogram

## assumption is power consumption data downloaded from below URL and unzipped
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

powerConsumptionData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting Data from the dates 2007-02-01 and 2007-02-02

dataSet <- powerConsumptionData[powerConsumptionData$Date %in% c("1/2/2007","2/2/2007") ,]

## str(subSetData)
globalActivePower <- as.numeric(dataSet$Global_active_power)
png("plot1.png", width=600, height=600)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
