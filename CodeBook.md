
# CodeBook for run_analysis.R

Preparation steps for downloading the data and assigning the data to variables are described in the README file included in this repository.

run_analysis.R script loads the dplyr R package and executes steps 1-5 of the course project.

## Step 1: Merges the training and the test sets to create one data set
X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function

Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function

Subject (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function

TrainAndTest (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
CleanData (10299 rows, 88 columns) is created by subsetting TrainAndTest, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

## Step 3: Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the CleanData replaced with corresponding activity taken from second column of the activities variable

## Step 4: Appropriately labels the data set with descriptive variable names
code column in CleanData renamed into activities

Abbreviations are replaced in column names:
* All Acc in column name replaced by Accelerometer
* All Gyro in column name replaced by Gyroscope
* All BodyBody in column name replaced by Body
* All Mag in column name replaced by Magnitude
* All start with character f in column name replaced by Frequency
* All start with character t in column name replaced by Time

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
AverageData (180 rows, 88 columns) is created by sumarizing CleanData taking the means of each variable for each activity and each subject, after grouped by subject and activity.

Export AverageData into AverageData.txt file.
