##Read in data and format date/time fields

setwd("H:/My Documents/Coursera/Exploratory Data Analysis")
data <- read.table("./household_power_consumption.txt",header=FALSE,sep=";",na.strings="?",skip=66637,nrows=2880,stringsAsFactors = FALSE)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
datetime <- paste(data$Date,data$Time)
data$Time <- strptime(datetime,"%Y-%m-%d %H:%M:%S")

##Create Plot and write to PNG file

hist(data$Global_active_power, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
setwd("H:/My Documents/Coursera/Exploratory Data Analysis/ExData_Plotting1")
dev.copy(png, file = "Plot1.png")
dev.off()
setwd("H:/My Documents/Coursera/Exploratory Data Analysis")
