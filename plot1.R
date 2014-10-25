NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sum up emissions per year (Pollutant is "PM25-PRI" in all rows!)
emission_sums <- rowsum(NEI$Emissions, as.factor(NEI$year))

png("plot1.png", width=480, height=480)
plot(rownames(emission_sums), emission_sums, main="United States - All Sources", xlab="Year", ylab="Total Emission from PM25", pch=8)
dev.off()
