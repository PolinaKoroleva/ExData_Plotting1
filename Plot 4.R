# Plot 4

setwd("~/Desktop/Coursera R/ExData_Plotting1")
hpc <- read.csv("~/Desktop/Coursera R/household_power_consumption.txt", sep=";", na.strings="?")
View(hpc)

# subset the data from the dates
names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data <- subset(hpc,hpc$Date=="1/2/2007" | hpc$Date =="2/2/2007")
str(data)

# Making a POSIXct date capable of being filtered and graphed by time of day
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
str(data)

# plot 4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with (data, {
        plot (Global_active_power~Datetime, ylab = "Glabal Active Power (kilowatts)", xlab = "", type = "l")
        plot (Voltage ~ Datetime, xlab = "datetime", ylab = "Voltage", type = "l")
        plot(Sub_metering_1 ~ Datetime, ylab = "Energy sub metering", 
             type = "l", col = "black")
        lines(Sub_metering_2 ~ Datetime, type = "l", col = "red")
        lines(Sub_metering_3 ~ Datetime, type = "l", col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, bty = "n", cex = 0.75,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot (Global_reactive_power ~ Datetime, ylab = "datetime", xlab = "Global_reactive_power", type = "l")
}
)

dev.copy(png, filename="plot4.png", width=480, height=480)
dev.off()
