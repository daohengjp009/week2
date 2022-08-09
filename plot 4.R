NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")
subcoal <- SCC[grep("Coal",SCC$EI.Sector),]
coal.code <- SCC$SCC
merge.coal <- merge(NEI, subcoal, sort = coal.code)
merge.coal$year <- format(merge.coal$year, format = "%Y")
ggplot(merge.coal, aes(x=year, y=Emissions, fill= EI.Sector)) + geom_bar(position = "stack", stat = "identity") + ggtitle("Emissions From Coal Combustion-Related Sources Changed From 1999–2008") + xlab("") + ylab("Total Emission")