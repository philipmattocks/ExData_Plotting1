#read power data from file:
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter for the 2 days
power <- power[power$Date =="1/2/2007"|power$Date =="2/2/2007" ,]

#Get datetime
datetime <- strptime(paste0(subSetData$Date, subSetData$Time), "%d/%m/%Y %H:%M:%S") 

#Get globabl active power and convert to numeric
globalActivePower <- as.numeric(power$Global_active_power)

#create plot and output plot to it
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
