library(dplyr)
library(plyr)
library(qplot)
NEI<-readRDS("Downloads/NEI/summarySCC_PM25.rds")
SCC <- readRDS("Downloads/NEI/SCC.rds")

##Set png
png(filename = "plot4.png", width = 480, height = 480)

# Get the index of combustion and coal
combindex <- grep("Combustion", SCC$SCC.Level.One)
coalindex <- grep("Coal", SCC$SCC.Level.Three)

# get where these intersect
bothindex <- intersect(combindex,coalindex)
SCCData <- SCC$SCC[bothindex]

coalCombustion<- subset(NEI,SCC %in% SCCData)

table <- ddply(coalCombustion, .(year), summarize, total = sum(Emissions))
qplot(year, total, data=table) + geom_point() + geom_smooth(method=lm) + xlab('Year') + ylab('Total Emissions') + ggtitle('PM25 Emissions from coal related combustion sources')

dev.off()