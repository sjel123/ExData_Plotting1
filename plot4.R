#load data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
#Convert date column to Date Format
Dataformat<-as.Date(strptime(data$Date,"%d/%m/%Y"))
#Subset for 2 dates
index<- Dataformat %in% as.Date(c("2007-02-01", "2007-02-02"))
data1<-data[index,]

png(filename="plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  par(mar=c(5.1,5,1,1))

#plot upper right
plot(data1$Global_active_power,type="l", ylab="Global Active Power",xlab="", xaxt="n")
axis(1,at=c(0,1440,length(data1$Global_active_power)), labels=c("Thu", "Fri", "Sat"))

#upper left
plot(data1$Voltage, type="l", ylab="Voltage", xlab="datetime", xaxt="n")   
axis(1,at=c(0,1440,length(data1$Global_active_power)), labels=c("Thu", "Fri", "Sat"))

#lower right
plot(data1$Sub_metering_1, type="n", ylab="Energy sub metering",xaxt="n", xlab="")
lines(data1$Sub_metering_1, col="black", type="l")
lines(data1$Sub_metering_2, col="red", type="l")   
lines(data1$Sub_metering_3, col="blue", type="l")   
axis(1,at=c(0,1440,length(data1$Sub_metering_1)), labels=c("Thu", "Fri", "Sat"))
legend("topright",legend=names(data1[7:9]),lty=1,bty="n",col=c("black", "red", "blue"))

#Lower left                               
plot(data1$Global_reactive_power, type="l", ylab="Global_reactive_power", xaxt="n", xlab="datetime")                               
axis(1,at=c(0,1440,length(data1$Global_reactive_power)), labels=c("Thu", "Fri", "Sat"))                            

dev.off()

