# Reading the data:

household_energy <- read.table("household_power_consumption.txt", skip = 1,
                               sep = ";")

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

# Create multiple plots:

png(filename = "plot4.png")
par(mfrow=c(2,2))
with(table, {
        #plot 1 - (idem "plot2.R")
        plot(x = table$Datetime, y = as.numeric(as.character(table2$Global_active_power)),
        xlab = "",
        ylab = "Global Active Power",
        # type l - line, no points
        type = "l")
        
        #plot 2
        plot(x = table$Datetime, y = as.numeric(as.character(table2$Voltage)),
             xlab = "datetime",
             ylab = "Voltage",
             type = "l")
        
        #plot 3 - (idem "plot3.R")
        plot(x = table$Datetime, y = as.numeric(as.character(table2$Sub_metering_1)),
             xlab = "",
             ylab = "Energy sub metering",
             # type l (line, no points)
             type = "l") 
        legend("topright", lty = 1, col= c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        lines(x = table$Datetime, y = as.numeric(as.character(table2$Sub_metering_2)),
              col = "red")
        lines(x = table$Datetime, y = as.numeric(as.character(table2$Sub_metering_3)),
              col = "blue")
        
        #plot 4
        plot(x = table$Datetime, y = as.numeric(as.character(table2$Global_reactive_power)),
             xlab = "datetime",
             ylab = "Global_reactive_power",
             type = "l")
})
dev.off()