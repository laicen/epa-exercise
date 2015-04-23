NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot2.png")
options(scipen=10)
with(subset(NEI, fips=="24510"), barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5], 
  " emitted, in tons")), xlab="Year", main=expression(paste(PM[2.5],
  " Emission from All Sources in Baltimore City, Maryland")), ylim=c(0,3500)))
dev.off()
