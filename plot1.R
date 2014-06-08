## Coursera, Exploratory Data Analysis, Project 1

setwd("~/Documents/My Documents/coursera/Exploratory_Data_Analysis/Week_1")

powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
powerData$Time <- paste(powerData$Date, powerData$Time, sep = ", ")
powerData$Time <- strptime(powerData$Time, format = "%Y-%m-%d, %H:%M:%S")

power2Day <- powerData[powerData$Date == as.Date(c("2007-02-01")) | powerData$Date == as.Date(c("2007-02-02")),]

png("plot1.png")
hist(power2Day$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()