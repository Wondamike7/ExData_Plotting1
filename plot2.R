## look for the program to load data, if not found, change directory
if(!"LoadData.R" %in% list.files()) {
	setwd("C:/Users/fieldrep/Documents/Coursera/Repositories/ExData_Plotting1/")
}

## with LoadData in directory, source the program to load and tidy the dataset
## note: this will error out if the data set (or the source zip file) are not in the working directory
source("LoadData.R")

## open a workspace for the png file
png(filename = "plot2.png", 
	height = 480, width = 480,
	units = "px", bg = "white")
	
## make the plot
with(dat_sub,
	plot(DateTime,Global_active_power, 
		type="l", xlab="", 
		ylab="Global Active Power (kilowatts)")
)

## close the png workspace
dev.off()