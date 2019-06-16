# Exploratory data analyses for the Electric power consumption dataset
# How does household energy usage vary between 1 and 2 February 2007.
# The script loads the data, reproduces plot 1 (histogram) and saves it to a png file

# load data assuming data is in the function folder
fileName <-"household_power_consumption.txt"
powerdata<-read.table(fileName,sep=";",header=TRUE) 

# subset table for dates: 01/02/2007 - 02/02/2007 and get global active power data
powerdata_feb <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")
#strptime(as.Date(data$Date))


Global_active_power <- as.numeric(as.character(powerdata_feb$Global_active_power))

# open png file & and draw histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(Global_active_power,col="red", main = "Global active power", xlab="Global Active Power (kilowatts)")
title(main = "Global active power")
dev.off()

