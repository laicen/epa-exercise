library(ggplot2) #Using ggplot2 & plyr packages
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds") #Reading RDS data in R
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot6.png") #Saving image
motor.SCC <- SCC[SCC$Data.Category == "Onroad" , ] #Subsetting SCC data with Onroad Data Category
motor.NEI <- NEI[NEI$SCC %in% motor.SCC$SCC , ] #Subsetting NEI data with Onroad Data Category
#Subsetting NEI data to get emissions coming from Baltimore City & LA County, getting totals
compare.NEI<-ddply(subset(motor.NEI,fips == "24510" | fips == "06037"), .(year,fips), summarize, Emissions=sum(Emissions))
compare.NEI$year <- as.character(compare.NEI$year) #Changing year variable to character class
compare.NEI #Printing the data to determine values to be used for limits
compare.NEI$fips <- c("06037" = "Los Angeles County, California", "24510" = "Baltimore City, Maryland") #Renaming fips
#Using qplot to graph bar chart, annotating graph, setting limit
qplot(x=year,y=Emissions, data=compare.NEI, geom="bar", stat="identity", facets=.~fips, 
  ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")), 
  xlab="Year", main=expression(paste(PM[2.5]," Emission from Motor Vehicle Sources")), ylim=c(0,5000))
dev.off()
