powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")
subset <- powerConsumption[powerConsumption$Date >= "2007-02-01" & powerConsumption$Date <= "2007-02-02", ]
subset$Global_active_power <- as.numeric(levels(subset$Global_active_power)[subset$Global_active_power])
par(cex.lab = 0.8, cex.axis = 0.8)
hist(subset$Global_active_power[!is.na(subset$Global_active_power)], col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
