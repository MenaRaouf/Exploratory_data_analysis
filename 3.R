library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore.city <- subset(NEI, fips == "24510")

X1 <- aggregate(baltimore.city[c("Emissions")], list(year = baltimore.city$year , type = baltimore.city$type), sum)
png('plot3.png', width=480, height=480)


p <- ggplot(X1 , aes(x=year, y=Emissions, colour=type) )
p <- p + geom_point()
p <- p + geom_smooth ()
p <- p +ggtitle("Total PM2.5 Emissions in Baltimore per Type 1999-2008")
print(p)


dev.off()