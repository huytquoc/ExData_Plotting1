library(data.table)

## Read in data 
hhpower <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
hhpower <- data.table(hhpower)

# Converting the Date data into Date format
hhpower[,cDate:=as.Date(strptime(hhpower$Date,format="%d/%m/%Y"))]

#Subset data in 2 days 2007-02-01 and 007-02-02
t1<-as.Date("2007-02-01")
t2 <- as.Date("2007-02-02")
dat <- hhpower[(cDate >= t1) & (cDate <= t2)]

#Merging Date and Time values
cFull<-strptime(paste(dat$Date, dat$Time, sep=","),format="%d/%m/%Y,%H:%M:%S")

#Draw Plot 2 and Save it into Png format
png(file="plot2.png",width=480,height=480)
plot(x=cFull,y=as.numeric(as.character(dat$Global_active_power)),type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()