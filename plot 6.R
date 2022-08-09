NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
sub24510 <- unique(subset(NEI, fips == "24510", c("fips","SCC", "Emissions","type","year")))
sub06037 <- unique(subset(NEI, fips == "06037", c("fips","SCC", "Emissions","type","year")))
merge0 <- merge(sub24510, sub06037, all = TRUE)
merge.onroad <- merge0[grep("ON-ROAD", merge$type),]
merge.onroad$year <- format(merge.onroad$year, format = "%Y")
ggplot(merge.onroad, aes(x = year, y = Emissions, fill = fips)) + geom_bar(position = "dodge", stat = "identity") + scale_fill_discrete(name = "" , labels = c("Los Angeles County","Baltimore City")) + ggtitle("Emissions From Motor Vehicle Sources Changed From 1999–2008 In Baltimore City and Los Angeles County") + xlab("") + ylab("Emission From Motor Vehicle")