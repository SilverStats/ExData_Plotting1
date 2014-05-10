
power <- read.table("household_power_consumption.txt", sep = ";",
                    col.names = c("Date", "Time", "Global_active_power",
                                  "Global_reactive_power", "Voltage",
                                  "Global_intensity", "Sub_metering_1",
                                  "Sub_metering_2", "Sub_metering_3"),
                    na.strings = "?", skip = 66600)

relevant <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

par(mfrow = c(1, 1))

hist(relevant$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.copy(png,'plot1.png')
dev.off()