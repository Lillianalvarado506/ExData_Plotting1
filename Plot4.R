## Getting data
powerConsumption <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## Subsetting data by date
powerConsumptionShort <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Format dates
completedate <- paste(as.Date(powerConsumptionShort$Date), powerConsumptionShort$Time)
powerConsumptionShort$completedate <- as.POSIXct(completedate)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerConsumptionShort, {
    plot(Global_active_power~completedate, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~completedate, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~completedate, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~completedate,col='Red')
    lines(Sub_metering_3~completedate,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~completedate, type="l", 
         ylab="Global_rective_power",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
