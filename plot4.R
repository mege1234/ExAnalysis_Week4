#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data
coalrel <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
combusrel <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coalcoms <- (combusrel & coalrel)
CombSCC <- SCC[coalcoms,]$SCC
CombNEI <- NEI[NEI$SCC %in% CombSCC,]

#identify records in Baltimore City
subVehiclesNEI <- subset(vehiclesNEI, fips == "24510")

#create plot
png(filename = "./plot4.png", width =480, height = 480)
ggplot(CombNEI, aes(factor(year), Emissions)) +
    geom_bar(stat="identity", position = "stack", fill="purple") +
    theme_bw() + guides(fill = FALSE) + 
    labs(x = "year", y = "Emissions")
dev.off()

