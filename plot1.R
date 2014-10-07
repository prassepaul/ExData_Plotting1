plot1 <- function(){
    # read in the data (80.000 rows)
    fileName <- "household_power_consumption.txt";
    data <- read.csv(fileName,header=TRUE, sep=";", nrows=80000, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");
    # only use dates from 1/2/2007 - 2/2/2007
    data <- data[((data[,1] == "1/2/2007") | (data[,1] == "2/2/2007")),];
    
    # open plot device
    png("plot1.png", bg="transparent", width=504, height=504);
    # plot histogram for global active power data in red with specified ranges for x and y
    hist(data$Global_active_power, col="red",xlim=c(0,6),ylim=c(0,1200), axes=FALSE, xlab="Global Active Power (kilowatts)",main="Global Active Power");
    # add ticks for x axis
    axis(1, at=seq(0,6, by=2), labels=seq(0,6, by=2));
    # add ticks for y axis
    axis(2, at=seq(0,1200, by=200), labels=seq(0,1200, by=200));
    dev.off()
}