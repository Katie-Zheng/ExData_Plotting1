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

## -- plot 3 -- ##
# convert factor to numeric. note: as.numeric does not apply
Sub_metering_1 = as.numeric(levels(Sub_metering_1))[Sub_metering_1]
Sub_metering_2 = as.numeric(levels(Sub_metering_2))[Sub_metering_2]
png(file = "plot3.png", width = 480, height = 480)
plot(Sub_metering_1, type = "l", xaxt="n",xlab = '',ylab = 'Energy sub metering')
lines(Sub_metering_2, col = "red")
lines(Sub_metering_3, col = "blue")
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"), las = 0)
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()