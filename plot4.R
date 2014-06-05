powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
powerConsumption$Date <- as.character(powerConsumption$Date)
powerConsumption$Time <- as.character(powerConsumption$Time)
powerConsumption$Time <- strptime(paste(powerConsumption$Date,powerConsumption$Time), "%d/%m/%Y %H:%M:%S")
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")
subset <- powerConsumption[powerConsumption$Date >= "2007-02-01" & powerConsumption$Date <= "2007-02-02", ]
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])
subset$Global_reactive_power <- as.numeric(levels(subset$Global_reactive_power)[subset$Global_reactive_power])
subset$Voltage <- as.numeric(levels(subset$Voltage)[subset$Voltage])
subset$Sub_metering_1 <- as.numeric(levels(subset$Sub_metering_1)[subset$Sub_metering_1])
subset$Sub_metering_2 <- as.numeric(levels(subset$Sub_metering_2)[subset$Sub_metering_2])
#subset$Sub_metering_3 <- as.numeric(levels(subset$Sub_metering_3)[subset$Sub_metering_3])
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), mgp = c(2, 1, 0), cex.lab = 0.7, cex.axis = 0.7)
with(subset, {
  
plot(Time, Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(Time, Voltage, type = "s", xlab = "datetime", ylab = "Voltage")

plot(Time, Sub_metering_1, type = "s", col = "black", xlab = "", ylab = "Energy sub metering")
points(Time, Sub_metering_2, type = "s", col = "red")
points(Time, Sub_metering_3, type = "s", col = "blue")
legend(cex=0.4, "topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))

plot(Time, Global_reactive_power, type = "s", xlab = "datetime", ylab = "Global_reactive_power")
})