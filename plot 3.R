NEI <- readRDS("summarySCC_PM25.rds") 
sub24510 <- unique(subset(NEI, fips == 24510, c("Emissions", "type", "year")))
sub24510$year <- format(sub24510$year, format = "%Y")
ggplot(sub24510, aes(x=year, y=Emissions, fill= type)) + geom_bar(position = "stack", stat = "identity") +  ggtitle("The Comparsion Between Total Emission Of Type From 1999 To 2008 in Baltimore City") + xlab("") + ylab("Total Emission")