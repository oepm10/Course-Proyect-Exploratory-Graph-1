#Read the table
a<-read.table("C:/Users/Diego/Documents/household_power_consumption.txt",sep=";",header = TRUE)

#Library "lubridate" for dates
install.packages("lubridate")
library("lubridate")

#Extract de dates
b<-a[(as.Date(dmy(a$Date))=="2007-02-01" | as.Date(dmy(a$Date))=="2007-02-02"),] 

#Clean and Replace the data, ? with a 0 for all variables
b$Global_active_power<-replace(as.character(b$Global_active_power),as.character(b$Global_active_power)=="?","0")
b$Global_reactive_power<-replace(as.character(b$Global_reactive_power),as.character(b$Global_reactive_power)=="?","0")
b$Voltage <-replace(as.character(b$Voltage),as.character(b$Voltage)=="?","0")
b$Global_intensity<-replace(as.character(b$Global_intensity),as.character(b$Global_intensity)=="?","0")
b$Sub_metering_1<-replace(as.character(b$Sub_metering_1),as.character(b$Sub_metering_1)=="?","0")
b$Sub_metering_2<-replace(as.character(b$Sub_metering_2),as.character(b$Sub_metering_2)=="?","0")

#Transforming Dates
datetime <- strptime(paste(b$Date, b$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Transforming Variables
globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)

#Ploting
png("Rplot4.png", width=480, height=480)

#Get the size for the plots
par(mfrow=c(2,2),mar=c(4,4,2,1))
#Graph1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
#Graph2
plot(datetime, b$Voltage, type="l", xlab="datetime", ylab="Voltage")
#Graph3
plot(datetime, Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#Graph4
plot(datetime, b$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
