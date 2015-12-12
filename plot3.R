# Plot1.R
library(dplyr)
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
power07<-filter(power,Date=="1/2/2007"|Date=="2/2/2007") %>%
mutate(dt2=as.POSIXct(paste(Date,Time,sep=" "),format="%d/%m/%Y %H:%M:%S"))
power07$Sub_metering_1<-as.numeric(power07$Sub_metering_1)
power07$Sub_metering_2<-as.numeric(power07$Sub_metering_2)
power07$Sub_metering_3<-as.numeric(power07$Sub_metering_3)
png(filename="plot3.png",width=480,height=480)
with(power07,{
  plot(dt2,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(dt2,Sub_metering_2,col="red")
  lines(dt2,Sub_metering_3,col="blue")
  legend("topright",legend=names(power07)[7:9],lty=c(1,1,1),
         col=c("black","red","blue"))
})
dev.off()