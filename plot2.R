library(dplyr)
library(plyr)
NEI<-readRDS("Downloads/NEI/summarySCC_PM25.rds")
SCC <- readRDS("Downloads/NEI/SCC.rds")

##Set png
png(filename = "plot2.png", width = 480, height = 480)

baltimore<-subset(NEI,fips=="24510")
table<- ddply(baltimore, "year", summarise, total = sum(Emissions))
plot(table$year,table$total,
     xlab = "year",
     ylab="Total Emissions")
title(main='PM25 Emissions in Baltimore')
abline(lm(table$total ~ table$year))
dev.off()