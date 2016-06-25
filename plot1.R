##Load data
h <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F, na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
h$Date <- as.Date(h$Date, format="%d/%m/%Y")
h <- subset(h, Date >= as.Date("2007-02-01", format = "%Y-%m-%d") & Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))

#Draw plot one
png(filename = "plot1.png", height = 480, width = 480)
hist(h$Global_active_power, col = 554, border = 153,main = "Global Active Power", xlab="Global Active Power (kilowatts)",ylab = "Frequency", xaxt = 'n', breaks=20)
axis(side=1, at=seq(0,6,2), labels = c("0","2","4","6") , tick = TRUE)
dev.off()
