# Create a line graph showing the different sub-metering data
create_plot3 <- function()
{
    # Call common code to read in the household data
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot3.png")
    
    # Create the plot frame
    plot(data$dateAndTime, 
         data$subMetering1, 
         type="n", 
         xlab="",
         ylab="Energy sub metering")
    
    # Add the lines for the different data points
    lines(data$dateAndTime, data$subMetering1, type="l", col="black") 
    lines(data$dateAndTime, data$subMetering2, type="l", col="red")
    lines(data$dateAndTime, data$subMetering3, type="l", col="blue")
    
    legend("topright",
           lty = 1,
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"))
    
    dev.off()
}