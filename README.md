#Getting and Cleaning Data Project - Analysis on Human Activity Recognition Using Smartphones Data Set

##Project Purpose

The purpose of the project is to analyse the Human Activity Recognition Data Set and perform specified cleaning activities on the data. These are to be performed in a [run_analysis.R](run_analysis.R) script.

It is required that the [run_analysis.R](run_analysis.R) script:

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This is the course project for the Johns Hopkins Getting and Cleaning Data Coursera course.	
	
##What this README explains

This README explains how to use the run_analysis.R script. For details of how the data was obtained, the structure of the data and its variables, what the script does and how it works, see [CodeBook.md](CodeBook.md).

##Steps for using run_analysis.R

1. Download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into the working directory (a subdirectory "UCI HAR Dataset" will be created). Either do this manually or optionally use download_unzip.R (tested on windows using source("download_unzip.R") - note that a method="curl" parameter may be needed on download.file on other platforms).
2. Make sure that the unzipped folder "UCI HAR Dataset" and the run_analysis.R script are both in the current R working directory.
3. Run the run_analysis script in R (RStudio 1.0.44 was used for testing) using source("run_analysis.R").
4. Check that merged_data.txt has been created in the working directory. It should have human-readable column headings in the first row. Other rows should be observations (10299 observations for 10301 lines in the file).
5. Check that tidy_data.txt has been created in the working directory. It should have human-readable column headings in the first row. Other rows should be subject-activity combinations and avg values for them (180 combinations for 182 lines in the file). 