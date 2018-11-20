library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


coalSource <- SCC[grepl("[Cc]oal", SCC$Short.Name),]

coalNEI <- subset(NEI, NEI$SCC %in% coalSource$SCC)

X1 <- aggregate(coalNEI[c("Emissions")], list(year = coalNEI$year), sum)

png('plot4.png', width=480, height=480)


p <- ggplot(X1 , aes(x=year, y=Emissions) )
p <- p + geom_point()
p <- p + geom_smooth ()
p <- p +ggtitle("Total PM2.5 Emissions in Baltimore per Type 1999-2008")
print(p)

dev.off()
