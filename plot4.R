library(ggplot2) #Installing ggplot2 & plyr packages
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds") #Reading RDS data in R
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot4.png") #Saving image file
unique(SCC$EI.Sector) #Searching for unique values to be used for subsetting data
#Subsetting SCC data with Coal Combustion Related Sources
coal.SCC <- SCC[SCC$EI.Sector %in% c("Fuel Comb - Electric Generation - Coal",
  "Fuel Comb - Industrial Boilers, ICEs - Coal", "Fuel Comb - Comm/Institutional - Coal"), ]
coal <- NEI[NEI$SCC %in% coal.SCC$SCC , ] #Subsetting NEI data with Coal Combustion Related Sources
#Basic plotting using barplot, annotating graph, setting limit
with(coal, barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")),
  xlab="Year", main=expression(paste(PM[2.5]," Emission from Coal Combustion Related Sources in the US")),
  ylim=c(0,600000)))
dev.off()
