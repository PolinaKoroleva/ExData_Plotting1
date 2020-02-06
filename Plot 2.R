# Plot 2

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

with(data, plot (Global_active_power~Datetime, ylab = "Glabal Active Power (kilowatts)", xlab = "",
                 main = "Global Active Power vs Time", type = "l"))


# Save the file
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()

