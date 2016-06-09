# Code Book for Getting and Cleaning Data Course Project Assignment 

Overview
This is code books for the Run Analysis script. 
The file explain the tidy data that were cleaned and prepared by this script. 

Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full Description at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Script Process
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Files Contents
The script generate two data tables in two separate files:
1) meregeddata.txt is a 10299x68 data frame
This file contain the mean and std data for each subject and each activity and each label.
- The first column contains subject ID range from 1 to 30.
- The second column contains activity names.
- The last 66 columns are measurements.

2) meandata.txt is a 180x68 data frame.
This file contain the averaged data for the mean and std for each activity. The average was performed over the number of subjects.
- The first column contains subject ID range from 1 to 30.
- The second column contains activity names.
- The last 66 columns are measurements.

##Names and labels

1) There are 30 subjects located in the first column.

2) There are six activity located in the 2nd column.
walking
walkingupstairs
walkingdownstairs
sitting
standing
laying           

3) Descriptive activities: located in the between the third column and the 68th column in the first row.
"tbodyacc-mean-x"           "tbodyacc-mean-y"           "tbodyacc-mean-z"           "tbodyacc-std-x"            "tbodyacc-std-y"           
"tbodyacc-std-z"            "tgravityacc-mean-x"        "tgravityacc-mean-y"        "tgravityacc-mean-z"        "tgravityacc-std-x"        
"tgravityacc-std-y"         "tgravityacc-std-z"         "tbodyaccjerk-mean-x"       "tbodyaccjerk-mean-y"       "tbodyaccjerk-mean-z"      
"tbodyaccjerk-std-x"        "tbodyaccjerk-std-y"        "tbodyaccjerk-std-z"        "tbodygyro-mean-x"          "tbodygyro-mean-y"         
"tbodygyro-mean-z"          "tbodygyro-std-x"           "tbodygyro-std-y"           "tbodygyro-std-z"           "tbodygyrojerk-mean-x"     
"tbodygyrojerk-mean-y"      "tbodygyrojerk-mean-z"      "tbodygyrojerk-std-x"       "tbodygyrojerk-std-y"       "tbodygyrojerk-std-z"      
"tbodyaccmag-mean"          "tbodyaccmag-std"           "tgravityaccmag-mean"       "tgravityaccmag-std"        "tbodyaccjerkmag-mean"     
"tbodyaccjerkmag-std"       "tbodygyromag-mean"         "tbodygyromag-std"          "tbodygyrojerkmag-mean"     "tbodygyrojerkmag-std"     
"fbodyacc-mean-x"           "fbodyacc-mean-y"           "fbodyacc-mean-z"           "fbodyacc-std-x"            "fbodyacc-std-y"           
"fbodyacc-std-z"            "fbodyaccjerk-mean-x"       "fbodyaccjerk-mean-y"       "fbodyaccjerk-mean-z"       "fbodyaccjerk-std-x"       
"fbodyaccjerk-std-y"        "fbodyaccjerk-std-z"        "fbodygyro-mean-x"          "fbodygyro-mean-y"          "fbodygyro-mean-z"         
"fbodygyro-std-x"           "fbodygyro-std-y"           "fbodygyro-std-z"           "fbodyaccmag-mean"          "fbodyaccmag-std"          
"fbodybodyaccjerkmag-mean"  "fbodybodyaccjerkmag-std"   "fbodybodygyromag-mean"     "fbodybodygyromag-std"      "fbodybodygyrojerkmag-mean"
"fbodybodygyrojerkmag-std"

## Variables
- set: merged data from train and test.
- subject: explained above.
- label: is the name of the labels
- set.mean.std: is the data set for mean and std
- data1: is the merged data
- data1.melt: is melted data
- data1.mean: is the average data over each subject.
