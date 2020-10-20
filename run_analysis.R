

##course project
library(dplyr)

features <- read.table("features.txt")

activity_labels <- read.table("activity_labels.txt")

# FOR TRAIN
train.files <- list.files("train/inertial Signals", full.names = TRUE)
subjectTrain <- read.table("train/subject_train.txt")
train_x <-read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt")


## FOR TEST
test.files <- list.files("test/inertial Signals", full.names = TRUE)
subjectTest <- read.table("test/subject_test.txt")
test_x<-read.table("test/X_test.txt")
test_y <- read.table("test/y_test.txt")


## merge the data
X <- rbind(test_x, train_x)
Y <- rbind(test_y, train_y)
Subject <- rbind(subjectTest, subjectTrain) 
mergeData <- cbind(Subject, X,Y)


##rename the columns
features1 <- rbind("subject",features, "code") 
colnames(mergeData) <-  features1[,2]


## Extract the values
TidyData <- mergeData %>% select(subject, code,contains("mean"), contains("std"))

##Uses descriptive activity names to name 
##activities in the data set
TidyData[,"code"] <- activity_labels[TidyData$code, 2]


##Appropriately labels the data set with descriptive 
##variable names, that replace the short form with full form
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

##
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)








