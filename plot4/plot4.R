# R code for creating Four plots for Energy power consumption dataset [1 Feb 2007 & 2 Feb 2007]
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

# Open a graphic device using png().plot4.png will be plotted in plot4 of working directory. 
png(filename="plot4/plot4.png",width=480,height=480,bg = "transparent")

# Use par() function to have four plots in one
par(mfcol=c(2,2))

# First Plot: Global Active Power data for the selection days.
  plot(exdata.feb$datetime,exdata.feb$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l")

# Second Plot: Energy sub metering data for the selection days.

  plot(exdata.feb$datetime,exdata.feb$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")

  # Use points function to plot metering one by one
    points(exdata.feb$datetime,exdata.feb$Sub_metering_1,type="l")
    points(exdata.feb$datetime,exdata.feb$Sub_metering_2,type="l",col="Red")
    points(exdata.feb$datetime,exdata.feb$Sub_metering_3,type="l",col="Blue")

  # Use Legend function to specify legend on top right cornor of the plot
    legend("topright",pch="____",col=c("Black","Red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Third Plot: Voltage VS datetime
  plot(exdata.feb$datetime,exdata.feb$Voltage,type="l",ylab="Voltage",xlab="datetime")

# Fourth Plot: Global Reactive power VS datetime.
  plot(exdata.feb$datetime,exdata.feb$Global_reactive_power,type="l",,ylab="Global_reactive_power",xlab="datetime")


dev.off() # Off the Graphic device environment.
