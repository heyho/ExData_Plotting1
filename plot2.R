all_data = read.table(file = "household_power_consumption.txt", sep = ';', na.strings = '?', header = T)
all_data$t <- strptime(x=paste(all_data$Date, all_data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- all_data[all_data$t > strptime("2007-02-01", format="%Y-%m-%d") & all_data$t < strptime("2007-02-03", format="%Y-%m-%d"), ]

par(cex=0.75, bg="white")
with(data, plot(t, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png")
dev.off()

