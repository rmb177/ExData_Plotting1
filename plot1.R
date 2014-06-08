# Create a histogram of the Global Active Power data
create_plot1 <- function()
{
    # Call common code to read in the household data
    source("read_household_data.R")
    data <- read_household_data()

    png("plot1.png")
    par(bg="transparent")
    
    hist(data[,2], 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
    
    axis(2, at=seq(0, 1200, by=200))
    
    dev.off()
}

