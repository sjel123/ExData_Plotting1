#load data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
#Convert date column to Date Format
Dataformat<-as.Date(strptime(data$Date,"%d/%m/%Y"))
#Subset for 2 dates
index<- Dataformat %in% as.Date(c("2007-02-01", "2007-02-02"))
data1<-data[index,]

x11(width=480,height=480)#new windows device of size 480x480

#Plot 2
plot(data1$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="", xaxt="n")
  axis(1,at=c(0,1440,length(data1$Global_active_power)), labels=c("Thu", "Fri", "Sat"))
#copy plot to PNG file
dev.copy (png,filename="plot2.png", width=480, height=480)
dev.off()  
