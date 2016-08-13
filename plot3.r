library(ggplot2)

subMeter <- function(data, basic = T, title="Energy Sub-Metering", save = F) {
  ylabel = "Energy Sub-Metering"
  
  if(basic) {
    plot(data$timestamp, data$Sub_metering_1, 
         ylab = ylabel,
         xlab = "",
         type = "l",
         main = title
    )    
    lines(data$timestamp, data$Sub_metering_2, 
              ylab = ylabel,
              xlab = "",
              type = "l",
              main = title,
              col = "red"
    )   
    lines(data$timestamp, data$Sub_metering_3, 
         ylab = ylabel,
         xlab = "",
         type = "l",
         main = title,
         col = "blue"
    )
    
    legend('topright', 
           legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), 
           col=c("black","red", "blue"), 
           lty=1,
           cex=.65
           )
  }
  else { 
    qplot(data$timestamp, data$Global_active_power, 
          geom=c("line"), 
          main=title,
          xlab = "",
          ylab = ylabel,
          col=I("black"))
    #ggplot(data=data, x=Date, y=Global_active_power)
    #geom_line()
  }
  
  if(save) {
    dev.copy(png, file="./figure/plot3.png")
    dev.off()
  }
  
}