library(ggplot2)

grpTime <- function(data, basic = T) { 
  ylabel = "Global Reactive Power"

  if(basic) {
    plot(data$timestamp, data$Global_reactive_power, 
         ylab = ylabel,
         xlab = "datetime",
         type = "l"
    )
  }
  else { 
    qplot(data$timestamp, data$Global_reactive_power, 
          geom=c("line"), 
          xlab = "datetime",
          ylab = ylabel,
          col=I("black"))
    #ggplot(data=data, x=Date, y=Global_active_power)
    #geom_line()
  }
}

voltage <- function(data, basic = T) {
  ylabel = "Voltage"
  
  if(basic) {
    plot(data$timestamp, data$Voltage, 
         ylab = ylabel,
         xlab = "datetime",
         type = "l"
    )
  }
  else { 
    qplot(data$timestamp, data$Voltage, 
          geom=c("line"), 
          xlab = "datetime",
          ylab = ylabel,
          col=I("black"))
    #ggplot(data=data, x=Date, y=Global_active_power)
    #geom_line()
  }
}

plotSet <- function(data, basic = T) {

  par(mfrow=c(2,2))
  gapTime(data, title = "")
  voltage(data, title = "")
  subMeter(data, title = "")
  grpTime(data, title = "")
  
}