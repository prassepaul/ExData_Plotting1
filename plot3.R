plot3 <- function(){
    # read in the data (80.000 rows)
    fileName <- "household_power_consumption.txt";
    data <- read.csv(fileName,header=TRUE, sep=";", nrows=80000, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");
    # only use dates from 1/2/2007 - 2/2/2007
    data <- data[((data[,1] == "1/2/2007") | (data[,1] == "2/2/2007")),];
    
    # open plot device
    png("plot3.png", bg="transparent", width=504, height=504);
    
    # plot data as line for sub metering 1
    plot(data$Sub_metering_1, t="l", axes=FALSE, xlab="", ylab="Energy sub metering", col="black");
    # add line for sub metring 2
    points(data$Sub_metering_2, t="l",col="red");
    # add line for sub meering 3
    points(data$Sub_metering_3, t="l", col="blue");
    
    # change axis
    axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"));
    axis(2,at=c(0,10,20,30), labels=c(0,10,20,30));
    
    # add legend with box
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
    box();
    dev.off();
}
