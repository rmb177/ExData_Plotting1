# Create four different graphs of the household energy data
# in a 2x2 grid
create_plot4 <- function()
{
    # Call common code to read in the household data
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot4.png")
    par(bg="transparent")
    par(mfrow = c(2, 2))
    
    # Create a line graph o the global active power
    plot(two_days_clean[,1], 
         two_days_clean[,2], 
         type="n", 
         xlab="",
         ylab="Global Active Power")
    
    lines(two_days_clean[,1], two_days_clean[,2], type="l") 
    
    
    # Create a line graph of the voltage
    plot(two_days_clean[,1], 
         two_days_clean[,4], 
         type="n", 
         xlab="datetime",
         ylab="Voltage")
    
    lines(two_days_clean[,1], two_days_clean[,4], type="l")
    
    
    # Create a  line graph of the sum meterin data
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
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"))
    
    
    # Create a line grapy of the reactive power
    plot(two_days_clean[,1], 
         two_days_clean[,3], 
         type="n", 
         xlab="datetime",
         ylab="Global_reactive_power")
    
    lines(two_days_clean[,1], two_days_clean[,3], type="l")
    
    dev.off()
}