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

# Generating the First Plot 
png("plot1.png")
with(data, hist(Global_active_power, col="red",main="Global Active power",
                xlab="Global Active Power (kilowatts)"))
dev.off()