library(ggplot2)

gapTime <- function(data, basic = T, title = "Global Active Power", save = F) {
  ylabel = "Global Active Power(kilowatts)"
  
  if(basic) {
    plot(data$timestamp, data$Global_active_power, 
         ylab = ylabel,
         xlab = "",
         type = "l",
         main = title
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
    dev.copy(png, file="./figure/plot2.png")
    dev.off()
  }
}