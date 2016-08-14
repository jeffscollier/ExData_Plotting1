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
    g <- ggplot(data, aes(timestamp, legend=T)) +
         geom_line(aes(y=Sub_metering_1, color="1")) +
         geom_line(aes(y=Sub_metering_2, color="2")) +
         geom_line(aes(y=Sub_metering_3, color="3")) +
         scale_color_hue(name = "Sub-Meter") +
         scale_x_datetime(date_breaks = "1 day", date_labels = "%b %d (%a)") +
         xlab('day-of-the-week') +
         ylab(ylabel) +
         ggtitle(title) +
        theme(legend.position=c(.9,.75),
              legend.key.width = unit(2, "cm")
              )
    print(g)
  }
  
  if(save) {
    dev.copy(png, file="./plot3.png")
    dev.off()
  }
  
}