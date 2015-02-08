## Getting data
powerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## Subsetting data by date
powerConsumptionShort <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Format dates
completedate <- paste(as.Date(powerConsumptionShort$Date), powerConsumptionShort$Time)
powerConsumptionShort$completedate <- as.POSIXct(completedate)


## Plot 2
plot(powerConsumptionShort$Global_active_power~powerConsumptionShort$completedate, type="l",
     ylab="Global Active Power(kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
