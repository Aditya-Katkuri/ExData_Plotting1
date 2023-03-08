library("data.table")

setwd("/Users/adityak/Desktop/ExData_Plotting1")

#Pre-Processing
Data2 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
Data2[, date := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Data2 <- Data2[(date >= "2007-02-01") & (date <= "2007-02-03")]

globalActivePower <- as.numeric(Data2$Global_active_power)

#png file
png("plot2.png", width=480, height=480)

#plot
plot(Data2[, date], globalActivePower, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
dev.set(dev.next())
