library(dplyr)
#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#subset data
NEIsub <- subset(NEI,fips == "24510")
NEIEmissions <- NEIsub %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))
png(filename = "./plot2.png", width =480, height = 480)
plot(NEIEmissions$year, NEIEmissions$Emissions, main = "Total Emissions by Year in Baltimore City", xlab = "year", ylab = "total emissions", pch = 19)
dev.off()
