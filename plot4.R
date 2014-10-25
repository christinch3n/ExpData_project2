NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal Combustion SCC
SCC.combustion <- SCC[regexpr(ignore.case = T, pattern = "Combustion", text = SCC$SCC.Level.One) > 0,]
SCC.combustion.coal <- SCC.combustion[regexpr(ignore.case = T, pattern = "Coal", text = SCC.combustion$SCC.Level.Three) > 0,"SCC"]


CoalCombustion.data <- NEI[NEI$SCC %in% SCC.combustion.coal,]
emission_sums <- rowsum(CoalCombustion.data$Emissions, as.factor(CoalCombustion.data$year))


png("plot4.png", width=480, height=480)
plot(rownames(emission_sums), emission_sums, main="United States - Coal Combustion Sources", xlab="Year", ylab="Total Emission from PM25", pch=8)
dev.off()

## Emissions did not change much until 2005, but decreased significantly in 2008.
