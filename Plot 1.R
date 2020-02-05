# Plot 1
setwd("~/Desktop/Coursera R/ExData_Plotting1")
hpc <- read.csv("~/Desktop/Coursera R/household_power_consumption.txt", sep=";", na.strings="?")
View(hpc)

# subset the data from the dates
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")
str(data)

### Plot 1
hist(data$Global_active_power, col = "red", xlab = "Glabal Active Power (kilowatts)", 
     main = "Global Active Power")

png("plot1.png", width=480, height=480)
dev.off()
