#Code Book

Code book to describe the variables, data, and transformations that were performed for 

Programming Assignment 3 for Getting and Cleaning Data Course Project

The data set is located here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description is located here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Steps
The script run_analysis.R performs several steps that were outlined in the assignment.

1) Merge the training and the test sets to create one data set.

Load the X_test.txt data into R

Load the X_train.txt data into R

Load the y_test.txt data into R

Load the y_train.txt data into R

Combine the training and the test sets to create one data set.

2) Extract only the measurements on the mean and standard deviation for each measurement.

Use the file called features to find the needed variables

read in the features.txt file into R

find the variables we need for the anlaysis by using the grep function

3) Uses descriptive activity names to name the activities in the data set.

read in the activity labels from activity_labels.txt

merge your dataset with the activity label

after merging, I reordered the columns so that all X data was in the begining, then y data and labels

4) Appropriately label the data set with descriptive variable names

Load the subject_test.txt data into R

Load the subject_train.txt data into R

combine both files by stacking

Now we have  1) complete and 2) subfull - combine them using cbind

take only the subset of variables to use for the analysis by using colstouse from above

varstouse - are the labels for the means and sdevs

colstouse - are the columns containing the means and sdevs

activity is in y, V2.y at the end of the file

subject is named subject at the end of the file

Now apply the new descriptive names to the data

5) From the data set in Step4, this script creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Use the aggregate function to run the mean on each variable while splitting it by activity, and ID

##Variables
*tBodyAcc_mean_X: Time  BodyAcc mean X Axis
*tBodyAcc_mean_Y: Time  BodyAcc mean Y Axis
*tBodyAcc_mean_Z: Time  BodyAcc mean Z Axis
*tBodyAcc_std_X: Time  BodyAcc std X Axis
*tBodyAcc_std_Y: Time  BodyAcc std Y Axis
*tBodyAcc_std_Z: Time  BodyAcc std Z Axis
*tGravityAcc_mean_X: Time  GravityAcc mean X Axis
*tGravityAcc_mean_Y: Time  GravityAcc mean Y Axis
*tGravityAcc_mean_Z: Time  GravityAcc mean Z Axis
*tGravityAcc_std_X: Time  GravityAcc std X Axis
*tGravityAcc_std_Y: Time  GravityAcc std Y Axis
*tGravityAcc_std_Z: Time  GravityAcc std Z Axis
*tBodyAccJerk_mean_X: Time  BodyAccJerk mean X Axis
*tBodyAccJerk_mean_Y: Time  BodyAccJerk mean Y Axis
*tBodyAccJerk_mean_Z: Time  BodyAccJerk mean Z Axis
*tBodyAccJerk_std_X: Time  BodyAccJerk std X Axis
*tBodyAccJerk_std_Y: Time  BodyAccJerk std Y Axis
*tBodyAccJerk_std_Z: Time  BodyAccJerk std Z Axis
*tBodyGyro_mean_X: Time  BodyGyro mean X Axis
*tBodyGyro_mean_Y: Time  BodyGyro mean Y Axis
*tBodyGyro_mean_Z: Time  BodyGyro mean Z Axis
*tBodyGyro_std_X: Time  BodyGyro std X Axis
*tBodyGyro_std_Y: Time  BodyGyro std Y Axis
*tBodyGyro_std_Z: Time  BodyGyro std Z Axis
*tBodyGyroJerk_mean_X: Time  BodyGyroJerk mean X Axis
*tBodyGyroJerk_mean_Y: Time  BodyGyroJerk mean Y Axis
*tBodyGyroJerk_mean_Z: Time  BodyGyroJerk mean Z Axis
*tBodyGyroJerk_std_X: Time  BodyGyroJerk std X Axis
*tBodyGyroJerk_std_Y: Time  BodyGyroJerk std Y Axis
*tBodyGyroJerk_std_Z: Time  BodyGyroJerk std Z Axis
*tBodyAccMag_mean: Time  BodyAccMag mean
*tBodyAccMag_std: Time  BodyAccMag std
*tGravityAccMag_mean: Time  GravityAccMag mean
*tGravityAccMag_std: Time  GravityAccMag std
*tBodyAccJerkMag_mean: Time  BodyAccJerkMag mean
*tBodyAccJerkMag_std: Time  BodyAccJerkMag std
*tBodyGyroMag_mean: Time  BodyGyroMag mean
*tBodyGyroMag_std: Time  BodyGyroMag std
*tBodyGyroJerkMag_mean: Time  BodyGyroJerkMag mean
*tBodyGyroJerkMag_std: Time  BodyGyroJerkMag std
*fBodyAcc_mean_X: Frequency  BodyAcc mean X Axis
*fBodyAcc_mean_Y: Frequency  BodyAcc mean Y Axis
*fBodyAcc_mean_Z: Frequency  BodyAcc mean Z Axis
*fBodyAcc_std_X: Frequency  BodyAcc std X Axis
*fBodyAcc_std_Y: Frequency  BodyAcc std Y Axis
*fBodyAcc_std_Z: Frequency  BodyAcc std Z Axis
*fBodyAccJerk_mean_X: Frequency  BodyAccJerk mean X Axis
*fBodyAccJerk_mean_Y: Frequency  BodyAccJerk mean Y Axis
*fBodyAccJerk_mean_Z: Frequency  BodyAccJerk mean Z Axis
*fBodyAccJerk_std_X: Frequency  BodyAccJerk std X Axis
*fBodyAccJerk_std_Y: Frequency  BodyAccJerk std Y Axis
*fBodyAccJerk_std_Z: Frequency  BodyAccJerk std Z Axis
*fBodyGyro_mean_X: Frequency  BodyGyro mean X Axis
*fBodyGyro_mean_Y: Frequency  BodyGyro mean Y Axis
*fBodyGyro_mean_Z: Frequency  BodyGyro mean Z Axis
*fBodyGyro_std_X: Frequency  BodyGyro std X Axis
*fBodyGyro_std_Y: Frequency  BodyGyro std Y Axis
*fBodyGyro_std_Z: Frequency  BodyGyro std Z Axis
*fBodyAccMag_mean: Frequency  BodyAccMag mean
*fBodyAccMag_std: Frequency  BodyAccMag std
*fBodyBodyAccJerkMag_mean: Frequency  BodyBodyAccJerkMag mean
*fBodyBodyAccJerkMag_std: Frequency  BodyBodyAccJerkMag std
*fBodyBodyGyroMag_mean: Frequency  BodyBodyGyroMag mean
*fBodyBodyGyroMag_std: Frequency  BodyBodyGyroMag std
*fBodyBodyGyroJerkMag_mean: Frequency  BodyBodyGyroJerkMag mean
*fBodyBodyGyroJerkMag_std: Frequency  BodyBodyGyroJerkMag std
*ActLab : label of the activity that each participant/ subject was doing at the time of the measurement
*ID: 1 to 30 each representing a participant in the study


