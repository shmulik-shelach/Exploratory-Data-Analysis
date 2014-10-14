

plot1  <- function () {
  
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
plot1 <- hist (DatasetForPlots$Global_active_power, main = "Global active power", 
          xlab = "Global active power (Kilowatts)", col = "Red")

dev.copy (png, file = "plot1.png", width = 480, height = 480)

dev.off()

}
  
  