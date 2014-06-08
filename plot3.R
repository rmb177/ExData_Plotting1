create_plot3 <- function()
{
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot3.png")
    
    plot(two_days_clean[,1], 
         two_days_clean[,6], 
         type="n", 
         xlab="",
         ylab="Energy sub metering")
    
    lines(two_days_clean[,1], two_days_clean[,6], type="l", col="black") 
    lines(two_days_clean[,1], two_days_clean[,7], type="l", col="red")
    lines(two_days_clean[,1], two_days_clean[,8], type="l", col="blue")
    legend("topright",
           lty = 1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"))
    
    dev.off()
}