library(ggplot2)
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot4.png")
unique(SCC$EI.Sector)
coal.SCC <- SCC[SCC$EI.Sector %in% c("Fuel Comb - Electric Generation - Coal",
  "Fuel Comb - Industrial Boilers, ICEs - Coal", "Fuel Comb - Comm/Institutional - Coal"), ]
coal <- NEI[NEI$SCC %in% coal.SCC$SCC , ]
with(coal, barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")),
  xlab="Year", main=expression(paste(PM[2.5]," Emission from Coal Combustion Related Sources in the US")),
  ylim=c(0,600000)))
dev.off()
