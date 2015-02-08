
## Getting data
powerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## Subsetting data by date
powerConsumptionShort <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Format dates
completedate <- paste(as.Date(powerConsumptionShort$Date), powerConsumptionShort$Time)
powerConsumptionShort$completedate <- as.POSIXct(completedate)

## Plot histogram
hist(powerConsumptionShort$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
