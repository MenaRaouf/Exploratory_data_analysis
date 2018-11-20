NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

X1 <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)
png('plot1.png', width=480, height=480)

plot(X1$year , log10(X1$Emissions) , xlab = "Year" , ylab = "Emissions")


dev.off()