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

## -- plot 2 -- ##
Global_active_power = as.numeric(levels(Global_active_power))[Global_active_power]
png(file = "plot2.png", width = 480, height = 480)
plot(Global_active_power, type = "l", xaxt="n",xlab = '',ylab = 'Global Active Power (kilowatts)')
axis(1, at = c(1,1441,2880), labels = c("Thu", "Fri", "Sat"), las = 0)
dev.off()