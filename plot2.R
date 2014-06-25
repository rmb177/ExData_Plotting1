# Create a line graph of the Global Active Power data
create_plot2 <- function()
{
    # Call common code to read in the household data
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot2.png")
    
    plot(data$dateAndTime, 
         data$globalActivePower, 
         type="n", 
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    lines(data$dateAndTime, data$globalActivePower, type="l") 
    dev.off()
}