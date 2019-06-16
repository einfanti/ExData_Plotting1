# Exploratory data analyses for the Electric power consumption dataset
# How does household energy usage vary between 1 and 2 February 2007.
# The script loads the data, reproduces plot 2 (plot) and saves it to a png file

# load data assuming data is in the function folder
fileName <-"household_power_consumption.txt"
powerdata<-read.table(fileName,sep=";",header=TRUE) 

# subset table for dates: 01/02/2007 - 02/02/2007 and get global active power data
powerdata_feb <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")
Global_active_power <- as.numeric(as.character(powerdata_feb$Global_active_power))

dayLabels<- weekdays.Date(as.Date(c("2007/02/01","2007/02/02","2007/02/03")), abbreviate = TRUE) #Find weekday for the relevant dates
startNewDay <- which(c(powerdata_feb$Time=="00:00:00", TRUE)) # Find the index of the first measurement of each day, add one value for 2007/01/03

# open png file & and draw plot of global active power by time
png(filename = "plot2.png", width = 480, height = 480)
par(xaxt="n")
plot(Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
par(xaxt="s"); axis(1, at=startNewDay, labels=dayLabels)
dev.off()

