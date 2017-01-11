require(dplyr)

#load activity data for test and train, assuming data unzipped to folder under working directory (see README)
#paths assumed to be relative to working directory
activitytest  <- read.table("UCI HAR Dataset/test/Y_test.txt" , header = FALSE)
activitytrain <- read.table("UCI HAR Dataset/train/Y_train.txt", header = FALSE)

#load subject data for test and train
subjecttest  <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)

#load feature data for test and train
featuretest  <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
featuretrain <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

#the test and train data sets follow same structure and are just divisions of observations
#so can merge into combined data using row binding
#this is part of objective 1 - creating a merged data set (currently three, to be merged further)
activity <- rbind(activitytrain, activitytest)
subject <- rbind(subjecttrain, subjecttest)
feature <- rbind(featuretrain, featuretest)

#activity data currently just numbers
#need to translate those numbers into labels/factor
#obtain the labels from labels reference file
labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
#first (only) column of activity data defauted to V1 - convert it into a factor column
#the levels for the factor come from 1st column of activity_labels file, labels from second
activity$V1 <- factor(activity$V1, levels = as.integer(labels$V1), labels = labels$V2)

#need to give descriptive column names rather than the V1 etc defaults (objective 3 & 4)
#give headings/names to activity and subject data (each is only 1 column)
names(activity)<- c("activity")
names(subject)<-c("subject")

#load names of feature columns from the features mapping file 
featurelabels <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
#use rows from file to assign column names to feature data (2nd column contains labels, in same order as the feature columns)
names(feature)<- featurelabels$V2

#only want feature columns with 'mean()' or 'std()' in their names (this is objective 2)
#so extract these names into a vector (using grep with regex) and use to subset the feature dataset
meanstdev<-c(as.character(featurestxt$V2[grep(pattern="mean\\(\\)|std\\(\\)", x=featurelabels$V2,ignore.case=TRUE)]))
subsetfeaturedata<-subset(feature,select=meanstdev)

#combine the activity subject and subsetted feature data sets into one (part of objective 1)
#these are the columns on the same observations in the same order so can use column binding
subjectactivity <- cbind(subject, activity)
mergedData <- cbind(subjectactivity, subsetfeaturedata)
#write out the merged data
write.table(mergedData, "merged_data.txt") 

#objective 5 is to a second, independent tidy data set with the average of each variable for each activity and each subject
#so need to group by activity and subject
#dataset is independent as aggregate function returns new dataset
tidydata <- aggregate(mergedData, by = list(Subject=mergedData$subject, Activity=mergedData$activity), FUN = mean)

#remove the redundant subject and activity columns (3rd and 4th) that should be replaced by those produced by aggregate
tidydata <- select(tidydata, -(3:4))

#Writes tidy data to text file
write.table(tidydata, file = "tidy_data.txt", row.name = FALSE)
