# Load data
setwd("C:/Users/WH437EQ/Documents/datascience/")
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Transform date format
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Create plot
global.act.power <- as.numeric(data.subset$Global_active_power)
global.reactive.power <- as.numeric(data.subset$Global_reactive_power)
voltage <- as.numeric(data.subset$Voltage)
subMetering1 <- as.numeric(data.subset$Sub_metering_1)
subMetering2 <- as.numeric(data.subset$Sub_metering_2)
subMetering3 <- as.numeric(data.subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global.act.power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global.reactive.power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

