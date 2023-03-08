library("data.table")

setwd("/Users/adityak/Desktop/ExData_Plotting1")

#Pre-Processing
Data1 <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
Data1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
Data1 <- Data1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

globalActivePower <- as.numeric(Data1$Global_active_power)

#png file
png("plot1.png", width=480, height=480)

#plot
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
dev.set(dev.next())






