all_data = read.table(file = "household_power_consumption.txt", sep = ';', na.strings = '?', header = T)
all_data$t <- strptime(x=paste(all_data$Date, all_data$Time), format = "%d/%m/%Y %H:%M:%S")
data <- all_data[all_data$t > strptime("2007-02-01", format="%Y-%m-%d") & all_data$t < strptime("2007-02-03", format="%Y-%m-%d"), ]

par(cex=0.75)
png(filename = "plot3.png")
with(data, {
    plot(t, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
    lines(t, Sub_metering_1, col = "black")
    lines(t, Sub_metering_2, col = "red")
    lines(t, Sub_metering_3, col = "blue")
    legend("topright", lwd=1.2, pch = NA, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

