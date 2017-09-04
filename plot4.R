library(datasets)

# Load dataset
powerData <- read.table("../household_power_consumption.txt", header=T, sep=";")
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
powerData <- powerData[(powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02"),]

# Convert data to numeric type 
powerData$Global_active_power <- as.numeric(as.character(powerData$Global_active_power))
powerData$Global_reactive_power <- as.numeric(as.character(powerData$Global_reactive_power))
powerData$Voltage <- as.numeric(as.character(powerData$Voltage))
powerData$Sub_metering_1 <- as.numeric(as.character(powerData$Sub_metering_1))
powerData$Sub_metering_2 <- as.numeric(as.character(powerData$Sub_metering_2))
powerData$Sub_metering_3 <- as.numeric(as.character(powerData$Sub_metering_3))

# Create datetime variable in order to make a plot accordingly to the style required.
dateTimePlot <- as.POSIXct(paste(powerData$Date, powerData$Time)
                           , format="%Y-%m-%d %H:%M:%S")

# Plot graphics

# 2 Rows and 2 Cols of graphics
par(mfrow = c(2,2))

# Plot 1
plot(dateTimePlot,
     powerData$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Plot 2
plot(dateTimePlot,
     powerData$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Plot 3
plot(dateTimePlot,
     powerData$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(dateTimePlot, powerData$Sub_metering_2, col = "red")
lines(dateTimePlot, powerData$Sub_metering_3, col = "blue")
legend("topright", 
       col=c("black","red","blue"), 
       c("Sub_metering_1\t\t",
         "Sub_metering_2\t\t", 
         "Sub_metering_3\t\t"),
       lty=c(1,1),
       lwd=c(1,1),
       border = "white")

# Plot 4
plot(dateTimePlot,
     powerData$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# Copy the graphic to a file device and save it
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
