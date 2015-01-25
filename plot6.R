library(dplyr)
library(plyr)
library(qplot)
NEI<-readRDS("Downloads/NEI/summarySCC_PM25.rds")
SCC <- readRDS("Downloads/NEI/SCC.rds")

png(filename = "plot6.png", width = 480, height = 480)

# Get the index of combustion and coal
combindex <- grep("Vehicles", SCC$SCC.Level.Two)

# get where these intersect

SCCData <- SCC$SCC[combindex]

vehicles<- subset(NEI,SCC %in% SCCData & fips %in% c("24510","06037"))

table <- ddply(vehicles, .(fips, year), summarize, total = sum(Emissions))
qplot(year,total,data=table,colour=factor(fips))+geom_line()+ xlab('Year') + ylab('Total Emissions') + ggtitle('PM25 Emissions in Baltimore (Blue) vs Los Angeles (Orange)')

dev.off()
