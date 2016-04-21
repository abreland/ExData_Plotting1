

plot1<-function(){
d = read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE,sep=";",  na.strings = "?")
d$Date <- as.Date(d$Date, format='%d/%m/%Y')
d1 <- d[d$Date >='2007-02-01' & d$Date <='2007-02-02' , ]
d2 <- transform(d1,dateTime=strptime(paste(Date,Time, sep = " " ), format='%Y-%m-%d %H:%M:%S'))

hist(d2$Global_active_power,   main="Global Active Power", xlab="Global Active Power (kilowatts)", col=c("red"))

dev.copy(png,'plot1.png')
dev.off()
}