trialdata1 <- read.csv("/Users/sgunuganti/Documents/SEM2/Data Mining/Cleani3.csv")

#Removing the Index and Date coulumn 
trialdata1$X <- NULL
trialdata1$Date <- NULL

#Verifying class 
class(trialdata1$hours)
class(trialdata1$Arrest)
class(trialdata1$Domestic)
summary(trialdata1$Domestic)

#Coonverting data type to factors
trialdata1$Domestic <- as.factor(trialdata1$Domestic)
trialdata1$Arrest <- as.factor(trialdata1$Arrest)

#Preprocessing before grouping hours 
class(trialdata1$Hour)
trialdata1$Hour <- as.character(trialdata1$Hour)

z <- sapply(strsplit(trialdata1$Hour,":"),
       function(x) {
         x <- as.numeric(x)
         x[1]+x[2]/60
       }
)

#Grouping hours of a day into morning, afternoon & night 
hours <- as.numeric(z)
hours[hours >= 4 & hours < 12] <- "morning"
hours[hours >= 12 & hours < 20] <- "afternoon"
hours[hours >= 20 & hours < 24] <- "night"
hours[hours >= 0 & hours < 4] <- "night"

trialdata2 <- cbind(trialdata1,hours) 
View(trialdata2)
trialdata2$Hour <- NULL

#Retaining only the first word in tha location Description column to reduce the number of levels
trialdata2$Location.Description <- as.character(trialdata2$Location.Description)
trialdata2$Loc.Description <- sub("([A-Za-z]+).*", "\\1", trialdata2$Location.Description)
trialdata2$Loc.Description <- as.factor(trialdata2$Loc.Description)
levels(trialdata2$Loc.Description)
trialdata2$Location.Description <- NULL

#Grouping some of the levels of Primary.Type to reduce the number of factor levels
class(trialdata1$Primary.Type)
trialdata2$Primary.Type[trialdata2$Primary.Type == "CRIM SEXUAL ASSAULT"] <- "SEX OFFENSE"
trialdata2$Primary.Type[trialdata2$Primary.Type == "PROSTITUTION"] <- "SEX OFFENSE"
trialdata2$Primary.Type[trialdata2$Primary.Type == "NON-CRIMINAL"] <- "DECEPTIVE PRACTICE"
trialdata2$Primary.Type[trialdata2$Primary.Type == "OTHER OFFENSE"] <- "DECEPTIVE PRACTICE"
trialdata2$Primary.Type[trialdata2$Primary.Type == "ROBBERY"] <- "THEFT"
trialdata2$Primary.Type[trialdata2$Primary.Type == "OTHER NARCOTIC VIOLATION"] <- "NARCOTICS"
trialdata2$Primary.Type[trialdata2$Primary.Type == "MOTOR VEHICLE THEFT"] <- "THEFT"
trialdata2$Primary.Type[trialdata2$Primary.Type == "BURGLARY"] <- "THEFT"
trialdata2$Primary.Type[trialdata2$Primary.Type == "STALKING"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "OBSCENITY"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "PUBLIC INDECENCY"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "INTERFERENCE WITH PUBLIC OFFICER"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "WEAPONS VIOLATION"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "LIQUOR LAW VIOLATION"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "HUMAN TRAFFICKING"] <- "KIDNAPPING"
trialdata2$Primary.Type[trialdata2$Primary.Type == "INTIMIDATION"] <- "GAMBLING"
trialdata2$Primary.Type[trialdata2$Primary.Type == "NON-CRIMINAL (SUBJECT SPECIFIED)"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "NON - CRIMINAL"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "CONCEALED CARRY LICENSE VIOLATION"] <- "PUBLIC PEACE VIOLATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "STALKING"] <- "INTIMIDATION"
trialdata2$Primary.Type[trialdata2$Primary.Type == "CRIMINAL TRESPASS"] <- "CRIMINAL DAMAGE"


levels(trialdata2$Primary.Type)
summary(trialdata2$Primary.Type)
class(trialdata2$Primary.Type)
levels(trialdata2$Primary.Type) <- c("ARSON","ASSAULT","BATTERY","BURGLARY","OTHER", "OTHER","CRIMINAL DAMAGE","OTHER","DECEPTIVE PRACTICE","GAMBLING","HOMICIDE","OTHER","OTHER","INTIMIDATION","KIDNAPPING","OTHER","OTHER","NARCOTICS","OTHER","OTHER","OTHER", "OTHER","OFFENSE INVOLVING CHILDREN","OTHER","OTHER","OTHER","OTHER","OTHER","OTHER","SEX OFFENSE","OTHER","THEFT","OTHER")                


#Removing unnecessary columns 
trialdata2$IUCR <- NULL
trialdata2$Beat <- NULL
trialdata2$Description <-NULL
trialdata2$Ward <- NULL
trialdata2$FBI.Code <- NULL
trialdata2$Community.Area <- NULL
trialdata2$Beat <- NULL
trialdata2$Block <- NULL


