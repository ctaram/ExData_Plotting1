# R code for creating Histogram for Global Active Power [1 Feb 2007 & 2 Feb 2007]
# Author: Sitaram Tadepalli

# Prerequisites for the assignment.
# Select a folder where you will be executing the assignment and set it as working directory
# Download the  Electric power consumption dataset to working directory and name it as exdata.txt

# Load exdata into R from the working directory. 
exdata <- read.table("exdata.txt",header=TRUE,sep=";",stringsAsFactors=FALSE)

# Subsetting the exdata to filter out records for 1 FEB 2007 & 2 FEB 2007
exdata.feb <- exdata[(exdata$Date=="1/2/2007"|exdata$Date=="2/2/2007"),]

# Open a graphic device using png().plot1.png will be plotted in plot1 of working directory. 
png(filename="plot1/plot1.png",width=480,height=480,bg = "transparent")

# Plot histogram for Global Active Power data.
hist(exdata.feb$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)",bg="blue")
dev.off() # Off the Graphic device environment.
