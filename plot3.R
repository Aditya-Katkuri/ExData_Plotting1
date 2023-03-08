library("data.table")

setwd("/Users/adityak/Desktop/ExData_Plotting1")

#Pre-Processing
Data3 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
Data3[, date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Data3 <- Data3[(date >= "2007-02-01") & (date <= "2007-02-03")]

globalActivePower <- as.numeric(Data3$Global_active_power)
a <- as.numeric(Data3$Sub_metering_1)
b <- as.numeric(Data3$Sub_metering_2)
c <- as.numeric(Data3$Sub_metering_3)

#png file
png("plot3.png", width=480, height=480)

#plot
plot(Data3[, date], a, type="l", xlab="", ylab="Energy sub metering")
lines(Data3[, date], b,col="red")
lines(Data3[, date], c,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
dev.set(dev.next())
