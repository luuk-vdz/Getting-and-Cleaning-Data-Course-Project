# Preparation step I: load the dplyr R package

library(dplyr)

# Preparation step II: assign the input files to a variable by using the read.table function

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# 1. Merges the training and the test sets to create one data set.
# Use rbind and cbind to merge training- and test data sets

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
TrainAndTest <- cbind(Subject, Y, X)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Use select to extract measurements that contain mean and standard deviation information

CleanData <- TrainAndTest %>% select(subject, code, contains("mean"), contains("std"))

# 3. Uses descriptive activity names to name the activities in the data set

CleanData$code <- activities[CleanData$code, 2]

# 4. Appropriately labels the data set with descriptive variable names.
# Use gsub to replace abbreviations in column names

names(CleanData)[2] = "activity"
names(CleanData) <- gsub("Acc", "Accelerometer", names(CleanData))
names(CleanData) <- gsub("Gyro", "Gyroscope", names(CleanData))
names(CleanData) <- gsub("BodyBody", "Body", names(CleanData))
names(CleanData) <- gsub("Mag", "Magnitude", names(CleanData))
names(CleanData) <- gsub("^t", "Time", names(CleanData))
names(CleanData) <- gsub("^f", "Frequency", names(CleanData))
names(CleanData) <- gsub("tBody", "TimeBody", names(CleanData))
names(CleanData) <- gsub("-mean()", "Mean", names(CleanData), ignore.case = TRUE)
names(CleanData) <- gsub("-std()", "STD", names(CleanData), ignore.case = TRUE)
names(CleanData) <- gsub("-freq()", "Frequency", names(CleanData), ignore.case = TRUE)
names(CleanData) <- gsub("angle", "Angle", names(CleanData))
names(CleanData) <- gsub("gravity", "Gravity", names(CleanData))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

AverageData <- CleanData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(AverageData, "AverageData.txt", row.name=FALSE)