#load data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
#Convert date column to Date Format
Dataformat<-as.Date(strptime(data$Date,"%d/%m/%Y"))
#Subset for 2 dates
index<- Dataformat %in% as.Date(c("2007-02-01", "2007-02-02"))
data1<-data[index,]

#plot 3
png(filename="plot3.png", width=480, height=480)
  plot(data1$Sub_metering_1, type="n", ylab="Energy sub metering",xaxt="n", xlab="")
   lines(data1$Sub_metering_1, col="black", type="l")
   lines(data1$Sub_metering_2, col="red", type="l")   
   lines(data1$Sub_metering_3, col="blue", type="l")   
     axis(1,at=c(0,1440,length(data1$Sub_metering_1)), labels=c("Thu", "Fri", "Sat"))
     legend("topright",legend=names(data1[7:9]), lty=1,col=c("black", "red", "blue"))
dev.off()                               

