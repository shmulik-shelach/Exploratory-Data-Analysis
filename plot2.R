plot2  <- function () {
  
  #downloading the file and unzipped
  
  myUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  if (file.exists ("tempFile.zip")) {
    file.remove ("tempFile.zip")
  } 
  else {
    file.create ("tempFile.zip")
  }   
  
  download.file (myUrl, "tempFile.zip")
  
  ConsumptionData <- read.table (unz ("tempFile.zip", "household_power_consumption.txt"), header = TRUE, sep = ";", na.string = "?")
  #  close (con)
  
  DatasetForPlots <- subset (ConsumptionData, Date == "1/2/2007" | Date == "2/2/2007", 
                             select = Date:Sub_metering_3)
  
#  Sys.setlocale("LC_TIME","English_United States")
  
#  DatasetForPlots$day <- weekdays(as.Date(DatasetForPlots$Date))
 
DatasetForPlots$TimeDay <- strptime(paste(DatasetForPlots$Date, DatasetForPlots$Time, sep=" "), 
                                    format="%d/%m/%Y %H:%M:%S")

plot (DatasetForPlots$TimeDay, newData$Global_active_power ,type = "l", ylab = "Global active power (Kilowatts)",
      xlab = " ")

dev.copy (png, file = "plot2.png", width = 480, height = 480)

dev.off()

#  return (head (DatasetForPlots))
}