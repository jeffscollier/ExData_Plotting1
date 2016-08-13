library(ggplot2)

gapHist <- function(data, basic = T, title = "Global Active Power"s) {
  
  xlabel = "Global Active Power(kilowatts)"
  ylabel = "Frequency"
  
  
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
          breaks=seq(0, 6, by=.5),
          col=I("black"),
          fill=I("red")) 
 }
}