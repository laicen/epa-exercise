NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot1.png")
options(scipen=10)
with(NEI, barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")),
  xlab="Year", main=expression(paste("Total ",PM[2.5]," Emission from All Sources in US")), ylim=c(0,8000000)))
dev.off()
