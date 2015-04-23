library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot6.png")
type.NEI<-ddply(subset(NEI,fips=="24510"), .(year,type), summarize, Emissions=sum(Emissions))
qplot(x=year,y=Emissions, data=type.NEI, geom="bar", stat="identity", facets=.~type, 
  ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")), 
  xlab="Year", main=expression(paste(PM[2.5]," Emission by Type of Source in Baltimore City, Maryland")),
  ylim=c(0,2500))
dev.off()
