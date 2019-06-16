# Exploratory data analyses for the Electric power consumption dataset
# How does household energy usage vary between 1 and 2 February 2007.
# The script loads the data, reproduces plot 4 (subplots for different measures)
# and saves it to a png file

# load data assuming data is in the function folder
fileName <-"household_power_consumption.txt"
powerdata<-read.table(fileName,sep=";",header=TRUE) 

# subset table for dates: 01/02/2007 - 02/02/2007 and different data measures
powerdata_feb  <- subset(powerdata, powerdata$Date=="1/2/2007" | powerdata$Date=="2/2/2007")
Global_active_power   <- as.numeric(as.character(powerdata_feb$Global_active_power))
Voltage               <- as.numeric(as.character(powerdata_feb$Voltage))
Sub_metering_1        <- as.numeric(as.character(powerdata_feb$Sub_metering_1))
Sub_metering_2        <- as.numeric(as.character(powerdata_feb$Sub_metering_2))
Sub_metering_3        <- as.numeric(as.character(powerdata_feb$Sub_metering_3))
Global_reactive_power <- as.numeric(as.character(powerdata_feb$Global_reactive_power))

# get relevant date info
dayLabels<- weekdays.Date(as.Date(c("2007/02/01","2007/02/02","2007/02/03")), abbreviate = TRUE) #Find weekday for the relevant dates
startNewDay <- which(c(powerdata_feb$Time=="00:00:00", TRUE)) # Find the index of the first measurement of each day, add one value for 2007/01/03

# open png file & and draw plot of different measures of consumtion by time
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2),xaxt="n")

plot(Global_active_power, type="l", ylab="Global Active Power", xlab="")
par(xaxt="s"); axis(1, at=startNewDay, labels=dayLabels)

par(xaxt="n")
plot(Voltage, type="l", ylab="Voltage", xlab="datetime")
par(xaxt="s"); axis(1, at=startNewDay, labels=dayLabels)

par(xaxt="n")
plot(Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
points(Sub_metering_2, type="l", col="red")
points(Sub_metering_3, type="l", col="blue")
par(xaxt="s"); axis(1, at=startNewDay, labels=dayLabels)
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

par(xaxt="n")
plot(Global_reactive_power, type="l", ylab="Global reactive power", xlab="datetime")
par(xaxt="s"); axis(1, at=startNewDay, labels=dayLabels)

dev.off()

