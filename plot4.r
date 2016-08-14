library(ggplot2)

grpTime <- function(data, basic = T, title = "Global Reactive Power", save = F) { 
  ylabel = "Global Reactive Power"

  if(basic) {
    plot(data$timestamp, data$Global_reactive_power, 
         ylab = ylabel,
         xlab = "datetime",
         title = title,
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
  
  if(save) {
    dev.copy(png, file="./figure/plot4a.png")
    dev.off()
  }
}

voltage <- function(data, basic = T, title = "Voltage", save = F) {
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
  
  if(save) {
    dev.copy(png, file="./figure/plot4b.png")
    dev.off()
  }
}

plotSet <- function(data, basic = T, save = F) {

  par(mfrow=c(2,2))
  gapTime(data, title = "")
  voltage(data, title = "")
  subMeter(data, title = "")
  grpTime(data, title = "")
  par(mfrow=c(1,1))
  
  if(save) {
    dev.copy(png, file="./plot4.png")
    dev.off()
  }
}