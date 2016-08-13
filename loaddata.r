loadPowerData <- function() {
  file <- "household_power_consumption.txt"
  validDates <- as.Date(c("2007-02-01", "2007-02-02"), tz = "UTC")
  
  data <- read.csv(file, header = T, sep = ";")
  print("data read")
  
  data <- data[as.Date(as.character(data$Date), format = "%d/%m/%Y", tz = "UTC") %in% validDates, ]
  print("data segmented")
  
  data$timestamp <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), tz = "UTC")
  
  data$Global_active_power<- as.numeric(as.character(data$Global_active_power))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
                                           
  data
}
