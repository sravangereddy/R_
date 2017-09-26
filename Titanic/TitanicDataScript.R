#Set working directory
setwd("~/Documents/R/Titanic")

#read tarining data set train.csv
library(readr)
train <- read_csv("~/Documents/R/Titanic/train.csv")
View(train)

#read test dataset test.csv
library(readr)
test <- read_csv("~/Documents/R/Titanic/test.csv")
View(test)


#By default all strings are considered factors. To avoid this
library(readr)
train_strAsFac_fls <- read.csv("train.csv", stringsAsFactors=FALSE)
View(train_strAsFac_fls)

#Describe the varibles in the set
str(train)
str(test)
str(train_strAsFac_fls)

#read a column  - train vector $ column name
train$Survived

#read data as a table - table just counts each occurance and displays
table(train$Survived)

#to find the proportions, use prop.table and pass table as parameter. 
#It displays by default in fractions. *100 gives %
prop.table(table(train$Survived))*100

#adding a new column to a dataset
test$Survived <- rep(0,418)

#create a data frame
test_data_frame <- data.frame(Passenegre_Id = test$PassengerId, Survived = test$Survived)
View(test_data_frame)

#Write data to a csv file
write.csv(test_data_frame,file = "testDdataFile.csv", row.names = FALSE)
test_dat_reader <- read_csv("~/Documents/R/Titanic/testDdataFile.csv")
View(test_dat_reader)

#Write data to a csv file 
write.csv(test_data_frame,file = "testDdataFile_withhead.csv")
test_dat_reader_header <- read_csv("~/Documents/R/Titanic/testDdataFile_withhead.csv")
View(test_dat_reader)


write.csv(test_data_frame,file = "testDdataFile_withrownames.csv", row.names = TRUE)
test_dat_reader_header <- read_csv("~/Documents/R/Titanic/testDdataFile_withrownames.csv")
