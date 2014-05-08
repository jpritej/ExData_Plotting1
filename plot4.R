## Set the locale to C-like language (North-American usage)
Sys.setlocale("LC_TIME", "C")
## Load the data corresponding to the days 2007-02-01 and 2007-02-02
data<-read.table("household_power_consumption.txt",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";",nrows=2880,skip=66637)
## Add a new column with the strings Date and Time transformed into a new variable of type Date/Time
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## Open the PNG device with the required size
png(file="plot4.png",width=480,height=480,bg="transparent")

## Create an array of figures
par(mfcol=c(2,2))

## Construct the 1st plot in the PNG device with the required options to look like the examples
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

## Construct the 2nd plot without the data in the PNG device with the required options to look like the examples
plot(data$DateTime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
## Add the data lines corresponding to each one of the submeters
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
## Add the legend
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),bty="n")

## Construct the 3rd plot in the PNG device with the required options to look like the examples
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

## Construct the 4th plot in the PNG device with the required options to look like the examples
plot(data$DateTime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

## Close the PNG device and create the file
dev.off()