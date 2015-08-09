dt <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")


## changing the format in Time column to POSIXlt and Date column to Date

dates <- dt$Date
times <- dt$Time
x <- paste(dates, times)
dt$Time <- strptime(x, "%d/%m/%Y %H:%M:%S")
dt$Date <- as.Date(dt$Date, "%d/%m/%Y")

## subsetting required dates
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

dts <- dt[dt$Date >= date1 & dt$Date <= date2, ]

## building plot1
par(mar = c(5.1, 5.1, 4.1, 2.1))
par(cex = 0.8)
par(mfrow = c(1, 1))
hist(as.numeric(dts$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")


## saving file
dev.copy(png, file = "plot1.png")
dev.off()