##Set the working directory for the assignment.

setwd("d:/dev/coursera/assignments/gcd_assignment1")

##Create all of the dataframes -  data has been put in a data subdirectory of wd
test_data <- read.table("./data/test/X_test.txt")
train_data <- read.table("./data/train/X_train.txt")
test_subject <- read.table("./data/test/subject_test.txt")
train_subject <- read.table("./data/train/subject_train.txt")
test_labels <- read.table("./data/test/Y_test.txt")
train_labels <- read.table("./data/train/Y_train.txt")
labels <- read.table("./data/activity_labels.txt")
features <- read.table("./data/features.txt")

##Rename the labels variables to so that they will be more descriptive
##when the labels are merged with the test data set.
names(labels) <- c("activityid","activity")

##Combine the dataframes using rbind to union the test and train data
merge_labels <- rbind(test_labels,train_labels)
merge_subject <- rbind(test_subject,train_subject)
merge_data <- rbind(test_data,train_data)

##Subset the mean and std variables from the features table tp
##remove all of the unwanted measures
cols <- grep("mean|std",features[,2])

##Create a dataframe which only contains the mean and std variables
merge_data <- select(merge_data, cols)

##Rename the result data set variables as per the features
##this will ensure all the columns are descriptive
names(merge_data) <- features[,2][cols]

##Add more meaningful column headers to the subject and labels tables
names(merge_subject) <- "subjectid"
names(merge_labels) <- "activityid"

##Combine the result data with associated subject and labels
final <- cbind(merge_labels, merge_subject, merge_data)

##Join the final table to labels on ActivityId.
final <- merge(labels, final)

##Create a summary table grouping on activity, subject and summarising mean and sd
summary_data <- final %>% group_by(subjectid, activity) %>% summarise_each(funs(mean, sd), -activityid)

##Output the table to a results file
write.table(summary_data,"./results.txt",row.name = FALSE)
