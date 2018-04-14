x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings ='?')#read the data,remove the default columns put by R
head(x)#show the first few rows
str(x)#show the structure of the table
dim(x)#check dimensions of x
x$Date<-as.character(x$Date)#change  Date column into character strings
electricity<-subset(x,Date=='1/2/2007' | Date=='2/2/2007')#subset for appropriate dates
head(electricity)
electricity$Date<-strptime(electricity$Date,format = '%d/%m/%Y')#change format into date and time
dev.cur()#check current device
#set paramters to take in 4 plots in a single file set it into rows,margin length=4 bottom,and going clockwise set the spacing
png('plot4.png')#save the plots in a png file
par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(electricity$Date,as.numeric(as.character(electricity$Global_active_power)),type='l',pch=20,xlab='',ylab='Global Active Power')
plot(electricity$Date,as.numeric(as.character(electricity$Voltage)),type='l',pch=20,xlab='datetime',ylab='Voltage')
with(electricity,plot(Date,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering'))
points(electricity$Date,electricity$Sub_metering_1,type='l')
points(electricity$Date,electricity$Sub_metering_2,type='l',col='red')
points(electricity$Date,electricity$Sub_metering_3,type='l',col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),cex=0.75)
plot(electricity$Date,as.numeric(as.character(electricity$Global_reactive_power)),type='l',pch=20,xlab='datetime',ylab='Global_reactive_power')
dev.off()#plot the previous plots in sequence ,all are scatter plots with respective labels,and then switch off device