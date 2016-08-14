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
    g <- ggplot(data = data, aes(timestamp, Global_active_power)) +
         geom_line(color="firebrick") +
         scale_x_datetime(date_breaks = "1 day", date_labels = "%b %d (%a)") +
         xlab('day-of-the-week')
    print(g)
  }
  
  if(save) {
    dev.copy(png, file="./plot2.png")
    dev.off()
  }
}