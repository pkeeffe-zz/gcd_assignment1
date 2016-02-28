# gcd_assignment1

This project contains one script called run_analysis.R

Refer to the codebook for a description of the data files used in this project.

The script is used to perform the following actions:

## 1. Merge the training and the test sets to create one data set.

A combined dataset of 10299 observations is created in the merge_data data frame.

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

The select function is used to populate a final dataframe with only the mean and std measures.

## 3. Uses descriptive activity names to name the activities in the data set

The labels for activities are also renamed to be more meaningful when merged into the dataset

## 4. Appropriately label the data set with descriptive variable names.

The variables in each file are renamed to make the dataframes and resulting output more readable.
The final dataframe uses the features definition to populate the headers.


##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This has been created and is containted in results.txt