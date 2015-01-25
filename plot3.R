library(dplyr)
library(plyr)
library(qplot)
NEI<-readRDS("Downloads/NEI/summarySCC_PM25.rds")
SCC <- readRDS("Downloads/NEI/SCC.rds")

##Set png
png(filename = "plot3.png", width = 480, height = 480)

baltimore<-subset(NEI,fips=="24510")
table <- ddply(baltimore, .(type, year), summarize, total = sum(Emissions))
qplot(year,total,data=table,colour=factor(type))+geom_line()+ xlab('Year') + ylab('Total Emissions') + ggtitle('PM25 Emissions in Baltimore City by type')

dev.off()