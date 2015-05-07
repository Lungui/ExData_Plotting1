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

 ##plot3
png(filename = "plot3.png", width = 480, height = 480, bg = "white")
with(data, {
    plot(Sub_metering_1 ~ data$Datetime, type = "l", 
    ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ data$Datetime, col = 'Red')
    lines(Sub_metering_3 ~ data$Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()
dev.off()

