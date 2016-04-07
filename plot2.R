#Read the table
a<-read.table("C:/Users/Diego/Documents/household_power_consumption.txt",sep=";",header = TRUE)

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

#Transform variable as numeric
globalActivePower <- as.numeric(b$Global_active_power)

#Plot1
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
