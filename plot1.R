##Step 1
#set working directory
setwd("C:/Users/Philippine/Desktop/coursera/Exploratory")
if(!file.exists("data")) {dir.create ("data")}
DF1 <- read.table("./data/household_power_consumption.txt", sep=";", na.strings = "?",
                  col.names = c("Date", "Time", "Global_active_power",
                                "Global_reactive_power", "Voltage", "Global_intensity",
                                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  stringsAsFactors=FALSE)
DF1 <- DF1[-1,]

DF1_1 <- subset(DF1, grepl("1/2/2007", DF1$Date))
DF1_1 <- DF1_1[-(1441:4320),]
DF1_2 <- subset(DF1, grepl("2/2/2007", DF1$Date))
DF1_2 <- DF1_2[-(1441:4320),]
rm(DF1)
DF1 <- rbind(DF1_1, DF1_2)
rm(DF1_1, DF1_2)

DF1[,c(3:9)]<- sapply(DF1[,c(3:9)], as.numeric)
DF1[,1]<-as.Date(DF1$Date, "%d/%m/%Y")

Sys.setlocale("LC_TIME", "C")
DF1$Time <- strptime(DF1$Time, format = "%H:%M:%S")


#Plot 1
hist(DF1$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     main="Global Active power")