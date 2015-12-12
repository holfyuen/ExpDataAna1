# Plot1.R
library(dplyr)
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
power07<-filter(power,Date=="1/2/2007"|Date=="2/2/2007") %>%
  mutate(dt2=as.POSIXct(paste(Date,Time,sep=" "),format="%d/%m/%Y %H:%M:%S"))
power07$Global_active_power<-as.numeric(power07$Global_active_power)

png(filename="plot2.png",width=480,height=480)
plot(power07$dt2,power07$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)")
dev.off()