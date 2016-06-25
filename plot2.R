##Load data and prepare data
h <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
h$Date <- as.Date(h$Date, format="%d/%m/%Y")
h <- subset(h, Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))
h$DateTime <- strptime(paste(h$Date, h$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

#Draw plot one
png(filename = "plot2.png", height = 480, width = 480)
plot(h$DateTime, h$Global_active_power, ylab="Global Active Power (kilowatts)",type="l", xlab = "")
dev.off()