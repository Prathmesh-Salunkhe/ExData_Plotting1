df<-read.table('household_power_consumption.txt',header = TRUE, na.strings = '?',sep = ';')

df$Date <- as.Date(df$Date , format = "%d/%m/%Y")

df<- subset(df,df$Date >= as.Date('1/2/2007', format = "%d/%m/%Y" ) & df$Date <= as.Date('2/2/2007',format = "%d/%m/%Y"))

nrow(df)

df$DateTime <- as.POSIXct(paste(df$Date,df$Time))
df$DateTime
head(df)

png('plot2.png',width = 480,height = 480)
plot(df$Global_active_power~df$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
