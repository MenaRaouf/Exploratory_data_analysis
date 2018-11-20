library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore.city <- subset(NEI, fips == "24510")

vehicleSource <- SCC[grepl("[Vv]ehicle", SCC$Short.Name),]

vehicleNEI <- subset(baltimore.city, baltimore.city$SCC %in% vehicleSource$SCC)

X1 <- aggregate(vehicleNEI[c("Emissions")], list(year = vehicleNEI$year , type = vehicleNEI$type), sum)

png('plot5.png', width=480, height=480)

p <- ggplot(X1 , aes(x=year, y=Emissions, colour = type ) )
p <- p + geom_point()
p <- p + geom_smooth (method = 'loess')
p <- p +ggtitle("Total PM2.5 Emissions in Baltimore from vehicles 1999-2008")
print(p)

dev.off()