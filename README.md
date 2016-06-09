# RunAnalysis
##Getting and Cleaning Data Course Project Assignment 

This script produce a tidy data for the following data source:

Original data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full Description at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script do the following task:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script will check if the data directory exist and if not it will download the zip file and then create a directory to extract the data there.
Afterward, the script will merge the data from train and test, then extract the mean and std. 
We convert the names to the lower case to make things easy, and removed the underscore. 
Later on, the subjet and labels were read by the script and modified.
The subject, label, and set was cbind in one data set, and stored as table in a txt file (meregeddata.txt)
we converted the data1$subject to a factor to extract the subject levels, and then melt the data. 
Later the data was average over each subject for each activity. The data was stored as a table in a txt file (meandata.txt).

Thanks!
