## Nicholas DeVan
ecp <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?");
ecp.df <- data.frame(ecp);
ecp.df$Date2 <- as.Date(ecp.df$Date,"%d/%m/%Y");
ecp.sub <- subset(ecp.df, Date2 >= "2007-02-01" & Date2 <= "2007-02-02" );
hist(ecp.sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red");
dev.copy(png, file = "plot1.png", width = 480, height = 480);
dev.off();
