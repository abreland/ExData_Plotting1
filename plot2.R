

plot2<-function(){
d = read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE,sep=";",  na.strings = "?")
d$Date <- as.Date(d$Date, format='%d/%m/%Y')
d1 <- d[d$Date >='2007-02-01' & d$Date <='2007-02-02' , ]
d2 <- transform(d1,dateTime=strptime(paste(Date,Time, sep = " " ), format='%Y-%m-%d %H:%M:%S'))

xrange<- range(d2$dateTime)
yrange<- range(d2$Global_active_power )
plot(range(d2$dateTime),range(d2$Global_active_power ), type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(d2$dateTime, d2$Global_active_power )

dev.copy(png,'plot2.png')
dev.off()
}