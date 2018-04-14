x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings ='?')#read the data,remove the default columns put by R
head(x)#show the first few rows
str(x)#show the structure of the table
dim(x)#check dimensions of x
x$Date<-as.character(x$Date)#change  Date column into character strings
electricity<-subset(x,Date=='1/2/2007' | Date=='2/2/2007')#subset for appropriate dates
head(electricity)
electricity$Date<-strptime(electricity$Date,format = '%d/%m/%Y')#change format into date and time
dev.cur()#check current device
png('plot3.png')#store following plot into a png file
with(electricity,plot(Date,Sub_metering_1,type='n',xlab='',ylab='Energy sub metering'))#use with function to supply data,and use function plot with type=n that means keep the plot blank
points(electricity$Date,electricity$Sub_metering_1,type='l')#plot the points of 1st argument as lines
points(electricity$Date,electricity$Sub_metering_2,type='l',col='red')#plot the points of 2nd argument as lines,with color red on the same graph
points(electricity$Date,electricity$Sub_metering_3,type='l',col='blue')#plot the points of 3rt argument as lines,with color blue on the same graph
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'))#add a legend in the top right with following colors and line type =solid
dev.off()#switch off the device