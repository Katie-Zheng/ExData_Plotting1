## -- read data -- ##
setwd("F:/PHBS/×ÔÑ§/±à³Ì/R/4. Exploratory data analysis/course project/1")
data = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
# head(data)
data$Date = as.Date(data$Date, format = "%d/%m/%Y")  # need to specify format according to data
attach(data)
start = as.Date("1/2/2007", format = "%d/%m/%Y")
end = as.Date("2/2/2007", format = "%d/%m/%Y")
subData = data[Date >= start & Date <= end, ]
attach(subData)
# alternately
# subData2 = subset(data, Date >= start & Date <= end) 

## -- plot 4 -- ##
# convert factor to numeric. note: as.numeric does not apply
Global_active_power = as.numeric(levels(Global_active_power))[Global_active_power]
Sub_metering_1 = as.numeric(levels(Sub_metering_1))[Sub_metering_1]
Sub_metering_2 = as.numeric(levels(Sub_metering_2))[Sub_metering_2]
Voltage = as.numeric(levels(Voltage))[Voltage]
Global_reactive_power = as.numeric(levels(Global_reactive_power))[Global_reactive_power]
# plot
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2),mar = c(4,4,1,1))
#1
plot(Global_active_power, type = "l", xaxt="n",xlab = '',ylab = 'Global Active Power (kilowatts)')
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"), las = 0)
#2
plot(Voltage,xaxt="n",xlab = '',ylab = 'Voltage',type = "l")
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"), las = 0)
mtext(text="datetime", line = 3, side=1, outer = FALSE, at=1441)
#3
plot(Sub_metering_1, type = "l", xaxt="n",xlab = '',ylab = 'Energy sub metering')
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"), las = 0)
legend(1441,40, lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex = 0.8,bty = "n")
#4
plot(Global_reactive_power,xaxt="n",xlab = '',ylab = 'Global_reactive_power',type = "l")
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"), las = 0)
mtext(text="datetime", line = 3, side=1, outer = FALSE, at=1441)
dev.off()