##Load data and prepare data
h <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
h$Date <- as.Date(h$Date, format="%d/%m/%Y")
h <- subset(h, Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))
h$DateTime <- strptime(paste(h$Date, h$Time, sep = " "), "%Y-%m-%d %H:%M:%S")

#Draw plot one
png(filename = "plot3.png", height = 480, width = 480)
# First Line
plot(h$DateTime, h$Sub_metering_1, xlab = "", type = 'l', col = 'black', ylab = "Energy sub metering",
     yaxt = 'n', ylim = c(0,40))
# Second line.
lines(h$DateTime, h$Sub_metering_2, col = 'red', type = 'l')
# Third line.
lines(h$DateTime, h$Sub_metering_3, col = 'blue', type = 'l')
# Add Y labels.
axis(side = 2, at=seq(0,30,10), labels = c("0","10","20","30"), tick = TRUE, yaxs="i")
# Legend.
legend('topright', legend, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c('black','red','blue'), lty = c(1,1,1))

dev.off()
