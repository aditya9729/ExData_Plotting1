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