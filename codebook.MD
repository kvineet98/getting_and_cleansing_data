Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Code files in main directory : activity_labels, features_info

Training and test files :
  /test/subject_test.txt - Subjects who performed the activity
  /test/X_test.txt  - test data set with 561 variables
  /test/y_test.txt -  Activity performed by subjects(1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
)
 
  /train/subject_test.txt - Training Subject's data set. 
  /train/X_test.txt - training data set with 562 variables
  /train/y_test.txt - Activity performed by subjects(1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
)

Variable used in program :
x_train - To strore training data set
Subject_train - Subject who performed training set.
y_train - Activites 

x_test - to store test data set
Subject_test - Subject who performed training set.
y_test - Activites 

features - load all features 

train_data  - column bind of training dataset
test_data  - column bind of test dataset

final_data - row bind of training and test datasets.
tidy_data - final outcome after cleansing. 
