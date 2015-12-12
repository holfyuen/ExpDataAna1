# Plot1.R
library(dplyr)
power<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
power07<-filter(power,Date=="1/2/2007"|Date=="2/2/2007")

png(filename="plot1.png",width=480,height=480)
hist(as.numeric(power07$Global_active_power),col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()