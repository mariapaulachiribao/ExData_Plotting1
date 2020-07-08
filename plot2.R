# names to the columns:

names(household_energy) <- c("Date", "Time", "Global_active_power",
                             "Global_reactive_power", "Voltage",
                             "Global_intensity", "Sub_metering_1",
                             "Sub_metering_2", "Sub_metering_3")

# filter the table per Date

household_energy$Date <- as.Date(household_energy$Date, format = "%d/%m/%Y")

table <- subset(household_energy, Date >= "2007-02-01" 
                & Date <= "2007-02-02")

# create a new column date+time:
table$Date <- as.character(table$Date)
table$Time <- as.character(table$Time)

table$Datetime <- strptime(paste(table$Date, table$Time), "%Y-%m-%d %H:%M:%S")


# Create a plot using the new column: 

png(filename="plot2.png")
plot(x = table$Datetime, y = as.numeric(as.character(table2$Global_active_power)),
     xlab = "",
     ylab = "Global Active Power(kilowatts)",
     type = "l")
dev.off()