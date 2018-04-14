electricity$Date<-as.character(electricity$Date)#not important
library(lubridate)#use lubridate library
electricity$Date<-ymd(electricity$Date)#change date format to years months and days
electricity$Date<-as.POSIXct(paste(electricity$Date,electricity$Time),format='%Y-%m-%d %H:%M:%S')#change format into POSIXct class
png('plot2.png')#store the following plot into a png file
plot(electricity$Date,as.numeric(as.character(electricity$Global_active_power)),type='l',pch=20,xlab='',ylab='Global Active Power(kilowatts)')
dev.off()#plot the following as a scatter plot with type=line and following labels and dont forget to close device window