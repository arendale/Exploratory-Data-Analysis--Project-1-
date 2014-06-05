powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
powerConsumption$Date <- as.character(powerConsumption$Date)
powerConsumption$Time <- as.character(powerConsumption$Time)
powerConsumption$Time <- strptime(paste(powerConsumption$Date,powerConsumption$Time), "%d/%m/%Y %H:%M:%S")
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")
subset <- powerConsumption[powerConsumption$Date >= "2007-02-01" & powerConsumption$Date <= "2007-02-02", ]
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])
plot(subset$Time, subset$Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")