library(ggplot2)

gapTime <- function(data, basic = T, title = "Global Active Power") {
  ylabel = "Global Active Power(kilowatts)"
  title = "Global Active Power"
  
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
}