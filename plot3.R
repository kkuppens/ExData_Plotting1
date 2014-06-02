#Step 1. Load all data from file into R
data <- read.csv('./data/household_power_consumption.txt', sep=";", na.strings="?")

#Step 2. Filter data set by the requested dates using subset and logical condition
# Create datetime variable and add to data frame.
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
# Get subset on two days in February, 2007
data <- subset(data, as.Date(datetime) >= as.Date("2007-02-01") &
                 as.Date(datetime) <= as.Date("2007-02-02"))

#Step 3. Create plot of Global Active Power over date and time and display to sceen device.
png(file = "plot3.png",height=480, width=480)

plot(data$datetime, data$Sub_metering_1, type="l",  xlab = "", ylab="Energy sub metering", col = "black")
points(data$datetime, data$Sub_metering_2, type="l", col="red")
points(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=c(1, 1, 1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"))
dev.off()