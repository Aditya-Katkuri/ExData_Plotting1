library("data.table")

setwd("/Users/adityak/Desktop/ExData_Plotting1")

#Pre-Processing
Data4 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
Data4[, date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Data4 <- Data4[(date >= "2007-02-01") & (date <= "2007-02-03")]

globalActivePower <- as.numeric(Data4$Global_active_power)
globalReactivePower <- as.numeric(Data4$Global_reactive_power)
a <- as.numeric(Data3$Sub_metering_1)
b <- as.numeric(Data3$Sub_metering_2)
c <- as.numeric(Data3$Sub_metering_3)

#png file
png("plot4.png", width=480, height=480)

#plots
par(mfrow=c(2,2))
plot(Data4[, date], globalActivePower, type="l", xlab="", 
     ylab="Global Active Power")

plot(Data4[, date],Data4[, Voltage], type="l", xlab="datetime", ylab="Voltage")

plot(Data4[, date], a, type="l", xlab="", ylab="Energy sub metering")
lines(Data4[, date], b,col="red")
lines(Data4[, date], c,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1), bty="n", cex=.5) 

plot(Data4[, date], globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
dev.set(dev.next())
