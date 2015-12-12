setwd("~/GitHub/ExData_Plotting1/")

fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="data/household_power_consumption.zip",mode="wb")
unzip("data/household_power_consumption.zip",exdir="data")

myDat <- read.table("data/household_power_consumption.txt",header=T,sep=";",na.strings = "?")
myDat <- myDat[myDat$Date %in% c("1/2/2007","2/2/2007"),]
myDat$dt <- strptime(paste(myDat$Date,myDat$Time),format="%d/%m/%Y %H:%M:%S")


png("plot1.png")
par(bg="transparent")
hist(myDat$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()