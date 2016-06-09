##Load specific libraries
library(RCurl)
library(reshape2)

##This part to download data and unzip the folder
if (!file.info('UCI HAR Dataset')$isdir) { ##check if the folder exist
  Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ##Url
  dir.create('UCI HAR Dataset')                          ## Create a Directory
  download.file(Url, 'UCIHARdataset.zip', method='curl') ##Download the Zip file
  unzip('./UCIHARdataset.zip')                          ##Extract the folder in the directory
}

##1) Read Data from train and test folders and merge them
##1.a. merge train and test sets in one data set
trainSet <- read.table('./UCI HAR Dataset/train/X_train.txt') ##read train set
testSet <- read.table('./UCI HAR Dataset/test/X_test.txt')    ##read test set
set <- rbind(trainSet, testSet)                               ##merge sets

##1.b. merge train and test labels in one data set
trainLabel <- read.table('./UCI HAR Dataset/train/y_train.txt') ##read train labels
testLabel <- read.table('./UCI HAR Dataset/test/y_test.txt')    ##read test labels
label <- rbind(trainLabel, testLabel)                           ##merge labels

##1.c. merge train and test subjects in one data set
trainSubject <- read.table('./UCI HAR Dataset/train/subject_train.txt') ##read train subjects
testSubject <- read.table('./UCI HAR Dataset/test/subject_test.txt')    ##read test subjects
subject <- rbind(trainSubject, testSubject)                           ##merge subjects

##2) This part is to extract the mean and std features from the data sets
features <- read.table('./UCI HAR Dataset/features.txt')   ## read features
mean.std <- grepl("-mean\\(\\)|-std\\(\\)", features[, 2]) ##select mean or std from features
set.mean.std <- set[, mean.std]                            ##Sets that belong to mean and std

##3) Uses descriptive activity names to name the activities in the data set
names(set.mean.std) <- features[mean.std, 2] ##name the sets using features descriptions
names(set.mean.std) <- gsub("\\(|\\)", "", names(set.mean.std)) ##remove () from the names
names(set.mean.std) <- tolower(names(set.mean.std))

##read activity labels
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt') ## read the file
activityLabels[, 2] <- gsub("_", "", activityLabels[, 2])             ## remove the underscore sign (_)
activityLabels[, 2] <- tolower(activityLabels[, 2])

label[, 1] = activityLabels[label[, 1], 2]
colnames(label) <- 'activity'
colnames(subject) <- 'subject'

##4) Appropriately labels the data set with descriptive variable names.
data1 <- cbind(subject, label, set.mean.std) ## merge the data in one table
write.table(data1, './mergeddata.txt', row.names = FALSE, quote=FALSE)

##5) From the data set in step 4, creates a second, 
##   independent tidy data set with the average of each 
##   variable for each activity and each subject.
## turn activities & subjects into factors
data1$subject <- as.factor(data1$subject) ## converted it to extract levels
data1.melt <- melt(data1, id = c("subject", "activity")) #define ids for subject and activity
#extract the mean using dcast for each subject and each activity
data1.mean <- dcast(data1.melt, subject + activity ~ variable, mean) 

## Write the mean data to a file
write.table(data1.mean, "meandata.txt", row.names=FALSE, quote=FALSE)
