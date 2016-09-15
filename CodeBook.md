##Activity Identifiers

The following activities were performed by the 30 volunteers. 

1. Walking (WALKING)
2. Walking upstairs (WALKING_UPSTAIRS)
3. Walking downstairs (WALKING_DOWNSTAIRS)
4. Sitting (SITTING)
5. Standing (STANDING)
6. Laying (LAYING)

Columns activityId and activityType of the tidydata txt file contain the number and type, corresponding to the activity being performed by the volunteer.
The activityID for each measurement was extracted from y_train.txt and y_test.txt, 

The column subjectId contains the ID of the volunteer (ranging from 1 to 30) for each measurement. 


##Measurements

The mean and standard deviation for each type of measurement were extracted, and the following measurements were present in the tidydata text file. 
Each measurement's mean and SD was reported for all the activities of each volunteer. 

timeBodyAccMagnitudeMean,
timeBodyAccMagnitudeStdDev,
timeGravityAccMagnitudeMean,
timeGravityAccMagnitudeStdDev,
timeBodyAccJerkMagnitudeMean,
timeBodyAccJerkMagnitudeStdDev,
timeBodyGyroMagnitudeMean,
timeBodyGyroMagnitudeStdDev,
timeBodyGyroJerkMagnitudeMean,
timeBodyGyroJerkMagnitudeStdDev,
freqBodyAccMagnitudeMean,
freqBodyAccMagnitudeStdDev,
freqBodyBodyAccJerkMagnitudeMean,
freqBodyBodyAccJerkMagnitudeStdDev,
freqBodyBodyGyroMagnitudeMean,
freqBodyBodyGyroMagnitudeStdDev,
freqBodyBodyGyroJerkMagnitudeMean,
freqBodyBodyGyroJerkMagnitudeStdDev

The data frame tidyData contains the final merged tidy data set and is written to the text file tidyData.txt.
