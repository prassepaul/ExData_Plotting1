plot2 <- function(){
    # read in the data (80.000 rows)
    fileName <- "household_power_consumption.txt";
    data <- read.csv(fileName,header=TRUE, sep=";", nrows=80000, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");
    # only use dates from 1/2/2007 - 2/2/2007
    data <- data[((data[,1] == "1/2/2007") | (data[,1] == "2/2/2007")),];
    
    # open plot device
    png("plot2.png", bg="transparent", width=504, height=504);
    
    # plot data as line
    plot(data$Global_active_power, t="l", axes=FALSE, xlab="", ylab="Global Active Power (kilowatts)");    
    
    # change the axis
    axis(1,at=c(0,1441,2880),labels=c("Thu","Fri","Sat"));
    axis(2,at=c(0,2,4,6), labels=c(0,2,4,6));
    box();
    dev.off();
    
}
