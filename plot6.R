NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Concerning motor vehicles:
## First I thought about using all mobile sources (Level One: 22)
## But these also include golf carts, locomotives, snow mobiles, ships, mining equipment, etc.
## Then I found the following documentation of EPA's MOVES (MOtor Vehicle Emission Simulator):
## https://www.cmascenter.org/smoke/documentation/3.1/html/ch02s08s04.html#tbl_concepts_vehicle_types
## and decided to use these SCC vehicle codes to find "motor vehicles" in the data
MOVES.vehicles.SCC <- c("0100", "0102", "0104", "0107", "0108", "3000", "3006", "3007")
extract_vehicle_code <- function(x){return(substring(x,3,6))}
SCC.motorvehicles <- SCC[sapply(SCC$SCC, extract_vehicle_code) %in% MOVES.vehicles.SCC,"SCC"]

Baltimore <- NEI[NEI$fips == "24510",]
motorvehicles.data <- Baltimore[Baltimore$SCC %in% SCC.motorvehicles,]


emission_sums <- rowsum(motorvehicles.data$Emissions, as.factor(motorvehicles.data$year))


png("plot5.png", width=480, height=480)
plot(rownames(emission_sums), emission_sums, main="Baltimore City - Motorvehicles", xlab="Year", ylab="Total Emission from PM25", pch=8)
dev.off()

## The motorvehicle emissions first increased, but decreased significantly in 2008.
