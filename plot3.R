

plot3 <- function(){
d = read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE,sep=";",  na.strings = "?")
d$Date <- as.Date(d$Date, format='%d/%m/%Y')
d1 <- d[d$Date >='2007-02-01' & d$Date <='2007-02-02' , ]
d2 <- transform(d1,dateTime=strptime(paste(Date,Time, sep = " " ), format='%Y-%m-%d %H:%M:%S'))

xrange<- range(d2$dateTime)
yrange <- c(min(d2$Sub_metering_1, d2$Sub_metering_2, d2$Sub_metering_3), max(d2$Sub_metering_1, d2$Sub_metering_2, d2$Sub_metering_3))

plot(xrange, yrange, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(d2$dateTime, d2$Sub_metering_1) 
lines(d2$dateTime, d2$Sub_metering_2, col="red") 
lines(d2$dateTime, d2$Sub_metering_3, col="blue") 
legend("topright", c("Sub_Metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1,col=c('black', 'red', 'blue'))

dev.copy(png,'plot3.png')
dev.off()
}
