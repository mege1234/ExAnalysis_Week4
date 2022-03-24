#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

#identify records in Baltimore City
subVehiclesNEI <- subset(vehiclesNEI, fips == "24510")

#create plot
png(filename = "./plot5.png", width =480, height = 480)
ggplot(subVehiclesNEI, aes(factor(year),Emissions)) +
    geom_bar(stat="identity", position = "stack", fill="purple") +
    theme_bw() + guides(fill = FALSE) + 
    labs(x = "year", y = "Emissions")
dev.off()

