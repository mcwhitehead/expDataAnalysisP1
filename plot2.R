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
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(5, 5, 5, 4))
plot(sub$DateTime, sub$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(sub$DateTime, sub$Global_active_power, type="S")
dev.off()