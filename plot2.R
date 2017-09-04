library(datasets)

# Load dataset
powerData <- read.table("../household_power_consumption.txt", header=T, sep=";")
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
powerData <- powerData[(powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02"),]

# Convert data to numeric type
powerData$Global_active_power <- as.numeric(as.character(powerData$Global_active_power))

# Create datetime variable in order to make a plot accordingly to the 
# style required.
dateTimePlot <- as.POSIXct(paste(powerData$Date, powerData$Time)
                           , format="%Y-%m-%d %H:%M:%S")

# Plot graphics
plot(dateTimePlot,
     powerData$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Copy the graphic to a file device and save it
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

