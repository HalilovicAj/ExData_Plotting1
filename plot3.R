library(dplyr)
library(lubridate)

#round(2075256*9*8/2^{20}/1024, 2)
#0.14 GB

data <- read.csv("C:/Users/admin/Desktop/Coursera R Prog/Houshold_power/household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
head(data)

data$Date <- as.character(data$Date)
data$Time <- as.character(data$Time)

data <- tbl_df(data)
data <- filter(data, Date==as.character("1/2/2007") | Date==as.character("2/2/2007"))
unique(data$Date)

data$Date_Time <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
head(data)

plot(data$Date_Time,data$Sub_metering_1, type="n",xlab="", ylab = "Energy sub metering")
lines(data$Date_Time,data$Sub_metering_1)
lines(data$Date_Time,data$Sub_metering_2, col="red")
lines(data$Date_Time,data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red","blue"), lty=c(1,1,1), cex=0.6)
