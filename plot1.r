loadPowerData <- function() {
  file <- "household_power_consumption.txt"
  validDates <- as.Date(c("2007-02-01", "2007-02-02"), tz = "UTC")
  
  data <- read.csv(file, header = T, sep = ";")
  print("data read")
  
  data <- rawData[as.Date(as.character(rawData$Date), format = "%d/%m/%Y", tz = "UTC") %in% validDates, ]
  print("data segmented")
  
  data$timestamp <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), tz = "UTC")
  
  data$Global_active_power<- as.numeric(as.character(data$Global_active_power))
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

  data
}

gapHist <- function(data, basic = T) {
  
  xlabel = "Global Active Power(kilowatts)"
  ylabel = "Frequency"
  title = "Global Active Power"
  
  if(basic) {
    hist(data$Global_active_power, 
         col = "red", 
         xlab = xlabel,
         ylab = ylabel,
         main = title,
         breaks = 13
         )
  }
 else { 
    qplot(data$Global_active_power, 
          geom="histogram",
          main=title,
          xlab = xlabel,
          ylab = ylabel,
          binwidth = .2,
          breaks=seq(0, 4, by=.25),
          col=I("black"),
          fill=I("red")) 
 }
}

gapTime <- function(data, basic = T) {
  ylabel = "Global Active Power(kilowatts)"
  title = "Global Active Power"
  
  if(basic) {
    plot(data$timestamp, data$Global_active_power, 
         ylab = ylabel,
         xlab = "",
         type = "l",
         main = title
    )
    ## lines(data$timestamp, data$Global_active_power)
  }
  else { 
  }
}