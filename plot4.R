df<-read.table('household_power_df.txt',header = TRUE, na.strings = '?',sep = ';')

df$Date <- as.Date(df$Date , format = "%d/%m/%Y")

df<- subset(df,df$Date >= as.Date('1/2/2007', format = "%d/%m/%Y" ) & df$Date <= as.Date('2/2/2007',format = "%d/%m/%Y"))

nrow(df)

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))
df$DateTime

png('plot4.png',width = 480 , height = 480)
par(mfrow = c(2, 2))
plot(df$DateTime, df$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(df$DateTime, df$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(df$DateTime, df$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(df$DateTime, df$Sub_metering_2, col = 'red')
lines(df$DateTime, df$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),lty = 1, lwd = 1)
plot(df$DateTime, df$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()
