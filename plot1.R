library(datasets)

# Load dataset
powerData <- read.table("../household_power_consumption.txt", header=T, sep=";")
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
# Filter dataset by the dates we are interested in
powerData <- powerData[(powerData$Date >= "2007-02-01" & powerData$Date <= "2007-02-02"),]

# Convert data to numeric type 
powerData$Global_active_power <- as.numeric(as.character(powerData$Global_active_power))

# Plot graphics
hist(powerData$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")

# Copy the graphic to a file device and save it
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
