#round(2075256*9*8/2^{20}/1024, 2)
#0.14 GB

data <- read.csv("C:/Users/admin/Desktop/Coursera R Prog/Houshold_power/household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE)
head(data)

library(lubridate)
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data <- tbl_df(data)
data <- filter(data, Date==ymd("2007-02-01") | Date==ymd("2007-02-02"))
unique(data$Date)

#dim(data)
#View(data)

hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "indianred1")





