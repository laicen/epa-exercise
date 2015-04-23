library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot6.png")
motor.SCC <- SCC[SCC$Data.Category == "Onroad" , ]
motor.NEI <- NEI[NEI$SCC %in% motor.SCC$SCC , ]
compare.NEI<-ddply(subset(NEI,fips == "24510" | fips == "06037"), .(year,fips), summarize, Emissions=sum(Emissions))
qplot(x=year,y=Emissions, data=compare.NEI, geom="bar", stat="identity", facets=.~fips, 
  ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")), 
  xlab="Year", main=expression(paste(PM[2.5]," Emission from Motor Vehicle Sources in Baltimore City, Maryland 
  & Los Angeles, California")),
  ylim=c(0,2500))
dev.off()
