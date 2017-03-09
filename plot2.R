setwd("C:/Users/Philippine/Desktop/coursera/Exploratory")
if(!file.exists("data")) {dir.create ("data")}
DF1 <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", 
                  stringsAsFactors=FALSE, dec=".")

subSetData <- DF1[DF1$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
