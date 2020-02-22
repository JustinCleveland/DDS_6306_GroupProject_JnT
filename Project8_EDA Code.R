library(ggplot2)
library(tidyverse)
library(ggdendro) 
library(ggthemes)
library(plotly)
library(scales)
library(tidyr)
library(dplyr)
library(stringr)

#(Answers to Questions 1,3,4,5,6,7)

#2.   Merge beer data with the breweries data. 
#Import CSV file
Beer = read.csv(file.choose(),header = TRUE,na.strings=c("","NA"))
Brew = read.csv(file.choose(),header = TRUE,na.strings=c("","NA"))
head(Beer)
head(Brew)
str(Beer)
str(Brew)

#1.   How many breweries are present in each state?

#Merge data frames
merge = merge.data.frame(Brew,Beer,by.x="Brew_ID",by.y="Brewery_id")

#3.   Address the missing values in each column.
#Review data fields with NA values, only 3 fields with NA values
merge %>% filter(is.na(ABV)) %>% group_by() %>% summarise(n()) #62 NA values
merge %>% filter(is.na(IBU)) %>% group_by() %>% summarise(n()) # 1005 NA Values
merge %>% filter(is.na(Style)) %>% group_by() %>% summarise(n()) #5 NA Values

