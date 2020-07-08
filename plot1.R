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

# Creating PNG plot (histogram): 

png(filename="plot1.png")
hist(as.numeric(as.character(table$Global_active_power)), main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "red", 
     xlim = c(0, 6),
     ylim = range(0, 1200))
dev.off()