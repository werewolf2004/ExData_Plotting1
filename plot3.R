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

dts <- dt[dt$Date >= dateE1 & dt$Date <= date2, ]


## setting locale to English (to display days)
Sys.setlocale("LC_ALL", "English")

## building plot3
par(mar = c(5.1, 5.1, 4.1, 2.1))
par(cex = 0.8)

plot(dts$Time, dts$Sub_metering_1, type = "n", pch = NA_integer_,  xlab = "", ylab = "Energy sub metering")
points(dts$Time, dts$Sub_metering_1, type = "o", pch = NA_integer_)
points(dts$Time, dts$Sub_metering_2, type = "o", pch = NA_integer_, col = "red")
points(dts$Time, dts$Sub_metering_3, type = "o", pch = NA_integer_, col = "blue")

legend("topright", pch = NA_integer_, lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## saving file
dev.copy(png, file = "plot3.png")
dev.off()