## look for the program to load data, if not found, change directory
if(!"LoadData.R" %in% list.files()) {
	setwd("C:/Users/fieldrep/Documents/Coursera/Repositories/ExData_Plotting1/")
}

## with LoadData in directory, source the program to load and tidy the dataset
## note: this will error out if the data set (or the source zip file) are not in the working directory
source("LoadData.R")

## open a workspace for the png file
png(filename = "plot4.png", 
	height = 480, width = 480,
	units = "px", bg = "white")

## set parameters to build four charts in one. didn't change any margins or other global parameters.
par(mfrow = c(2,2)) ## will build left to right for top row and then bottom row

## first plot (plot2 from previous)
plot(dat_sub$DateTime, dat_sub$Global_active_power, 
		type = "l", xlab = "", ylab = "Global Active Power") ## label doesn't show (kilowatts) anymore
	
## second plot (new)
plot(dat_sub$DateTime, dat_sub$Voltage,
	type = "l", xlab = "datetime", ylab = "Voltage")
	
## third plot (plot3 from previous)
plot(dat_sub$DateTime,dat_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat_sub$DateTime,dat_sub$Sub_metering_2,col="red")
lines(dat_sub$DateTime,dat_sub$Sub_metering_3,col="blue")
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
	x = "topright", lwd = 1, cex = 0.9,
	col = c("black","red","blue"), bty = "n")
	## unlike plot 3, this has no box around the legend, and the legend also needs to be smaller (cex = 0.9 looked about right)

## fourth plot (new)
plot(dat_sub$DateTime, dat_sub$Global_reactive_power,
	type = "l", xlab = "datetime", ylab = "Global_reactive_power")
	
## close the png workspace
dev.off()