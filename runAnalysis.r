###############################################################################

## Coursera Getting and Cleaning Data Course Project Week 4
##run Analysis.r 

# Set working directory to the unzipped UCI HAR Dataset 
setwd("/UCI HAR Dataset")

# Load the plyr package
library(plyr)

#1. Merge the training data and the test sets to create one data set.

# Read each file for X, Y, and Subject of both Test and Train.
fx<-file.path(getwd(), "train/X_train.txt")
x_train<-read.table(fx, header = FALSE)
fx2<-file.path(getwd(), "/test/X_test.txt")
x_test<-read.table(fx2, header = FALSE)

fy<-file.path(getwd(), "/train/Y_train.txt")
y_train<-read.table(fy, header = FALSE)
fy2<-file.path(getwd(), "/test/Y_test.txt")
y_test<-read.table(fy2, header = FALSE)

fs<-file.path(getwd(), "/train/subject_train.txt")
sub_train<-read.table(fs, header = FALSE)
fs2<-file.path(getwd(), "/test/subject_test.txt")
sub_test<-read.table(fs2, header = FALSE)

# Read the features data set to get the variable names for X.
ff<-file.path(getwd(), "/features.txt")
features<-read.table(ff, header = FALSE)

# Label the columns of each data set loaded above.
colnames(y_train)<-"activityId"#labeling the 
colnames(y_test)<-"activityId"
colnames(sub_train)<-"subjectId"
colnames(sub_test)<-"subjectId"
colnames(x_test)<-features[,2]
colnames(x_train)<-features[,2]

# Combine y, x, and sub train data into one data set.
train_data<-cbind(y_train, sub_train, x_train)

# Combine y, x, and sub test data into one data set.
test_data<-cbind(y_test, sub_test, x_test)

# Combine the test and train data sets.
all_data<-rbind(train_data, test_data)



# 2. Extract only the measurements on the mean and standard deviation 
# for each measurement.

# Set the column names for future use pulling the mean data 
colNames<-colnames(all_data)
# Create vector for defining what is the ID, mean and standard deviation
vec_mean_std<-(grepl("activityId", colNames) | grepl("subjectId", colNames) 
               | grepl("mean..", colNames) | grepl("std..", colNames) )
# Pull from the full data set the columns where the vector of ID, mean, 
# and std are true
all_mean_std<-all_data[, vec_mean_std ==TRUE]


# 3.Uses descriptive activity names to name the activities in the data set.

# Create a file path and read the activities_labels file. 
fal<-file.path(getwd(), "/activity_labels.txt")
activity_labels<-read.table(fal, header = FALSE)

# Change the colnames of the first column in Activity_Labal to match activityId
colnames(activity_labels)<-c("activityId", "activity")
# Merge the activity labels with the data set to add activity names
DataWithActivityLabels<-merge(all_mean_std, activity_labels, 
                              by ='activityId', all.x = TRUE)

# 4. Appropriately labels the data set with descriptive variable names. 

# Change the t and f at the start of each varible to time 
# and frequency respectively.
names(DataWithActivityLabels)<- 
  gsub("^t", "time", names(DataWithActivityLabels))
names(DataWithActivityLabels)<- 
  gsub("^f", "frequency", names(DataWithActivityLabels))

# Remove the paraenthesis and the repeat of Body.
names(DataWithActivityLabels)<- 
  gsub("\\()", "", names(DataWithActivityLabels))
names(DataWithActivityLabels)<- 
  gsub("BodyBody", "Body", names(DataWithActivityLabels))

# Use the full label Magnitude instead of Mag. 
names(DataWithActivityLabels)<- 
  gsub("Mag", "Magnitude", names(DataWithActivityLabels))

# Remove the column activityId and move the activity column to the second column.
DataWithActivityLabels<-DataWithActivityLabels[,-1]
DataWithActivityLabels<- DataWithActivityLabels[, c(1, 81, 2:80)]

# 5. Create a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

# Split the data by subjectId and activity and find all the other columns' mean. 
tidy_data<-ddply(DataWithActivityLabels, .(subjectId, activity), 
                 function(x) colMeans(x[, 3:81]))

# Write the tidy data to a text file.
write.table(tidy_data, "tidy_data.txt", sep = "/t", row.name = FALSE)

###############################################################################