## Assignment - Getting and Cleaning Data

Deevesh Prayag

## Overview

The script created (run_analysis.r) does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## How the script works

It is assumed that you set the location of the source files as the working directory.

### 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

Assign column names and merge to create one data set.

### 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logcal vector that contains TRUE values for the ID, mean and stdev columns and FALSE values for the others.
Subset this data to keep only the necessary columns.

### 3. Use descriptive activity names to name the activities in the data set
Merge data subset with the activityType table to cinlude the descriptive activity names

### 4. Appropriately label the data set with descriptive activity names.
Use gsub function for pattern replacement to clean up the data labels.

### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
Script to produce only a data set with the average of each veriable for each activity and subject. Write this data set to a text file as requested.