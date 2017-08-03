# Code Book 
Created 2017-08-03 whiel sourcing runAnalysis.r

## Data Source
The data for this project is from the "Human Activity Recognition Using Smartphones Data Set." The zipped data can be found at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]. More information on the data can be found in the README.md and feature_info.md. 


## Files to use in UCI HAR Dataset
#### DATA OF FEATURES
Bulk of the data for the experiment
* test/x_test.txt
* train/x_train.txt

#### SUBJECT ID  
Column of subject ids to add to data of features
* test/subject_test.txt
* train/subject_train.txt

#### ACTIVITY ID 
Column of the activity ids associated to the data features
* test/Y_test.txt
* train/Y_train.txt

#### FEATURES 
Variable names of X files
* features.txt

#### ACTIVITY LABELS
6 coded labels to correspond to the activity id
* activity_labels.txt 

## Features of the Data 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Abbreviation's of Variables
t or f at the start is based on time or frequency measurements.
Body = body movement.
Gravity = acceleration of gravity
Acc = accelerometer 
Gyro = gyroscopic 
Jerk = sudden movement 
Mag = magnitude 
mean and SD are calculated for each subject for each activity for each mean and SD measurements.

### Variables
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
