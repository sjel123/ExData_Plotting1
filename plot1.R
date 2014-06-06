#load data
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)
#Convert date column to Date Format
Dataformat<-as.Date(strptime(data$Date,"%d/%m/%Y"))
#Subset for 2 dates
index<- Dataformat %in% as.Date(c("2007-02-01", "2007-02-02"))
data1<-data[index,]

#Plot1
x11(width=480,height=480)#new windows device of size 480x480
hist(as.numeric(data1$Global_active_power), 
     col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
#copy plot to PNG file
dev.copy (png,filename="plot1.png", width=480, height=480)
dev.off()  

