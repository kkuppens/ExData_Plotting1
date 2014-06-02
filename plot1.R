#Step 1. Load all data from file into R
data <- read.csv('./data/household_power_consumption.txt', sep=";", na.strings="?")

#Step 2. Filter data set by the requested dates using subset and logical condition
# Create datetime variable and add to data frame.
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
# Select data for first and second of February 2007
data <- subset(data, as.Date(datetime) >= as.Date("2007-02-01") &
                 as.Date(datetime) <= as.Date("2007-02-02"))
#Create png graphic device with resolution 480x480 
png(file = "plot1.png", height=480, width=480)
#Step 3. Create histogram and display to sceen device.
# Set title, add description for x-axis, set color to red color.
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off() #close device