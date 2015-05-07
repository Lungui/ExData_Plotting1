##Reading data

alldata <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?")
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##change language from Spanish to English
language <- "English"
Sys.setlocale("LC_TIME", language) 

## Generating Plot 2
png(filename = "plot2.png", width = 480, height = 480, bg = "white")
plot(data$Global_active_power ~ data$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,file="plot2.png")
dev.off()
dev.off()


