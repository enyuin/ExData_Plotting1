data <- "./data/household_power_consumption.txt"
dattable <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data_needed <- dattable[dattable$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime <- strptime(paste(data_needed$Date, data_needed$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePowerData <- as.numeric(data_needed$Global_active_power)
subMetering_1 <- as.numeric(data_needed$Sub_metering_1)
subMetering_2 <- as.numeric(data_needed$Sub_metering_2)
subMetering_3 <- as.numeric(data_needed$Sub_metering_3)
voltage <- as.numeric(data_needed$Voltage)
globalReactivePowerData <- as.numeric(data_needed$Global_reactive_power)


png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(dateTime, globalActivePowerData, type = "l", xlab = "", ylab = "Global Active Power")

plot(dateTime, voltage,type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateTime, subMetering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dateTime, subMetering_2, type = "l", col = "red")
lines(dateTime, subMetering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(dateTime, globalReactivePowerData, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.off()