U.S..Presidentss <- read.csv("C:/Users/eagle/Downloads/U.S. Presidentss.csv")

install.packages("lubridate")
library("lubridate")

U.S..Presidentss$DEATH.DATE <- as.Date(U.S..Presidentss$DEATH.DATE)
U.S..Presidentss$BIRTH.DATE <- as.Date(U.S..Presidentss$BIRTH.DATE)

U.S..Presidentss$year_of_birth <- format(U.S..Presidentss$BIRTH.DATE, format = "%Y")
U.S..Presidentss$lived_years <- time_length(difftime(U.S..Presidentss$DEATH.DATE, U.S..Presidentss$BIRTH.DATE), "years")
U.S..Presidentss$lived_months <- time_length(difftime(U.S..Presidentss$DEATH.DATE, U.S..Presidentss$BIRTH.DATE), "months")
U.S..Presidentss$lived_days <- time_length(difftime(U.S..Presidentss$DEATH.DATE, U.S..Presidentss$BIRTH.DATE), "days")

install.packages("tidyr")
library(tidyr)

Top10_President_Longestlived <- U.S..Presidentss[order(-U.S..Presidentss$lived_days),][1:10,]
Bottom10_President_Shortestlived <-U.S..Presidentss[order(U.S..Presidentss$lived_days),][1:10,]

mean(Top10_President_Longestlived$lived_days)

weighted.mean(Top10_President_Longestlived$lived_days)

median(Top10_President_Longestlived$lived_days)

mode(Top10_President_Longestlived$lived_days)

max(Top10_President_Longestlived$lived_days)

min(Top10_President_Longestlived$lived_days)

sd(Top10_President_Longestlived$lived_days, na.rm = FALSE)



mean(Bottom10_President_Shortestlived$lived_days)

weighted.mean(Bottom10_President_Shortestlived$lived_days)

median(Bottom10_President_Shortestlived$lived_days)

mode(Bottom10_President_Shortestlived$lived_days)

max(Bottom10_President_Shortestlived$lived_days)

min(Bottom10_President_Shortestlived$lived_days)

sd(Bottom10_President_Shortestlived$lived_days, na.rm = FALSE)


Top10_President_Longestlived <- U.S..Presidentss[order(-U.S..Presidentss$lived_days),][1:10,]
Bottom10_President_Shortestlived <-U.S..Presidentss[order(U.S..Presidentss$lived_days),][1:10,]

U.S_Presidents <- rbind(Top10_President_Longestlived,Bottom10_President_Shortestlived)

bplot <- boxplot(Top10_President_Longestlived$lived_days,Bottom10_President_Shortestlived$lived_days, main="President Life Span" )

Top10_President_Longestlived
Bottom10_President_Shortestlived