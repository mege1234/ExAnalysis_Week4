library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#head(NEI)
#head(SCC)
#summary(NEI)
#dim(NEI)
#str(NEI)
#summary(NEI$Emissions)
NEIsub <- subset(NEI, year = c(1999, 2002, 2005, 2008))
#dim(NEIsub)
#str(NEIsub)
#summary(NEIsub)
NEIyear <- NEIsub$year
NEIEmissions <- NEIsub %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))
png(filename = "./plot1.png", width =480, height = 480)
plot(NEIEmissions$year, NEIEmissions$Emissions, main = "Total Emissions by Year", xlab = "year", ylab = "total emissions", pch = 19)
