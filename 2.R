NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


baltimore.city <- subset(NEI, fips == "24510")

X1 <- aggregate(baltimore.city[c("Emissions")], list(year = baltimore.city$year), sum)

png('plot2.png', width=480, height=480)

plot(y= X1$Emissions , x = X1$year ,type = "l" , xlab = "Year" , ylab = "Emissions" , main = "total emissions from PM2.5 in the Baltimore City")

dev.off()