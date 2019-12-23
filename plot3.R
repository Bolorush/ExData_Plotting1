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

# rotulos 
data$Time[1:1440] <- format(data$Time[1:1440], "2007-02-01 %H:%M:%S") 
data$Time[1441:2880] <- format(data$Time[1441:2880], "2007-02-02 %H:%M:%S") 

# Elaborar tercer grafico

plot(data$Time,data$Sub_metering_1,type="l", ylab= "Energy sub metering ", xlab="")
with(data,lines(data$Time,data$Sub_metering_2,col="red"))
with(data,lines(data$Time,data$Sub_metering_3,col="blue"))
legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1)

dev.copy(png,file="plot3.png")
dev.off()


