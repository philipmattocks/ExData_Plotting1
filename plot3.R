#read power data from file:
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter for the 2 days
power <- power[power$Date =="1/2/2007"|power$Date =="2/2/2007" ,]

#Get datetime
datetime <- strptime(paste0(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S") 

#Get submetering columns
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

#create plot device
png("plot3.png", width=480, height=480)

#plot graphs
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()