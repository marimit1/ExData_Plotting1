#### plot1
### set working directory
setwd("./R_specialization/ExData_Plotting1")

### load libraries
library(data.table)
library(sqldf)

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

### make plot1

# make plot
hist(DT$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", col = "red")

# save plot
dev.copy(png, file = "plot1.png", width = 480, height = 480) 
dev.off()
