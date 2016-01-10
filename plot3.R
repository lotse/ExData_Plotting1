powerData <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, sep=";")
headernames <- read.table("household_power_consumption.txt", skip=0, nrows=1, sep=";", stringsAsFactors = FALSE)
colnames(powerData) <- unlist(headernames)
datetime <- strptime(paste(powerData$Date, powerData$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))

with(powerData, plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))

lines(datetime, powerData$Sub_metering_1, type="l", col="black")
lines(datetime, powerData$Sub_metering_2, type="l", col="red")
lines(datetime, powerData$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=0.8)

dev.copy(png, file="plot3.png")
dev.off()