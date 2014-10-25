NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum up emissions per year (Pollutant is "PM25-PRI" in all rows!)
Baltimore <- NEI[NEI$fips == "24510",]
emission_sums <- rowsum(Baltimore$Emissions, as.factor(Baltimore$year))

png("plot2.png", width=480, height=480)
plot(rownames(emission_sums), emission_sums, main="Baltimore City - All Sources", xlab="Year", ylab="Total Emission from PM25", pch=8)
dev.off()

## Emissions in Baltimore City decreased, then increased and ended up much lower in 2008 compared to 1999.