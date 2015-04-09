## look for the program to load data, if not found, change directory
if(!"LoadData.R" %in% list.files()) {
	setwd("C:/Users/fieldrep/Documents/Coursera/Repositories/ExData_Plotting1/")
}

## with LoadData in directory, source the program to load and tidy the dataset
## note: this will error out if the data set (or the source zip file) are not in the working directory
source("LoadData.R")

## open a workspace for the png file
png(filename = "plot3.png", 
	height = 480, width = 480,
	units = "px", bg = "white")
	
## make the plot in steps - start with simple line chart, add two additional lines, then add legend
plot(dat_sub$DateTime,dat_sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat_sub$DateTime,dat_sub$Sub_metering_2,col="red")
lines(dat_sub$DateTime,dat_sub$Sub_metering_3,col="blue")
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),x="topright",lwd=1,col=c("black","red","blue"))

## close the png workspace
dev.off()