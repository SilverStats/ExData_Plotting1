
power <- read.table("household_power_consumption.txt", sep = ";",
                    col.names = c("Date", "Time", "Global_active_power",
                                  "Global_reactive_power", "Voltage",
                                  "Global_intensity", "Sub_metering_1",
                                  "Sub_metering_2", "Sub_metering_3"),
                    na.strings = "?", skip = 66600)
## use the right dates
relevant <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

## format date correctly
datetimes <- strptime(paste(relevant$Date, relevant$Time),
                      format = "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2, 2))

## first plot
plot(datetimes, relevant$Global_active_power,
     xlab = "", ylab = "Global Active Power",
     type = "l")

## second plot
plot(datetimes, relevant$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering",
     type = "l")

lines(datetimes, relevant$Sub_metering_2,
      type = "l", col = "red")

lines(datetimes, relevant$Sub_metering_3,
      type = "l", col = "blue")

legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

## third plot
plot(datetimes, relevant$Voltage,
     xlab = "datetime", ylab = "Voltage", type = "l")

## fourth plot
plot(datetimes, relevant$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power",
     type = "l")

## write file
dev.copy(png, "plot4.png")
dev.off()
