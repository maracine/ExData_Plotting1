# 
# Michel Racine
#
# Exploratory Data Analysis
# Peer-graded Assignment: Course Project 1
#
#
# If required, set working directory:
#   setwd("c:/users/Michel/dropbox/Coursera/Data Science - John Hopkin's/Exploratory Data Analysis/Week 1/Course Project 1/ExData_Plotting1")

# Using the sqldf library.
library(sqldf)


# Use sqldf's read.csv to load the table, by selecting only records within the date interval of 1/2/2007 and 2/2/2007
hpc <- read.csv.sql(
     file="hpc.txt",
     header = TRUE,
     sep=";",
     stringsAsFactors = FALSE,
     sql="SELECT * FROM file WHERE Date between '1/2/2007' and '2/2/2007'")

# Prepare output file format
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# plot histogram for "Global Active Power"
hist( hpc[["Global_active_power"]], main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red" )

# Save plot 
dev.off()
