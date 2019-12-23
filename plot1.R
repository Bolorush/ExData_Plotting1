#______________________________________________________________________________#
#   Exploratory Data Analysis - Project 1
#______________________________________________________________________________#

getwd()

# Establecer directorio donde se encuentran los datos
setwd("C:/Users/bsotomayor/Desktop/Data_Science/4. EDA/Project_1")

# Apertura de los datos
dat <- read.table("household_power_consumption.txt", header = T, sep=";", na.strings = "?")

# Recortar los datos entre 2007-02-01 y 2007-02-02  

data <- dat[dat$Date=="1/2/2007" | dat$Date=="2/2/2007",]

# Elaborar primer grafico

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()

