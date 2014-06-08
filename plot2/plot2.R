# R code for creating line Plot for Global Active Power data [1 Feb 2007 & 2 Feb 2007]
# Author: Sitaram Tadepalli

# Prerequisites for the assignment
# Select a folder where you will be executing the assignment and set it as working directory
# Download the  Electric power consumption dataset to working directory and name it as exdata.txt

# Load exdata into R from the working directory. 
exdata <- read.table("exdata.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

# Subsetting the exdata to filter out records for 1 FEB 2007 & 2 FEB 2007
exdata.feb <- exdata[(exdata$Date=="1/2/2007"|exdata$Date=="2/2/2007"),]

# Strip Date and convert it into Date format
exdata.feb$Date <- strptime(exdata.feb$Date,"%d/%m/%Y")
exdata.feb$Date <- as.Date(exdata.feb$Date)

# Create a new datetime variable for each date and time observation
exdata.feb$datetime <- as.POSIXct(paste(exdata.feb$Date, exdata.feb$Time), format="%Y-%m-%d %H:%M:%S")

# Open a graphic device using png().plot2.png will be plotted in plot2 of working directory. 
png(filename="plot2/plot2.png",width=480,height=480,bg = "transparent")

# Plot Global Active Power data for the selection days.
plot(exdata.feb$datetime,exdata.feb$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

dev.off() # Off the Graphic device environment.

