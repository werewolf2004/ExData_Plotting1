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


## setting locale to English (to display days)
Sys.setlocale("LC_ALL", "English")

## building plot4

par(mfrow = c(2, 2), cex = 0.6)

plot(dts$Time, as.numeric(dts$Global_active_power), type = "o", pch = NA_integer_,  xlab = "", ylab = "Global Active Power (kilowatts)")

plot(dts$Time, dts$Voltage, type = "o", pch = NA_integer_,  xlab = "datetime", ylab = "Voltage")

plot(dts$Time, dts$Sub_metering_1, type = "n", pch = NA_integer_,  xlab = "", ylab = "Energy sub metering")
points(dts$Time, dts$Sub_metering_1, type = "o", pch = NA_integer_)
points(dts$Time, dts$Sub_metering_2, type = "o", pch = NA_integer_, col = "red")
points(dts$Time, dts$Sub_metering_3, type = "o", pch = NA_integer_, col = "blue")
legend("topright", pch = NA_integer_, lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(dts$Time, dts$Global_reactive_power, type = "o", pch = NA_integer_,  xlab = "datetime", ylab = "Global_reactive_power")


## saving file
dev.copy(png, file = "plot4.png")
dev.off()