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

# Create a plot:

png(filename = "plot3.png")

plot(x = table$Datetime, y = as.numeric(as.character(table2$Sub_metering_1)),
          xlab = "",
          ylab = "Energy sub metering",
     # type l (line, no points)
          type = "l") 
legend("topright", lty = 1, col= c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#add the other 2 columns
lines(x = table$Datetime, y = as.numeric(as.character(table2$Sub_metering_2)),
      col = "red")
lines(x = table$Datetime, y = as.numeric(as.character(table2$Sub_metering_3)),
      col = "blue")
dev.off()

      