plot4 <- function(){
    # read in the data (80.000 rows)
    fileName <- "household_power_consumption.txt";
    data <- read.csv(fileName,header=TRUE, sep=";", nrows=80000, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");
    # only use dates from 1/2/2007 - 2/2/2007
    data <- data[((data[,1] == "1/2/2007") | (data[,1] == "2/2/2007")),];
    
    # open plot device
    png("plot4.png", bg="transparent", width=504, height=504);
    
    # create subplots 2 x 2
    par(mfrow=c(2,2));
    
    # first plot (modification of plot1())
    plot(data$Global_active_power, t="l", axes=FALSE, xlab="", ylab="Global Active Power");    
    axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"));
    axis(2,at=c(0,2,4,6), labels=c(0,2,4,6));
    box();
    
    # second plot
    plot(data$Voltage, t="l", axes=FALSE, xlab="datetime", ylab="Voltage");
    # set the axis
    axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"));
    axis(2,at=c(234,238,242,246), labels=c(234,238,242,246));
    box();
    
    # third plot (modification of plot3())
    # plot data as line for sub metering 1
    plot(data$Sub_metering_1, t="l", axes=FALSE, xlab="", ylab="Energy sub metering", col="black");
    # add line for submetring 2
    points(data$Sub_metering_2, t="l",col="red");
    # add line for submeering 3
    points(data$Sub_metering_3, t="l", col="blue");
    axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"));
    axis(2,at=c(0,10,20,30), labels=c(0,10,20,30));    
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), bty="n")
    box();
    
    # fourth plot
    plot(data$Global_reactive_power, t="l", axes=FALSE, xlab="datetime", ylab="Global_reactive_power");
    # set the axis
    axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"));
    axis(2,at=c(0,0.1,0.2,0.3,0.4,0.5), labels=c("0.0","0.1","0.2","0.3","0.4","0.5"));
    box();
    dev.off();
}
