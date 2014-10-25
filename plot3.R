NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimore <- NEI[NEI$fips == "24510",]

# sum up emissions grouped by year and type
emission_sums <- aggregate(Baltimore$Emissions, by=list(Baltimore$year, Baltimore$type),sum)
colnames(emission_sums) <- c("year", "type", "emission")

library(ggplot2)
png("plot3.png", width=720, height=480)
qplot(year, emission, data = emission_sums, facets = . ~ type, main="Baltimore City", xlab="Year", ylab="Total Emission from PM25")
dev.off()

## Only the "POINT" source has seen increase in emissions,
## the other 3 sources have seen decreases in emission. 