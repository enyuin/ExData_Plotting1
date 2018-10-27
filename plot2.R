data <- "./data/household_power_consumption.txt"
dattable <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data_needed <- dattable[dattable$Date %in% c("1/2/2007", "2/2/2007"),]

dateTime <- strptime(paste(data_needed$Date, data_needed$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
globalActivePowerData <- as.numeric(data_needed$Global_active_power) 
png("plot2.png", width = 480, height = 480)
plot(dateTime, globalActivePowerData, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()