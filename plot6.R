#install packages
library(reshape2)
library(ggplot2)
library(dplyr)

#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#identify records in Baltimore City
subVehiclesNEI <- subset(vehiclesNEI, fips == "24510" | fips =="06037")

#create plot
png(filename = "./plot6.png", width =480, height = 480)
ggplot(subVehiclesNEI, aes(factor(year),Emissions)) +
    geom_bar(aes(fill = fips), stat = "identity", position = "dodge") +
    labs(x = "year", y = "Emissions") + 
    scale_fill_discrete(name = "US County", labels = c("Los Angeles County", "Baltimore City"))
dev.off()