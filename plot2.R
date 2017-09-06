# Load data
setwd("C:/Users/WH437EQ/Documents/datascience/")
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Transform date format
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Create plot
global.act.power <- as.numeric(data.subset$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, global.act.power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()