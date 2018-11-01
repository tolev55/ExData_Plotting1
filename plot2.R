library("data.table")
setwd("/Users/toto/Documents/coursera/data scientist/exploratory")

#Load data defining "?" as NA string
PowerData <- data.table::fread(input ="household_power_consumption.txt",na.strings="?")

#Round and format numeric data
PowerData[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# transform time data in POSIXct date format that could be used to graph and filter measurements by date and time
PowerData[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# get data only for the 2 days that we are studying
PowerData <- PowerData[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

# define graph picture format
png("plot2.png", width=480, height=480)

## Generate the plot2 graph
plot(x=PowerData[, dateTime], y=PowerData[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

#close graph picture output device
dev.off()