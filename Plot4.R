

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerConsumptionShort, {
    plot(Global_active_power~completedate, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~completedate, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~completedate, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~completedate,col='Red')
    lines(Sub_metering_3~completedate,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~completedate, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
