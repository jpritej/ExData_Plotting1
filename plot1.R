## Load the data corresponding to the days 2007-02-01 and 2007-02-02
data<-read.table("household_power_consumption.txt",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",nrows=2880,skip=66637)
## Add a new column with the strings Date and Time transformed into a new variable of type Date/Time
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## Open the PNG device with the required size
png(file="plot1.png",width=480,height=480,bg="transparent")
## Construct the plot in the PNG device with the required options to look like the examples
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",ylim=c(0,1200))
## Close the PNG device and create the file
dev.off()

