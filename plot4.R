## Assumption:  You have downloaded "exdata-data-household_power_consumption.zip" and
##              the contents are unzipped into the same working directory with this script.


# The requirement for this project is to use data from the dates 2007-02-01 to 2007-02-02
useDateRange <- seq(as.Date("2007-02-01"), by=1, len=2)

# Read the data file, remove invalid rows with "?" 
# and use subset() by UseDateRange to select only those rows that are within our date range.
data <- subset(read.csv("household_power_consumption.txt", sep=";", dec = ".", header = TRUE, stringsAsFactors=FALSE, na.strings="?"), as.Date(Date, "%d/%m/%Y") %in% useDateRange)

# Extract datetime variable and paste it to dateTime as single field
dateTimeVar <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Column bind dateTime with original data table for plotting.
data <- cbind(dateTimeVar, data)

# Open PNG device (size 480 by 480) and create file "plot4.png" in my working directory.
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")


# Indicate to use 2 rows and 2 columns (fill rows first) for display.
par(mfrow = c(2, 2))

# Optimise coding to plot 4 charts
with(data, {
  # Create top left number 1 Plot
  plot(dateTimeVar, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  
  # Create top right number 2 Plot
  plot(dateTimeVar, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  
  # Create bottom left number 3 plot
  plot(dateTimeVar, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(dateTimeVar, Sub_metering_1, col = "black")
  lines(dateTimeVar, Sub_metering_2, col = "red")
  lines(dateTimeVar, Sub_metering_3, col = "blue")
  legend("topright", lwd=1, bty = "n", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # Create bottom right number 4 plot
  plot(dateTimeVar, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

# Close the PNG file device.
dev.off()


