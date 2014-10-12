library(data.table)

## Read in data 
hhpower <- read.table(file="household_power_consumption.txt", header=TRUE,sep=";")
hhpower <- data.table(hhpower)

# Converting the Date data into Date format
hhpower[,cDate:=as.Date(strptime(hhpower$Date,format="%d/%m/%Y"))]

#Subset data in 2 days 2007-02-01 and 007-02-02
t1<-as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
dat <- hhpower[(cDate >= t1) & (cDate <= t2)]

#Merging Date and Time values
cFull<-strptime(paste(dat$Date, dat$Time, sep=","),format="%d/%m/%Y,%H:%M:%S")

#Draw Plot 3 and save it into Png format file
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

#plot1
plot(x=cFull,y=as.numeric(as.character(dat$Global_active_power)),type="l", ylab="Global Active Power (kilowatts)", xlab="")

#plot2
plot(x=cFull,y=as.numeric(as.character(dat$Voltage)),type="l", ylab="Voltage", xlab="datetime")

#plot3
y1 <- as.numeric(as.character(dat$Sub_metering_1))
y2 <- as.numeric(as.character(dat$Sub_metering_2))
y3 <- as.numeric(as.character(dat$Sub_metering_3))
plot(x=cFull, y=y1,type="l",ylab="Energy sub metering",xlab="")
lines(x=cFull,y=y2,type="l",col="red")
lines(x=cFull,y=y3,type="l",col="blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

#plot4
plot(x=cFull,y=as.numeric(as.character(dat$Global_reactive_power)),type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()