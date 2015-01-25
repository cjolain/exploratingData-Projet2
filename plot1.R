library(dplyr)
library(plyr)
NEI<-readRDS("Downloads/NEI/summarySCC_PM25.rds")
SCC <- readRDS("Downloads/NEI/SCC.rds")

##Set png
png(filename = "plot1.png", width = 480, height = 480)

## summarize data
table<- ddply(NEI, "year", summarise, total = sum(Emissions))
plot(table$year,table$total,
     xlab = "year",
     ylab="Total")
title(main='PM25 Emissions')
abline(lm(table$total ~ table$year))
dev.off()