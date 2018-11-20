library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

new.city <- subset(NEI, fips %in% c( "24510" , "06037"))

vehicleSource <- SCC[grepl("[Vv]ehicle", SCC$Short.Name),]

new.NEI <- subset(new.city, new.city$SCC %in% vehicleSource$SCC)

X1 <- aggregate(new.NEI[c("Emissions")], list(year = new.NEI$year , type = new.NEI$type , fibs = new.NEI$fips), sum)

png('plot6.png', width=480, height=480)


p <- ggplot(X1 , aes(x=year, y=Emissions, colour = fibs ) )
p <- p + geom_point()
p <- p + geom_smooth ()
p <- p +ggtitle("Total PM2.5 Emissions in Baltimore and Los Angeles from vehicles 1999-2008")
print(p)

dev.off()