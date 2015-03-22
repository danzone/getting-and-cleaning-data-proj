## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The entire file can be executed by calling the run_analysis() function.

run_analysis <- function() {
      
      ## Load the required files with working directory set as requred within the UCI HAR Dataset folder.
      
      ## Load the variable names and activity labels
      features <- read.table("features.txt")
      activities <- read.table("activity_labels.txt")
      
      ## Load the training data set
      xtrain <- read.table("train/X_train.txt")
      ytrain <- read.table("train/y_train.txt")
      subjtrain <- read.table("train/subject_train.txt")

      ## Load the test data set
      xtest <- read.table("test/X_test.txt")
      ytest <- read.table("test/y_test.txt")
      subjtest <- read.table("test/subject_test.txt")

      ## Match the subjects and activities in the training data with the data values
      train <- cbind(subjtrain, ytrain, xtrain)
      colnames(train)[1] <- "Subject"
      colnames(train)[2] <- "Activity"

      ## Match the subjects and activities in the test data with the data values
      test <- cbind(subjtest, ytest, xtest)
      colnames(test)[1] <- "Subject"
      colnames(test)[2] <- "Activity"

      ## Merge the training and test data
      combined <- rbind(train, test)
      
      ## Rename columns to take on their variable names and makes them syntactically valid. Explanation of each variable name
      ## can be found in the code book
      names(combined)[3:563] <- levels(features$V2)[features$V2]
      names(combined) <- make.names(names=names(combined), unique=TRUE)
      
      ## Rename activities according to the activity labels
      for (i in 1:6) {
            combined$Activity <- gsub(i, activities$V2[i], combined$Activity)
      }
      
      ## Scope data to only retain the mean and std dev data. Mean frequencies are not considered mean data and are removed.
      result <- combined %>%
      select(c(1,2, contains(".mean.."), contains("std"))) %>%
      
      ## create data set with average of each variable for each activity and subject. The 1st and 2nd columns of the 
      ## resultant data set are the activity and subject performed respectively and the remaining columns are the averages. 
      group_by(Activity, Subject) %>%
      summarise_each(funs(mean))

      ## Outputs the resultant tidy data set into a file named activity_subj_avg.txt in the working directory.
      write.table(result, file = "activity_subj_avg.txt", row.names=FALSE)

}

