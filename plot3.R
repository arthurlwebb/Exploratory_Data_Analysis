## Getting data
hpcData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcData$Date <- as.Date(hpcData$Date, format="%d/%m/%Y")

## Create subset
hpcSubset <- subset(hpcData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpcData)

## Reformat dates
dateReformat <- paste(as.Date(hpcSubset$Date), hpcSubset$Time)
hpcSubset$Datetime <- as.POSIXct(dateReformat)

## Create plot 3
with(hpcSubset, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Saving to png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()