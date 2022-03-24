#install packages
library(dplyr)

#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data
NEIsub <- subset(NEI, year = c(1999, 2002, 2005, 2008))
NEIyear <- NEIsub$year
NEIEmissions <- NEIsub %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

#create plot
png(filename = "./plot1.png", width =480, height = 480)
plot(NEIEmissions$year, NEIEmissions$Emissions, main = "Total Emissions by Year", xlab = "year", ylab = "total emissions", pch = 19)
dev.off()
