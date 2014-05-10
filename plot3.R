power <- read.table("household_power_consumption.txt", sep = ";",
                    col.names = c("Date", "Time", "Global_active_power",
                                  "Global_reactive_power", "Voltage",
                                  "Global_intensity", "Sub_metering_1",
                                  "Sub_metering_2", "Sub_metering_3"),
                    na.strings = "?", skip = 66600)

relevant <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

datetimes <- strptime(paste(relevant$Date, relevant$Time),
                      format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(1, 1))

plot(datetimes, relevant$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering",
     type = "l")

lines(datetimes, relevant$Sub_metering_2,
      type = "l", col = "red")

lines(datetimes, relevant$Sub_metering_3,
      type = "l", col = "blue")

legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.copy(png, 'plot3.png')
dev.off()