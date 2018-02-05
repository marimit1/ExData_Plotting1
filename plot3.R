#### plot3 
### set working directory
setwd("./R_specialization/ExData_Plotting1")

### load libraries
library(data.table)
library(sqldf)
library(lubridate)

### read data 
# download data
dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, destfile = "household_power_consumption.zip")
# unzip data set
unzip(zipfile="household_power_consumption.zip",exdir="household_power_consumption")
# read data for dates 1/2/2007 and 2/2/2007
DT <- read.csv.sql(file = "./household_power_consumption/household_power_consumption.txt", 
                   sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                   header = TRUE, sep = ";")

## work with dates
# transform date
DT$Date <- dmy(DT$Date)
# make date_time column
DT$date_time <- ymd_hms(paste(DT$Date, DT$Time))

# change local system to work with English names of weekdays
Sys.setlocale("LC_TIME", "English")
DT$weekday <- wday(DT$Date, label = TRUE)


### make plot3

# make plot
plot(DT$date_time, DT$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
lines(DT$date_time, DT$Sub_metering_1, col = "black") 
lines(DT$date_time, DT$Sub_metering_2, col = "red") 
lines(DT$date_time, DT$Sub_metering_3, col = "blue") 
legend("topright", lty = c("solid", "solid", "solid"), lwd = c(1,1,1), col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       cex = 0.6)

# save plot
dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()
