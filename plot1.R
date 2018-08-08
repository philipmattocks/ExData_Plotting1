#read power data from file:
power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#filter for the 2 days
power <- power[power$Date =="1/2/2007"|power$Date =="2/2/2007" ,]

#Get globabl active power and convert to numeric
globalActivePower <- as.numeric(power$Global_active_power)

#create plot and output histogram to it
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
