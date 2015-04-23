NEI <- readRDS("summarySCC_PM25.rds") #Reading RDS data in R
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot2.png") #Saving image file
options(scipen=10) #Increasing allocation for number digits
#Using basic plotting with barplot, subsetting data, annotating graph, setting limit
with(subset(NEI, fips=="24510"), barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5], 
  " emitted, in tons")), xlab="Year", main=expression(paste(PM[2.5],
  " Emission from All Sources in Baltimore City, Maryland")), ylim=c(0,3500)))
dev.off()
