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


#Summary function
#Retruns  min max median mean 1st Qu 3rd Qu if the column is integer type
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 0.0000  0.0000  0.0000  0.3838  1.0000  1.0000 
summary(train$Survived)

# Returns count similar to table(train$Sex)
# female   male 
# 314    577
summary(train$Sex)

#Read table data in 2D - multiple columns
# 0         1
# female  9.090909 26.150393
# male   52.525253 12.233446
prop.table(table(train$Sex,train$Survived))*100

# the proportion table command by default takes each entry in the table and divides by the total 
# number of passengers. What we want ßto see is the row-wise proportion, ie, the proportion of each 
# sex that survived, as separate groups. So we need to tell the command to give us proportions in 
# the 1st dimension which stands for the rows (using “2” instead would give you column proportions)
prop.table(table(train$Sex,train$Survived),1)
prop.table(table(train$Sex,train$Survived),2)


#create or update a colum
test <- read.csv("~/Documents/GitHub/R_/Titanic/test.csv")

#Write data to a column which satisfies a condtion
#data is written to column Survived where Sex is female
test$Survived[test$Sex == 'female'] <- 1