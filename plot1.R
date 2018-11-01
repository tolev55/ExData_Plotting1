setwd("/Users/toto/Documents/coursera/data scientist/exploratory")
pwdata<-read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings = "?")

#subset data to get only measurements for the 2 days we are studying
pwdata<-subset(pwdata, Date == "1/2/2007" | Date == "2/2/2007")
#keep only complete lines of measurements in the dataaset
pwdata<-pwdata[complete.cases(pwdata),]

#convert date in r format with the good mask
pwdata$Date<-as.Date(pwdata$Date, "%d/%m/%Y")
#concat of date and time values
pwdata$datetime<-paste(pwdata$Date, pwdata$Time)
#convert global_active_power in numeric values
pwdata$Global_active_power<-as.numeric(pwdata$Global_active_power)
#build the plot1 histogram
hist(pwdata$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
#define histogram output
dev.copy(png, file="plot1.png", height=480, width=480)
#close histogram output device
dev.off()