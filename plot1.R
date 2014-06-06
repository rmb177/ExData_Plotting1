# Create a histogram of the Global Active Power data
create_plot1 <- function()
{
    source("read_household_data.R")
    data <- read_household_data()

    png("plot1.png")
    
    hist(data[,2], 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
    
    axis(2, at=seq(0, 1200, by=200))
    
    dev.off()
}

