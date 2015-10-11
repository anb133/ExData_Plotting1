if (!exists("data")) {
    # Download data and import in R 
    fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, "./Electric Power Consumption", mode="wb")
    unzip(zipfile="./Electric Power Consumption",)
    epc<- read.table("household_power_consumption.txt", header=T, na.strings = "?", sep=";")
    head(epc)
    
    # Convert Date variable to Date/Time class
    epc$Date<- as.Date(epc$Date, "%d/%m/%Y")
    
    # Create a new data set using data from the dates 2007-02-01 and 2007-02-02.
    data<- epc[epc$Date==("2007-02-01")| epc$Date==("2007-02-02"),]
    
    # Create a new variable DateTime in data that combines both Time and Time. DateTime has a Date/Time class.
    DateTime <-strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")
    data<- cbind(DateTime, data)
    head(data)}

# Generating the Second Plot
png("plot2.png")
with(data, plot(Global_active_power ~ data$DateTime,
                type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()