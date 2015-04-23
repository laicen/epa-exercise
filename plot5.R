NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
png(file="plot5.png")
options(scipen=10)
motor.SCC <- SCC[SCC$Data.Category == "Onroad" , ]
motor.NEI <- NEI[NEI$SCC %in% motor.SCC$SCC , ]
with(subset(motor.NEI, fips=="24510"), barplot(tapply(Emissions,year,sum), col="red", ylab=expression(paste("Amount of ", PM[2.5],
  " emitted, in tons")), xlab="Year", main=expression(paste(PM[2.5],
  " Emission from Motor Vehicle Sources in Baltimore City, Maryland")), ylim=c(0,400)))
dev.off()
