library(dplyr)
library(plyr)
library(qplot)
NEI<-readRDS("Downloads/NEI/summarySCC_PM25.rds")
SCC <- readRDS("Downloads/NEI/SCC.rds")

png(filename = "plot5.png", width = 480, height = 480)

# Get the index of combustion and coal
combindex <- grep("Vehicles", SCC$SCC.Level.Two)

# get where these intersect

SCCData <- SCC$SCC[combindex]

vehicles<- subset(NEI,SCC %in% SCCData & fips=="24510")

table <- ddply(vehicles, .(year), summarize, total = sum(Emissions))
qplot(year, total, data=table) + geom_point() + geom_smooth(method=lm) + xlab('Year') + ylab('Total Emissions') + ggtitle('PM25 Emissions from vehicles in Baltimore')

dev.off()