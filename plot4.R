library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot4.png")
unique(SCC$EI.Sector)
coal.SCC <- SCC[SCC$EI.Sector %in% c("Fuel Comb - Electric Generation - Coal",
  "Fuel Comb - Industrial Boilers, ICEs - Coal", "Fuel Comb - Comm/Institutional - Coal"), ]
coal <- NEI[NEI$SCC %in% coal.SCC$SCC , ]
barplot(
qplot(x=year,y=Emissions, data=type.NEI, geom="bar", stat="identity", facets=.~type, 
  ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")), 
  xlab="Year", main=expression(paste("Total ",PM[2.5]," Emission by Type of Source in Baltimore City, Maryland")),
  ylim=c(0,2500))
dev.off()
