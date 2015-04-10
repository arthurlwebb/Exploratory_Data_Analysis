## Getting data
hpcData <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
hpcData$Date <- as.Date(hpcData$Date, format="%d/%m/%Y")

## reate subset
hpcSubset <- subset(hpcData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(hpcData)

## Reformat dates
dateReformat <- paste(as.Date(hpcSubset$Date), hpcSubset$Time)
hpcSubset$Datetime <- as.POSIXct(dateReformat)

## Create plot 2
plot(hpcSubset$Global_active_power~hpcSubset$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Saving to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
