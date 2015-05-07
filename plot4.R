##Reading data

alldata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?",
col.names = c("Date", "Time", "Global_active_power","Global_reactive_power","Voltage",
"Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
alldata$Date <- as.Date(alldata$Date, format = "%d/%m/%Y")

## Subsetting the data
data <- subset(alldata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(alldata)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##change time language from Spanish to English
language <- "English"
Sys.setlocale("LC_TIME", language) 

##plot4
png(filename = "plot4.png", width = 480, height = 480, bg = "white")
par(mfrow=c(2,2))
with(data,{
plot(Global_active_power ~ data$Datetime, type = "l",ylab ="Global Active Power", xlab = "")
plot(Voltage ~ Datetime, type = "l", ylab = "Voltage",xlab = "datetime")
plot(Sub_metering_1 ~ data$Datetime, type = "l", 
    ylab = "Energy sub metering", xlab = "")
    lines(Sub_metering_2 ~ data$Datetime, col = 'Red')
    lines(Sub_metering_3 ~ data$Datetime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), bty = "n",
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ Datetime, type = "l", 
          ylab = "Global_reactive_power", xlab = "datetime")
})
dev.copy(png,file="plot4.png")
dev.off()
dev.off()

