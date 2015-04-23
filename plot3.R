library(ggplot2) #Using ggplot2 & plyr packages
library(plyr)
NEI <- readRDS("summarySCC_PM25.rds") #Reading RDS data into R
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot3.png") #Saving plot into image data
type.NEI<-ddply(subset(NEI,fips=="24510"), .(year,type), summarize, Emissions=sum(Emissions)) #Subsetting data and getting totals
type.NEI$year <- as.character(type.NEI$year) #Changing class of year variable to character
#Plotting using qplot(ggplot2 basic), using bar graph, annotating graph, setting limits
qplot(x=year,y=Emissions, data=type.NEI, geom="bar", stat="identity", facets=.~type, 
  ylab=expression(paste("Amount of ", PM[2.5], " emitted, in tons")), 
  xlab="Year", main=expression(paste(PM[2.5]," Emission by Type of Source in Baltimore City, Maryland")),
  ylim=c(0,2500))
dev.off()
