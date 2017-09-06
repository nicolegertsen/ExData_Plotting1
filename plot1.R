# Load data
setwd("C:/Users/WH437EQ/Documents/datascience/")
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE, dec = ".")
data.subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create plot
global.act.power <- as.numeric(data.subset$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(global.act.power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()