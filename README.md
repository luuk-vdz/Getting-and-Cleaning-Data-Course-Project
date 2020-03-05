### Getting and Cleaning Data Course Project:
* Coursera - Johns Hopkins University Data Science Specialization
* Course 3: Getting and Cleaning Data
* Week 4: Course Project
* Author: luuk-vdz

### Preparations and running the script:
* Download files and unzip the files into your R working directory. You can do this manually via browser and file explorer or use the appropriate R functions 
* Download and source the R script into your R working directory.
* Ensure you have the dplyr package installed
* Run the script to generate the final output

### Data set:
* Name: Human Activity Recognition Using Smartphones
* Source: UCI Machine Learning repository

### Content of repository:
* CodeBook.md: description of variables, data and transformations for creating the tidy data set
* run_analysis.R: R script loads the dplyr package and assigns the input files of the data set to a variable and contains the 5 steps required in the course project:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* AverageData.txt is final data tidy data set from steps 1-5 of the R script (containing average of each variable for each activity and each subject)
