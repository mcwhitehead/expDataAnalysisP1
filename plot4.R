library(data.table)

#load data
setwd("C:/Users/mcwhi_000/Desktop/datasciencecoursera/exploratoryDataAnalysis/ExData_Plotting1")
data <- fread("household_power_consumption.txt")

#format data
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#subset data
sub <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02"]
sub <- data.frame(sub)
for(i in c(3:9)) {sub[,i] <- as.numeric(as.character(sub[,i]))}

#create and format 'datetime'
sub$DateTime <- paste(sub$Date, sub$Time)
sub$DateTime <- strptime(sub$DateTime, format="%Y-%m-%d %H:%M:%S")

#create plot
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mfrow = c(2, 2), mar = c(5, 5, 5, 5))
plot(sub$DateTime, sub$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power", type="n")
lines(sub$DateTime, sub$Global_active_power, type="S")

plot(sub$DateTime, sub$Voltage, xaxt=NULL, xlab = "datetime", ylab = "Voltage", type="n")
lines(sub$DateTime, sub$Voltage, type="S")

plot(sub$DateTime, sub$Sub_metering_1, xaxt=NULL, xlab = "", ylab = "Energy sub metering", type="n")
lines(sub$DateTime, sub$Sub_metering_1, col = "black", type = "S")
lines(sub$DateTime, sub$Sub_metering_2, col = "red", type = "S")
lines(sub$DateTime, sub$Sub_metering_3, col = "blue", type = "S")
legend("topright", bty = "n", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .5)

plot(sub$DateTime, sub$Global_reactive_power, xaxt=NULL, xlab = "datetime", ylab = "Global reactive power", type="n")
lines(sub$DateTime, sub$Global_reactive_power, type="S")
dev.off()