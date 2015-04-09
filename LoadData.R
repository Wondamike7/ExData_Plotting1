## Look for the data files first

zipfile <- "exdata_data_household_power_consumption.zip"
filename <- "household_power_consumption.txt"
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

## subset to two days of interest - Feb 1, 2007 and Feb 2, 2007
## dates begin in character format, with %d/%m/%Y
dat_sub <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007",] ## subset to two days of interest, in character format
dim(dat_sub) ## 2880 obs of 9 vars
# str(dat_sub)
#summary(dat_sub)

## merge date and time and convert to date/time var all at once
dat_sub$DateTime <- strptime(paste(dat_sub$Date,dat_sub$Time), "%d/%m/%Y %H:%M")
