x<-read.table('household_power_consumption.txt',sep=';',header=TRUE,na.strings ='?')#read the data,remove the default columns put by R
head(x)#show the first few rows
str(x)#show the structure of the table
dim(x)#check dimensions of x
x$Date<-as.character(x$Date)#change  Date column into character strings
electricity<-subset(x,Date=='1/2/2007' | Date=='2/2/2007')#subset for appropriate dates
head(electricity)
electricity$Date<-strptime(electricity$Date,format = '%d/%m/%Y')#change format into date and time
dev.cur()#check current device
png('plot1.png')#call png function and store the following plot as a png file
par(mfrow=c(1,1))#send parameter number of rows and columns of the plot to be 1,1
hist(as.numeric(as.character(electricity$Global_active_power)),xlab='Global Active Power(kilowatts)',main='Global Active Power',col='red')
dev.off()#plot a histogram and dont forget to close the device