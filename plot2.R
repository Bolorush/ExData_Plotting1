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

# Trabajar el formato de las fechas
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# Trabajar el formato del tiempo
data$Time <- strptime(data$Time, format = "%H:%M:%S")

# rotulos 43
data$Time[1:1440] <- format(data$Time[1:1440], "2007-02-01 %H:%M:%S") 
data$Time[1441:2880] <- format(data$Time[1441:2880], "2007-02-02 %H:%M:%S") 
# Elaborar segundo grafico
plot(data$Time,data$Global_active_power,type="l", ylab= "Global Active Power (kilowatts) ", xlab="")

dev.copy(png,file="plot2.png")
dev.off()

