## Nicholas DeVan
ecp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?");
ecp.df <- data.frame(ecp);
ecp.df$Date2 <- as.Date(ecp.df$Date,"%d/%m/%Y");
ecp.sub <- subset(ecp.df, Date2 >= "2007-02-01" & Date2 <= "2007-02-02" );
ecp.sub$DateTime <- strptime(paste(ecp.sub$Date,ecp.sub$Time), "%d/%m/%Y %H:%M:%S");
attach(ecp.sub)
par(mfrow = c(2,2))
plot(DateTime, Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="");
plot(DateTime, Voltage, type="l");
plot(DateTime, Sub_metering_1, ylab="Energy sub metering", type="l", xlab="");
lines(DateTime, Sub_metering_2, col="red");
lines(DateTime, Sub_metering_3, col="blue");
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"), lty=c(1,1,1));
plot(DateTime, Global_reactive_power, type="l");
dev.copy(png, file = "plot4.png", width = 480, height = 480);
dev.off();