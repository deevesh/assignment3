# Reading the data files
features     = read.table('./features.txt',header=FALSE); 
activityType = read.table('./activity_labels.txt',header=FALSE); 
subjectTrain = read.table('./train/subject_train.txt',header=FALSE); 
xTrain       = read.table('./train/x_train.txt',header=FALSE); 
yTrain       = read.table('./train/y_train.txt',header=FALSE); 

# Assigning column names 
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

#creating the final training data set
trainingData = cbind(yTrain,subjectTrain,xTrain);

# Reading the test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE); 
xTest       = read.table('./test/x_test.txt',header=FALSE); 
yTest       = read.table('./test/y_test.txt',header=FALSE); 

# Assigning column names 
colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";


# Creating the final test set
testData = cbind(yTest,subjectTest,xTest);


# Creating a final data set by combining training and test data 
finalData = rbind(trainingData,testData);

# Creating a vector for the column names from the final Data set
# This vector will be used to select the required mean() & stddev() columns
colNames  = colnames(finalData); 


# Creating a logicalVector that contains TRUE values for the ID, mean() & stddev() columns
logicalVector = (grepl("subject..",colNames) | grepl("activity..",colNames) | grepl("-mean..",colNames) & !grepl("mean..-",colNames) & !grepl("-meanFreq..",colNames) | !grepl("-std()..-",colNames) & grepl("-std..",colNames));

# Keeping only the desired columns based in the logicalVector
finalData = finalData[logicalVector==TRUE];

# Including the descriptive activity names by merging the finalData set with ActivityType 
finalData = merge(finalData,activityType,by='activityId',all.x=TRUE);

# Updating the colNames vector 
colNames  = colnames(finalData); 

# Changing the the variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# New descriptive column names to the finalData set
colnames(finalData) = colNames;

# Creating a new table without the activityType column
finalDataNoActivityType  = finalData[,names(finalData) != 'activityType'];

# Summarizing the finalDataNoActivityType table to include just the mean of each variable for each activity and each subject
tidyData    = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean);

# Merging the tidyData set with activityType to include descriptive activity names
tidyData    = merge(tidyData,activityType,by='activityId',all.x=TRUE);

# writing the cleaned data set to a text file
write.table(tidyData, './tidyData.txt',row.names=FALSE,sep='\t')
