# Clear workspace
rm(list=ls())
myData<- read.table("household_power_consumption.txt", header=T, sep=";", colClasses="character" )

myData[,1]<- as.Date(myData$Date, "%d/%m/%Y")
myData[,2]<- as.Date(myData$Time, "%H/%M/%S")

# Create data subset for period between 2007-02-01 and 2007-02-02
MysubData <- subset(myData, myData$Date %in% as.Date(c("2007-02-01","2007-02-02")))

MysubData[,3] <- as.numeric(MysubData[,3])
MysubData[,4] <- as.numeric(MysubData[,4])
MysubData[,5] <- as.numeric(MysubData[,5])
MysubData[,6] <- as.numeric(MysubData[,6])
MysubData[,7] <- as.numeric(MysubData[,7])
MysubData[,8] <- as.numeric(MysubData[,8])
MysubData[,9] <- as.numeric(MysubData[,9])

# Plot 1 
hist(MysubData[,3], col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Generate a PNG file
dev.copy(png,file="plot1.png")
dev.off()