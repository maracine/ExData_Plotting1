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

# Convert the Date and Time variables to Date/Time class
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
dateTime <- paste(hpc$Date, hpc$Time)
hpc.DateTime <- as.POSIXct(dateTime)


# Prepare output file format
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

# Format output plots using a 2 by 2 Matrix
par(mfrow = c ( 2, 2) )

# First Plot Global Active Power in position 1,1
plot ( hpc.DateTime , hpc[["Global_active_power"]] , type = "l" , ylab = "Global Active Power" , xlab = "")

# Second plot Voltage in position 1,2
plot ( hpc.DateTime , hpc[["Voltage"]] , type = "l" , ylab = "Voltage", xlab = "Date & Time")

# 3rd plot Energy sub metering in position 2,1
plot ( hpc.DateTime , hpc[["Sub_metering_1"]], type = "l" , ylab = "Energy sub metering" , xlab = "" )
lines( hpc.DateTime , hpc[["Sub_metering_2"]], col = "red", type = "l" , ylab = "", xlab = "" )
lines( hpc.DateTime , hpc[["Sub_metering_3"]], col = "blue", type = "l" , ylab = "", xlab = "" )
legend ( "topright", legend = c ( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c ( "black", "red", "blue" ) )

#4th plot Reactive power in positon 2,2
plot ( hpc.DateTime , hpc[["Global_reactive_power"]] , type = "l" , ylab = "Global Reactive Power", xlab = "Date & Time" )


# Save plotS
dev.off()
