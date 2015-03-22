# Course Project (getting-and-cleaning-data-proj)
by lexaxy (23 Mar 2015)

## Introduction
For the Getting and Cleaning Coursera course project, data collected from the accelerometers from the Samsung Galaxy S smartphone was processed to create a tidy data set. The data and a description are available from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The actual data worked on: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Aims
The aims of the project are to write a R script (run_analysis.R) that does the folowing:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script
The script, run_analysis.R, which can also be found in this repo, can be executed by sourcing the R file and calling the run_analysis() function. The script does the following:

1. Loads the required files with working directory already set as requred within the UCI HAR Dataset folder.
2. Creates one table each for the train and test data that contains the Subject ID (1-30), the Activity (1-6) and the measurements for each variable.
3. Merges the train and test data.
4. Renames columns to take on their variable names and makes them syntactically valid (parantheses and dashes are replaced by dots). Explanation of each variable name can be found in the code book.
5. Replaces activity number with descriptive activity names.
6. Scopes data to only retain the mean and std dev data. Mean frequencies are not considered mean data and are removed.
7. Creates a resultant tidy data set with the average of each variable for each activity and each subject. The 1st and 2nd columns of the resultant data set are the activity and subject performed respectively and the remaining columns are the averages. 
8. Outputs the resultant tidy data set into a file named activity_subj_avg.txt in the working directory.

## Future work
The script can be improved by combining steps 1-3 within one step so as to save on creating too many variables. 