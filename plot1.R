library(data.table)

# Converting the Date data into Date format
hhpower[,cDate:=as.Date(strptime(hhpower$Date,format="%d/%m/%Y"))]
hhpower <- data.table(hhpower)

#Subset data in 2 days 2007-02-01 and 007-02-02
t1<-as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
dat <- hhpower[(cDate >= t1) & (cDate <= t2)]

# Draw Plot 1 and save it into Png format
png("plot1.png",width=480, height=480)
hist(as.numeric(as.character(dat$Global_active_power)), main="Global Active Power",  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()