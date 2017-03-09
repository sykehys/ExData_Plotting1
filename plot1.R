###Plot1
##Step 1
#set working directory
setwd("C:/Users/Philippine/Desktop/coursera/Exploratory")
if(!file.exists("data")) {dir.create ("data")}
DF1 <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", 
                  stringsAsFactors=FALSE, dec=".")

subSetData <- DF1[DF1$Date %in% c("1/2/2007","2/2/2007") ,]



#str(subSetData)

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
