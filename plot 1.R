NEI <- readRDS("summarySCC_PM25.rds") 
sum0 <- tapply(NEI$Emissions, NEI$year, sum) 
sum0df <- data.frame(Total.Emission = sum0, Year = names(sum0))#
plot1 <- barplot(sum0df$Total.Emission, main = "The Comparsion Between Total Emission From 1999 To 2008 Across The United States", ylab = "Total Emission", xlab = "Year", names.arg = c("1999", "2002", "2005", "2008"))
