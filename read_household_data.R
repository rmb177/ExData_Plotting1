library("lubridate")

setClass('myDate')
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

# Reads in the household data and returns a data frame that
# combines the first two original columns into a single date/time column
read_household_data <- function()
{
    data <- read.table("household_power_consumption.txt",
                       header=TRUE,
                       sep=";",
                       na.strings = "?",
                       colClasses=c("myDate", "character", rep("numeric", 7)),
                       comment.char="")
    
    data <- subset(data, data[,1] == as.Date("2007-02-01", format="%Y-%m-%d") |
                         data[,1] == as.Date("2007-02-02", format="%Y-%m-%d"))
    
    data <- cbind(ymd_hms(paste(as.character(data[,1]), data[,2])), data)
    
    colnames(data) <- c("dateAndTime", 
                        "date",
                        "time",
                        "globalActivePower",
                        "globalReactivePower",
                        "voltage",
                        "globalIntensity",
                        "subMetering1",
                        "subMetering2",
                        "subMetering3")
    
    return(data)
}