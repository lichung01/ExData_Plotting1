## Assumption:  You have downloaded "exdata-data-household_power_consumption.zip" and
##              the contents are unzipped into the same working directory with this script.


# The requirement for this project is to use data from the dates 2007-02-01 to 2007-02-02
useDateRange <- seq(as.Date("2007-02-01"), by=1, len=2)

# Read the data file, remove invalid rows with "?" 
# and use subset() by UseDateRange to select only those rows that are within our date range.
data <- subset(read.csv("household_power_consumption.txt", sep=";", dec = ".", header = TRUE, stringsAsFactors=FALSE, na.strings="?"), as.Date(Date, "%d/%m/%Y") %in% useDateRange)

# Open PNG device (size 480 by 480) and create file "plot1.png" in my working directory.
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

# Plot the histogram
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# Close the PNG file device.
dev.off()
