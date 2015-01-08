data <- read.table("household_power_consumption.txt",sep=";",header=TRUE)
data<-subset(data,Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
png("Plot4.png",bg="transparent")
#set up plots:
par(mfrow=c(2,2))
#plot top left:
plot(data$DateTime,as.numeric(as.character(data$Global_active_power)),type="n",xlab="",ylab="Global Active Power")
lines(data$DateTime,as.numeric(as.character(data$Global_active_power)))
#plot top right
plot(data$DateTime,as.numeric(as.character(data$Voltage)),type="n",xlab="datetime",ylab="Voltage")
lines(data$DateTime,as.numeric(as.character(data$Voltage)))
#plot bottom left:
plot(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),type="n",xlab="",ylab="Energy sub metering")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_1)),col="grey33")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(data$DateTime,as.numeric(as.character(data$Sub_metering_3)),col="blue")
legend("topright",lty=c(1,1,1),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("grey33","red","blue"))
#plot bottom right:
plot(data$DateTime,as.numeric(as.character(data$Global_reactive_power)),type="n",xlab="datetime",ylab="Global_reactive_power")
lines(data$DateTime,as.numeric(as.character(data$Global_reactive_power)))
dev.off()