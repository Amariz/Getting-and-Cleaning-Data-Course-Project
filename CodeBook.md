### Initial data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Project description:

> You should create one R script called run_analysis.R that does the following.

> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement.
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names.
> 5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

### Data transformation and analysis sequence:

1) Load into R files with labels needed for both train and test data sets (list of names for 6 activities: *activity_labels.txt*; 
                                                                                list of names for 561 featurs: *features.txt*)

2) Load into R files with data for train data set (*subject_train.txt* - IDs of subjects participating in training set; 
*y_train.txt* - IDs of activities; *X_train.txt* - main dataset with 561 columns for features)

3) Load into R files with data for test data set (all files are analogous to the files in train data set)

4) For both train and test datasets: combine subject IDs, activity IDs and features data into one table **train_merged**//**test_merged** (using `cbind` function); 
manually assign column name *'Subject'* to the column with subject IDs (using `colnames` function).
Create a column named *"Activity"* with descriptive activity name using function `merge` and *activity_labels* table. 
Resulting files are named **train_merged_labeled** and **test_merged_labeled**, respectively.

5) Combine both datasets into one full dataset for all subjects and activities using `rbind` function.

Create a list of indices of all columns that need to be extracted to the final tidy dataset 
(i.e. columns contatining *mean* and *std* in their names,
plus the first and the second column as they contain info on the subject and activity name) - using `grep` function.
Resulting table is called **Tidy_dataset**.

6) In order to calculate averages for each feature selected to the tidy dataset we need to reshape data:
* use `melt` function with *"Subject"* and *"Activity"* columns as keys and all other columns as variables
- store result into **MeltData** table
* use `dcast` function for *"Subject"* and *"Activity"* columns against *"Variable"* column and applying `mean` function
- store result in **Final_mean_data** table

7) Finally upload ***Final_mean_data* into text file **Tidy_dataset.txt** using `write.table` function.

### List of 79 columns extracted to the tidy dataset (those that contain data on means and standard deviations):

* tBodyAcc-mean()-X

* tBodyAcc-mean()-Y

* tBodyAcc-mean()-Z

* tBodyAcc-std()-X

* tBodyAcc-std()-Y

* tBodyAcc-std()-Z

* tGravityAcc-mean()-X

* tGravityAcc-mean()-Y

* tGravityAcc-mean()-Z

* tGravityAcc-std()-X

* tGravityAcc-std()-Y

* tGravityAcc-std()-Z

* tBodyAccJerk-mean()-X

* tBodyAccJerk-mean()-Y

* tBodyAccJerk-mean()-Z

* tBodyAccJerk-std()-X

* tBodyAccJerk-std()-Y

* tBodyAccJerk-std()-Z

* tBodyGyro-mean()-X

* tBodyGyro-mean()-Y

* tBodyGyro-mean()-Z

* tBodyGyro-std()-X

* tBodyGyro-std()-Y

* tBodyGyro-std()-Z

* tBodyGyroJerk-mean()-X

* tBodyGyroJerk-mean()-Y

* tBodyGyroJerk-mean()-Z

* tBodyGyroJerk-std()-X

* tBodyGyroJerk-std()-Y

* tBodyGyroJerk-std()-Z

* tBodyAccMag-mean()

* tBodyAccMag-std()

* tGravityAccMag-mean()

* tGravityAccMag-std()

* tBodyAccJerkMag-mean()

* tBodyAccJerkMag-std()

* tBodyGyroMag-mean()

* tBodyGyroMag-std()

* tBodyGyroJerkMag-mean()

* tBodyGyroJerkMag-std()

* fBodyAcc-mean()-X

* fBodyAcc-mean()-Y

* fBodyAcc-mean()-Z

* fBodyAcc-std()-X

* fBodyAcc-std()-Y

* fBodyAcc-std()-Z

* fBodyAcc-meanFreq()-X

* fBodyAcc-meanFreq()-Y

* fBodyAcc-meanFreq()-Z

* fBodyAccJerk-mean()-X

* fBodyAccJerk-mean()-Y

* fBodyAccJerk-mean()-Z

* fBodyAccJerk-std()-X

* fBodyAccJerk-std()-Y

* fBodyAccJerk-std()-Z

* fBodyAccJerk-meanFreq()-X

* fBodyAccJerk-meanFreq()-Y

* fBodyAccJerk-meanFreq()-Z

* fBodyGyro-mean()-X

* fBodyGyro-mean()-Y

* fBodyGyro-mean()-Z

* fBodyGyro-std()-X

* fBodyGyro-std()-Y

* fBodyGyro-std()-Z

* fBodyGyro-meanFreq()-X

* fBodyGyro-meanFreq()-Y

* fBodyGyro-meanFreq()-Z

* fBodyAccMag-mean()

* fBodyAccMag-std()

* fBodyAccMag-meanFreq()

* fBodyBodyAccJerkMag-mean()

* fBodyBodyAccJerkMag-std()

* fBodyBodyAccJerkMag-meanFreq()

* fBodyBodyGyroMag-mean()

* fBodyBodyGyroMag-std()

* fBodyBodyGyroMag-meanFreq()

* fBodyBodyGyroJerkMag-mean()

* fBodyBodyGyroJerkMag-std()

* fBodyBodyGyroJerkMag-meanFreq()

