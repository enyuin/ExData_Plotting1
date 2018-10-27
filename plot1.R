data <- "./data/household_power_consumption.txt"
dattable <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
data_needed <- dattable[dattable$Date %in% c("1/2/2007", "2/2/2007"),]

globalActivePowerData <- as.numeric(data_needed$Global_active_power) 
png("plot1.png", width = 480, height = 480)
hist(globalActivePowerData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()