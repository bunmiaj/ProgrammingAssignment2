# Clear workspace
rm(list=ls())
myData<- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character" )

myData[,1]<- as.Date(myData$Date, "%d/%m/%Y")

# Create data subset for period between 2007-02-01 and 2007-02-02
MysubData <- subset(myData, myData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

#Create Date & Time Variable
MysubData$DateTime <- as.POSIXct(paste(MysubData$Date, MysubData$Time), format="%Y-%m-%d %H:%M:%S")

MysubData[,3] <- as.numeric(MysubData[,3])
MysubData[,4] <- as.numeric(MysubData[,4])
MysubData[,5] <- as.numeric(MysubData[,5])
MysubData[,6] <- as.numeric(MysubData[,6])
MysubData[,7] <- as.numeric(MysubData[,7])
MysubData[,8] <- as.numeric(MysubData[,8])
MysubData[,9] <- as.numeric(MysubData[,9])

# Create plot 3
plot(MysubData$DateTime, MysubData[,7], type = "l", xlab = " ", ylab = "Energy sub metering")
lines(MysubData[,10], MysubData[,8], col = "Red")
lines(MysubData[,10], MysubData[,9], col = "Blue")
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black","Red","Blue"), lwd = 1)


# Generate PNG file copy
dev.copy(png,file="plot3.png")

dev.off()
