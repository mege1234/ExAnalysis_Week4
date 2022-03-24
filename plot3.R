#install packages
library(dplyr)
library(ggplot2)

#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data
NEIsub <- subset(NEI, fips == "24510")

NEIEmissions <- NEIsub %>%
    group_by(year, type) %>%
    summarise(Emissions = sum(Emissions))
head(NEIEmissions)
#create plot
png(filename = "./plot3.png", width =480, height = 480)
ggplot(NEIEmissions, aes(year, Emissions, color = type)) + geom_line()
dev.off()
