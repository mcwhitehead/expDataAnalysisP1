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

#create plot
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(5, 5, 5, 4))
hist(sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()
