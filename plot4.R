#reading the data
x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#reshaping the dataset
x$Date<-as.Date(x$Date,format="%d/%m/%Y")
xsub<-x[x$Date=="2007-02-01"|x$Date=="2007-02-02",]
Datetime<-as.POSIXlt(paste(xsub$Date, xsub$Time, sep=" "))
xsub<-cbind(xsub,Datetime)

#plotting
par(bg="transparent", mfrow=c(2,2), cex.main=0.75, cex.axis=0.75, cex.lab=0.75)
#plot1
with(xsub, plot(Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
#plot2
with(xsub, plot(Datetime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
#plot3
with(xsub, plot(Datetime, Sub_metering_1, col="black", type="l", xlab="", ylab="Energy sub metering"))
with(xsub, lines(Datetime, Sub_metering_2, col="red", type="l"))
with(xsub, lines(Datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, cex=0.7, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4
with(xsub, plot(Datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

#creating the PNG file
dev.copy(png, file="plot4.png")
dev.off()