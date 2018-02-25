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

# plot histogram for "Global Active Power"
hist( hpc[["Global_active_power"]], main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red" )

# Save plot to plot1.png
dev.copy ( png, file = "plot1.png" )
dev.off()
