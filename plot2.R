#Step 1. Load all data from file into R
data <- read.csv('./data/household_power_consumption.txt', sep=";", na.strings="?",header=T)

#Step 2. Filter data set by the requested dates using subset and logical condition
# Create datetime variable and add to data frame.
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
# Select data for first and second of February 2007 
data <- subset(data, as.Date(datetime) >= as.Date("2007-02-01") &
                 as.Date(datetime) <= as.Date("2007-02-02"))
#Create png graphic device with resolution 480x480 
png(file = "plot2.png", height=480, width=480)
#Step 3. Create histogram and display to screen device (png file).
#Add description for y-axis, remove description for x-axis, use type lines.
plot(data$datetime, data$Global_active_power, type="l", xlab ="", ylab="Global Active Power (kilowatts)")
dev.off() #close device