data = read.csv('household_power_consumption.txt',header=TRUE, sep=";", skip=66636, nrows=2880);
data = read.csv('household_power_consumption.txt',header=TRUE, sep=";", nrows=69516, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?");
data = data[66637:dim(data)[1],];

# plot histogram for global active power data in red with specified ranges for x and y
hist(data$Global_active_power, col="red",xlim=c(0,6),ylim=c(0,1200), axes=FALSE, xlab="Global Active Power (kilowatts)",main="Global Active Power");
# add x axis
axis(1, at=seq(0,6, by=2), labels=seq(0,6, by=2));
# add y axis
axis(2, at=seq(0,1200, by=200), labels=seq(0,1200, by=200));


data[,1] = as.Date(data[,1],format="%d/%m/%Y");
#data[,2] = strptime(data[,2],format="%H:%M:%S");