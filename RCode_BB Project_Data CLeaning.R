data1 <- read.csv("C:/Users/trish/Downloads/Chicago_Crimes_2012_to_2017upd.csv", header = T)
#splitting date into date and time
Hours <- format(as.POSIXct(strptime(data1$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%H:%M")
Dates <- format(as.POSIXct(strptime(data1$Date,"%m/%d/%Y %H:%M",tz="")) ,format = "%m/%d/%Y")
data1$Date <- Dates
data1$Hour <- Hours
#converting date from character type to date type
data1$Date <- as.Date(data1$Date,"%m/%d/%Y")
class(data1$Date)
#sorting by date
sorteddata1 <- data1[order(as.Date(data1$Date, format="%m/%d/%Y")),]
View(sorteddata1)
#removing NAs
cleaneddata1 <- na.omit(sorteddata1)
View(cleaneddata1)
#writing in CSV
write.csv(cleaneddata1, file = "C:/Users/trish/Downloads/Clean.csv")
L <- read.csv("C:/Users/trish/Downloads/Clean.csv")
length(cleaneddata1)
View(F)




