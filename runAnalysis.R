# clear all environment variablesa and load plyr for #5
rm(list=ls())
library(plyr)


#Set Working directory to unzipped downloaded file location
setwd('c://datascience//UCI HAR Dataset//')


#1 Merge the training and test set 


#read Training dataset from training directory 
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")


#read Test dataset from training directory 
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")


# Read the code values from features assign column names to above datasets
features<- read.table("features.txt")


colnames(x_train)=features[,2]
colnames(y_train)="activityId"
colnames(subject_train)="subject"

# combine all training data columns 
train_data =cbind(x_train,y_train,subject_train)

colnames(x_test)=features[,2]
colnames(y_test)="activityId"
colnames(subject_test)="subject"

# combine all test data columns
test_data =cbind(x_test,y_test,subject_test)

#combine test and traing dataset

final_data =rbind(train_data, test_data)

# 1 end here


#2 Extract Only the measurements on the mean and Standard Deviation and 
final_columns=colnames(final_data)

#filter_measurements <- grep("activityId|subject|-mean\\(\\)|-std\\(\\)",features[,2])

filter_measurements <- grep("activityId|subject|-mean\\(\\)|-std\\(\\)",final_columns)

final_data=final_data[filter_measurements]

# 2 end here

#3 Use descriptive activity names to name the activities in the data set
activity <- read.table("activity_labels.txt")
colnames(activity) =c("activityId","activity_desc")
final_data=merge(final_data,activity,activity,by.x='activityId',by.y="activityId",all.x=TRUE)


#4 Appropriately lables the data set with Descriptive Name

#get the origianl column and get rid of () 
final_data_colnames<-colnames(final_data)
final_data_colnames= gsub("\\()","",final_data_colnames)
colnames(final_data)=final_data_colnames


#5 Create a second, independent tidy set with average of each variable for each activity and each subject 
# using write.table with rown.names=FALSE


tidy_data<-ddply(final_data,.(subject,activityId),function (x) colMeans(x[,1:67]))
write.table(tidy_data,"tidy_data.txt",row.names=FALSE )






