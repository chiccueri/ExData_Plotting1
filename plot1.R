#reading the data
x<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=c(rep("character",2),rep("numeric",7)))

#reshaping the dataset
x$Date<-as.Date(x$Date,format="%d/%m/%Y")
xsub<-x[x$Date=="2007-02-01"|x$Date=="2007-02-02",]

#plotting
par(cex.main=0.75, cex.axis=0.75, cex.lab=0.75)
hist(xsub$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#creating the PNG file
dev.copy(png, file="plot1.png")
dev.off()