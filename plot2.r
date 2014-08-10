## Nicholas DeVan
ecp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?");
ecp.df <- data.frame(ecp);
ecp.df$Date2 <- as.Date(ecp.df$Date,"%d/%m/%Y");
ecp.sub <- subset(ecp.df, Date2 >= "2007-02-01" & Date2 <= "2007-02-02" );
ecp.sub$DateTime <- strptime(paste(ecp.sub$Date,ecp.sub$Time), "%d/%m/%Y %H:%M:%S");
plot(ecp.sub$DateTime, ecp.sub$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="");
dev.copy(png, file = "plot2.png", width = 480, height = 480);
dev.off();
