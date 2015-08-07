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

## -- plot 1 -- ##
# convert factor to numeric. note: as.numeric does not apply
Global_active_power = as.numeric(levels(Global_active_power))[Global_active_power]
png(file = "plot1.png", width = 480, height = 480)
hist(Global_active_power, breaks = 12, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylim = c(0,1300))
dev.off()
