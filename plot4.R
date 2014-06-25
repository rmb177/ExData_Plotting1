# Create four different graphs of the household energy data
# in a 2x2 grid
create_plot4 <- function()
{
    # Call common code to read in the household data
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot4.png")
    par(mfrow = c(2, 2))
    
    # Create a line graph of the global active power
    plot(data$dateAndTime, 
         data$globalActivePower, 
         type="n", 
         xlab="",
         ylab="Global Active Power")
    
    lines(data$dateAndTime, data$globalActivePower, type="l") 
    
    
    # Create a line graph of the voltage
    plot(data$dateAndTime, 
         data$voltage, 
         type="n", 
         xlab="datetime",
         ylab="Voltage")
    
    lines(data$dateAndTime, data$voltage, type="l")
    
    
    # Create a  line graph of the sub metering data
    plot(data$dateAndTime, 
         data$subMetering1, 
         type="n", 
         xlab="",
         ylab="Energy sub metering")
    
    lines(data$dateAndTime, data$subMetering1, type="l", col="black") 
    lines(data$dateAndTime, data$subMetering2, type="l", col="red")
    lines(data$dateAndTime, data$subMetering3, type="l", col="blue")
    legend("topright",
           lty = 1,
           bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"))
    
    
    # Create a line graph of the reactive power
    plot(data$dateAndTime, 
         data$globalReactivePower, 
         type="n", 
         xlab="datetime",
         ylab="Global_reactive_power")
    
    lines(data$dateAndTime, data$globalReactivePower, type="l")
    
    dev.off()
}