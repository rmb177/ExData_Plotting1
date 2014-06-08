create_plot4 <- function()
{
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot4.png")
    par(mfrow = c(2, 2))
    
    
    plot(two_days_clean[,1], 
         two_days_clean[,2], 
         type="n", 
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    lines(two_days_clean[,1], two_days_clean[,2], type="l") 
    
    
    plot(two_days_clean[,1], 
         two_days_clean[,4], 
         type="n", 
         xlab="datetime",
         ylab="Voltage")
    
    lines(two_days_clean[,1], two_days_clean[,4], type="l")
    
    
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
    
    
    
    plot(two_days_clean[,1], 
         two_days_clean[,3], 
         type="n", 
         xlab="datetime",
         ylab="Global_reactive_power")
    
    lines(two_days_clean[,1], two_days_clean[,3], type="l")
    
    
    
    dev.off()
    
    
}