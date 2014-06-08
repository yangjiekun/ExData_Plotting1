## Coursera, Exploratory Data Analysis, Project 1

setwd("~/Documents/My Documents/coursera/Exploratory_Data_Analysis/Week_1")

powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- paste(powerData$Date, powerData$Time, sep = ", ")
powerData$Time <- strptime(powerData$Time, format = "%Y-%m-%d, %H:%M:%S")

power2Day <- powerData[powerData$Date == as.Date(c("2007-02-01")) | powerData$Date == as.Date(c("2007-02-02")),]

png("plot3.png")
with(power2Day, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(power2Day, lines(Time, Sub_metering_2, col = "red"))
with(power2Day, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()