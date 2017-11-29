##Read in data and format date/time fields

setwd("H:/My Documents/Coursera/Exploratory Data Analysis")
data <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",skip=66637,nrows=2880,stringsAsFactors = FALSE)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datetime <- paste(data$Date,data$Time)
data$Time <- strptime(datetime,"%Y-%m-%d %H:%M:%S")


##Set global parameters to create 4 plots (2 by 2), create plots and write to PNG

setwd("H:/My Documents/Coursera/Exploratory Data Analysis/ExData_Plotting1")
png("Plot4.png")
par(mfrow=c(2,2))

with(data,plot(Time,Global_active_power, ylab="GLobal Active Power", xlab="",type="n"))
with(data,lines(Time,Global_active_power))


with(data,plot(Time,Voltage, ylab="Voltage", xlab="datetime",type="n"))
with(data,lines(Time,Voltage))


with(data,plot(Time,Sub_metering_1, ylab="Energy sub metering", xlab="",type="n"))
with(data,lines(Time,Sub_metering_1))
with(data,lines(Time,Sub_metering_2,col="red"))
with(data,lines(Time,Sub_metering_3,col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")


with(data,plot(Time,Global_reactive_power,xlab="datetime",type="n"))
with(data,lines(Time,Global_reactive_power))

dev.off()
setwd("H:/My Documents/Coursera/Exploratory Data Analysis")
