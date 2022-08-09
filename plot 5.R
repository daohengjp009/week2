NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
onroad <- SCC[grep("Onroad",SCC$Data.Category),]
sub24510.SCC <- unique(subset(NEI, fips == "24510", c("SCC", "Emissions", "type","year")))
merge.24510 <- merge(sub24510.SCC, onroad)
merge.24510$year <- format(merge.24510$year, format = "%Y")
ggplot(merge.24510, aes(x=year, y=Emissions, fill= Data.Category)) + geom_bar(position = "stack", stat = "identity") + ggtitle("Emissions From Motor Vehicle Sources Changed From 1999–2008 In Baltimore City") + xlab("") + ylab("Emission From Motor Vehicle")