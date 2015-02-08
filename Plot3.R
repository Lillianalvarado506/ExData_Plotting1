## Getting data
powerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## Subsetting data by date
powerConsumptionShort <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Format dates
completedate <- paste(as.Date(powerConsumptionShort$Date), powerConsumptionShort$Time)
powerConsumptionShort$completedate <- as.POSIXct(completedate)

## Plot 3
with(powerConsumptionShort, {
    plot(Sub_metering_1~completedate, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~completedate,col='Red')
    lines(Sub_metering_3~completedate,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
