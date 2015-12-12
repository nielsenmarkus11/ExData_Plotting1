setwd("~/GitHub/ExData_Plotting1/")

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data/household_power_consumption.zip",mode="wb")
unzip("data/household_power_consumption.zip",exdir="data")

myDat <- read.table("data/household_power_consumption.txt",header=T,sep=";",na.strings = "?")
myDat <- myDat[myDat$Date %in% c("1/2/2007","2/2/2007"),]
myDat$dt <- strptime(paste(myDat$Date,myDat$Time),format="%d/%m/%Y %H:%M:%S")


png("plot4.png")
par(mfrow=c(2,2),bg="transparent")
plot(x=myDat$dt ,y=myDat$Global_active_power,type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)")


plot(x=myDat$dt ,y=myDat$Voltage,type="l",
     main="",
     xlab="datetime",
     ylab="Voltage")

with(myDat,plot(x=dt ,y=Sub_metering_1,type="l",
     main="",
     xlab="",
     ylab="Energy sub metering"))
with(myDat,points(x=dt ,y=Sub_metering_2,type="l",col="red"))
with(myDat,points(x=dt ,y=Sub_metering_3,type="l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),box.col = "transparent",
       lty=1)

plot(x=myDat$dt ,y=myDat$Global_reactive_power,type="l",
     main="",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
