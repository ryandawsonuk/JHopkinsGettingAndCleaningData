#Getting and Cleaning Data Project - Analysis on Activity Recognition Using Smartphones Data Set

##Project Purpose

The purpose of the project is to analyse the Human Activity Recognition Data Set and performs the specified cleaning activities on the data. The aims include merging the 'test' and 'train' X and Y datasets and including appropriate labels in the cleansed data set. These are to be performed in a run_analysis.R script. For more details on how to run that script, see [README.md](README.md). This document describes where the data comes from, its structure and what this project does to it.

##Data source

The data comes from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The background on how the data was captured is here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Observations on Structure of Supplied Data

The data comes as a zip file which is unzipped to contain files under 'test' and 'train' directories. These directories contain data in a set of text files and the file structures under 'test' and 'train' mirror one another. This is because each has been cut from a single dataset.

Data files are text files with columns seperated by whitespace. 

All observation values are numeric and none have column headers in the files.

Data set structure with test and train is split into activity (Y), subject and feature (X). 

Each of the feature data sets ([X_test.txt](UCI HAR Dataset/test/X_test.txt) and [X_train.txt](UCI HAR Dataset/train/X_train.txt) contains 561 columns. These columns map to the feature names in [features.txt](UCI HAR Dataset/features.txt), in the order given there. (Description of the features in [features_info.txt](UCI HAR Dataset/features_info.txt).)

There are the same number of rows in the [X_test.txt](UCI HAR Dataset/test/X_test.txt) and [Y_test.txt](UCI HAR Dataset/test/Y_test.txt) data sets and these map to one another. The nth row in the [Y_test.txt](UCI HAR Dataset/test/Y_test.txt) data set represents the activity being performed by a test subject when the observation captured in the the nth row of the [X_test.txt](UCI HAR Dataset/test/X_test.txt) data set was made. Likewise the nth row in [subject_test.txt](UCI HAR Dataset/test/subject_test.txt) data contains an identifier for the subject for nth test data observation.

The numbers in the [Y_test.txt](UCI HAR Dataset/test/Y_test.txt) and [Y_train.txt](UCI HAR Dataset/train/Y_train.txt) data map to the activity labels captured in [activity_labels.txt](UCI HAR Dataset/activity_labels.txt).

##Steps performed by the [run_analysis.R](run_analysis.R) script

1. Load all of the test and train data for features, activities and subjects (note the files in the 'Inertial Signals' are not used in this project).
2. Load labels for the loaded data sets.
3. Merge the test and train data sets (a row merge) and merge the feature, activity and subject data sets (a column merge).
4. Write the merged set to a file -[merged_data.txt](merged_data.txt).
5. Create a new data set aggregated by subject and activity so that each row represents the avg for a subject-activity combination.
6. Write the aggregated data set to [tidy_data.txt](tidy_data.txt).

##Notes on Derived Data

The variables in the [merged_data.txt](merged_data.txt) are the same as in the source data and the descriptions in [features_info.txt](UCI HAR Dataset/features_info.txt) from the source data are therefore applicable to it.

The variables in [tidy_data.txt](tidy_data.txt) are shifted in meaning since each there represents an average value for the subject-activity combination of that row. The units remain unaffected.