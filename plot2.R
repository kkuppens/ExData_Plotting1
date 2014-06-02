#Step 1. Load all data from file into R
data <- read.csv('./data/household_power_consumption.txt', sep=";", na.strings="?")
#Step 2. Filter data set by the requested dates using a logical vector
data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"), ]
#Step 3. Create date and time stamps  
x <- paste(data$Date, data$Time,sep = " ")
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
#Step 4. Create plot of Global Active Power over date and time and display to sceen device.
#Add description for y-axis, remove description for x-axis, use type lines.
plot(x, data$Global_active_power, type="l", xlab ="", ylab="Global Active Power (kilowatts)")
#Step 4. Make copy of screen device output to file of type png, named plot2.png
#File will be stored in users default primary work directory, see getwd().
dev.copy(png, file = "plot2.png")
dev.off()