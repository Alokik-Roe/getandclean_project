---
title: "Codebook"
author: "Alokik"
date: "20/10/2020"
output:
  html_document:
    df_print: paged
---
### The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

**Download the dataset**

**1. Assign each data to variables**
  
*features <- read.table("features.txt")*:
  561 rows, 2 columns
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

*activity_labels <- read.table("activity_labels.txt"):*
  6 rows, 2 columns
  List of activities performed when the corresponding measurements were taken and its codes (labels)

*subjectTrain <- read.table("train/subject_train.txt")*
  7352 rows, 1 column
  contains train data of 21/30 volunteer subjects being observed

*train_x <-read.table("train/X_train.txt")*
  7352 rows, 561 columns
  contains recorded features train data

*train_y <- read.table("train/y_train.txt")*
  7352 rows, 1 columns
  contains train data of activities’code labels

*subjectTest <- read.table("test/subject_test.txt")*
  2947 rows, 1 column
  contains test data of 9/30 volunteer test subjects being observed

*test_x<-read.table("test/X_test.txt")*
  2947 rows, 561 columns
  contains recorded features test data

*test_y <- read.table("test/y_test.txt")*
  2947 rows, 1 columns
  contains test data of activities’code labels

**2. Merges the training and the test sets to create one data set**
  X (10299 rows, 561 columns) is created by merging train_x and test_x using rbind() function
  Y (10299 rows, 1 column) is created by merging train_y and test_y using rbind() function
  Subject (10299 rows, 1 column) is created by merging subjectTrain and subjectTest using rbind() function
  mergeData (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function
  
  ***name the columns accordingly***

**3. Extracts only the measurements on the mean and standard deviation for each measurement**
    TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements
    on the mean and standard deviation (std) for each measurement

**4. Uses descriptive activity names to name the activities in the data set**
    Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activities
    variable

**5. Appropriately labels the data set with descriptive variable names, **
    code column in TidyData renamed into activities
    All Acc in column’s name replaced by Accelerometer
    All Gyro in column’s name replaced by Gyroscope
    All BodyBody in column’s name replaced by Body
    All Mag in column’s name replaced by Magnitude
    All start with character f in column’s name replaced by Frequency
    All start with character t in column’s name replaced by Time

**5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject**
    FinalData (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each
    subject, after groupped by subject and activity.
    Export FinalData into FinalData.txt file.
