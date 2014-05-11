#reading the data
x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#reshaping the dataset
x$Date<-as.Date(x$Date,format="%d/%m/%Y")
xsub<-x[x$Date=="2007-02-01"|x$Date=="2007-02-02",]
Datetime<-as.POSIXlt(paste(xsub$Date, xsub$Time, sep=" "))
xsub<-cbind(xsub,Datetime)

#plotting
par(cex.main=0.77, cex.axis=0.77, cex.lab=0.77)
plot(xsub$Datetime, xsub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#creating the PNG file
dev.copy(png, file="plot2.png")
dev.off()