if (FALSE)
{
    library("lubridate")
    
    setClass('myDate')
    setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
    
    #create_plot1 <- function()
    #{
    read_one_col = c("myDate", rep("NULL", 8))
    date_col <- 
        read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings = "?",
                   colClasses=read_one_col,
                   comment.char="")
    
    format = "%Y-%m-%d"
    two_days_indices = which(date_col[,1] == as.Date("2007-02-01", format="%Y-%m-%d") |
                                 date_col[,1] == as.Date("2007-02-02", format="%Y-%m-%d"))
    
    two_days_raw <- read.table("household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = "?",
                               nrows = 2880,
                               skip = 66636,
                               colClasses = c(rep("character", 2), rep("numeric", 7)),
                               comment.char="")
    
    
    two_days_clean <- cbind(dmy_hms(paste(two_days_raw[,1], two_days_raw[,2])), two_days_raw[,3:9])
    
    hist(two_days_clean[,2], 
         col="red",
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    axis(2, at=seq(0, 1200, by=200))
    dev.off()
    
}

create_plot2 <- function()
{
    source("read_household_data.R")
    data <- read_household_data()
    
    png("plot2.png")
    
    plot(two_days_clean[,1], 
         two_days_clean[,2], 
         type="n", 
         xlab="",
         ylab="Global Active Power (kilowatts)")
    
    lines(two_days_clean[,1], two_days_clean[,2], type="l") 
    dev.off()
}