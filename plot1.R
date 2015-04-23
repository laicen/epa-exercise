NEI <- readRDS("summarySCC_PM25.rds") #Reading RDS data in R
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot1.png") #Saving plot into image data
options(scipen=10) #Increasing allocation for number digits
#Basic plotting using barplot, annotating graph, setting limits
with(NEI, barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")),
  xlab="Year", main=expression(paste(PM[2.5]," Emission from All Sources in the US")), ylim=c(0,8000000)))
dev.off()
