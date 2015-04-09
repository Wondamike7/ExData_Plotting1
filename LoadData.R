## My first steps were to unzip the file that I downloaded into working directory
## Then load it in as a data table

filename <- "household_power_consumption.txt"
zipfile <- "exdata_data_household_power_consumption.zip"
if(!filename %in% list.files()) {
	## check for zip file if data file not found
	if(!zipfile %in% list.files()) { stop("did not find data file or zip file") } ## exit if neither txt nor zip are found

	library(utils) ## to get unzip
	unzip(zipfile) ## unzip to get txt file
}	

## read in data from txt file
dat <- read.table(filename, 
		sep = ";", header = TRUE, 
		na = "?", quote = "", 
		comment.char="", stringsAsFactors = FALSE)

## need to subset by date but also need to merge date and time
## dates begin in character format, with %d/%m/%Y
dat_sub <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007",] ## subset to two days of interest, in character format
dim(dat_sub) ## 2880 obs of 9 vars
str(dat_sub)
summary(dat_sub)

## merge date and time and convert to date/time var all at once
dat_sub$DateTime <- strptime(paste(dat_sub$Date,dat_sub$Time), "%d/%m/%Y %H:%M")

## scrap notes
## this changes the Date var to date format: dat_sub$Date <- as.Date(dat_sub$Date, "%d/%m/%Y")
## this worked for subsetting after changing to date formate: dat_sub <- dat[dat$Date=="2007-02-01" | dat$Date == "2007-02-02",]
## this code changes Time into time format: dat_sub$Time <- strptime(dat_sub$Time, "%H:%M")
## But also assigned today's date as part of the time format...

