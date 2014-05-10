
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

plot(datetimes, relevant$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.copy(png,'plot2.png')
dev.off()