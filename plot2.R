x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings ='?')#read the data,remove the default columns put by R
head(x)#show the first few rows
str(x)#show the structure of the table
dim(x)#check dimensions of x
x$Date<-as.character(x$Date)#change  Date column into character strings
electricity<-subset(x,Date=='1/2/2007' | Date=='2/2/2007')#subset for appropriate dates
head(electricity)
electricity$Date<-strptime(electricity$Date,format = '%d/%m/%Y')#change format into date and time
dev.cur()#check current device
electricity$Date<-as.character(electricity$Date)#not important
library(lubridate)#use lubridate library
electricity$Date<-ymd(electricity$Date)#change date format to years months and days
electricity$Date<-as.POSIXct(paste(electricity$Date,electricity$Time),format='%Y-%m-%d %H:%M:%S')#change format into POSIXct class
png('plot2.png')#store the following plot into a png file
plot(electricity$Date,as.numeric(as.character(electricity$Global_active_power)),type='l',pch=20,xlab='',ylab='Global Active Power(kilowatts)')
dev.off()#plot the following as a scatter plot with type=line and following labels and dont forget to close device window