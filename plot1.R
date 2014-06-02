#Step 1. Load all data from file into R
data <- read.csv('./data/household_power_consumption.txt', sep=";", na.strings="?")
#Step 2. Filter data set by the requested dates using a logical vector
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"), ]
#Step 3. Create histogram and display to sceen device.
#Set title, add description for x-axis, set color to red color.
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
#Step 4. Make copy of screen device output to file of type png, named plot1.png
#File we be created in default users primary work directory, see getwd().
dev.copy(png, file = "plot1.png")
dev.off()