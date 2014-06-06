library("lubridate")

setClass('myDate')
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

# Reads in the household data and returns a data frame that
# combines the first two original columns into a single date/time column
read_household_data <- function()
{
    # only read in the first column so we can get indices for the two days we want
    read_one_col = c("myDate", rep("NULL", 8))
    date_col <- read.table("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 na.strings = "?",
                 colClasses=read_one_col,
                 comment.char="")
    
    # Get all of the rows for 2/1/2007-2/2/2007
    two_days_indices = which(date_col[,1] == as.Date("2007-02-01", format="%Y-%m-%d") |
                             date_col[,1] == as.Date("2007-02-02", format="%Y-%m-%d"))
    
    # Read in all of the raw data
    two_days_raw <- read.table("household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = "?",
                               nrows = 2880,
                               skip = 66636,
                               colClasses = c(rep("character", 2), rep("numeric", 7)),
                               comment.char="")
    
    # Return a data frame that combines the original first two columns into 
    # a single date/time column
    two_days_clean <- cbind(dmy_hms(paste(two_days_raw[,1], two_days_raw[,2])), 
                            two_days_raw[,3:9])
    
    colnames(two_days_clean) <- c("dateAndTime", 
                                  "globalActivePower",
                                  "globalReactivePower",
                                  "voltage",
                                  "globalIntensity",
                                  "subMetering1",
                                  "subMetering2",
                                  "subMetering3")
    
    return(two_days_clean)
}