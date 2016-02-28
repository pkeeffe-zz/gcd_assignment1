setwd("d:/dev/coursera/gcd_assignment1")

test_data <- read.table("./data/project/test/X_test.txt")
train_data <- read.table("./data/project/train/X_train.txt")
test_subject <- read.table("./data/project/test/subject_test.txt")
train_subject <- read.table("./data/project/train/subject_train.txt")
test_labels <- read.table("./data/project/test/Y_test.txt")
train_labels <- read.table("./data/project/train/Y_train.txt")
labels <- read.table("./data/project/activity_labels.txt")
features <- read.table("./data/project/features.txt")


names(labels) <- c("activityid","activity")

merge_labels <- rbind(test_labels,train_labels)
merge_subject <- rbind(test_subject,train_subject)
merge_data <- rbind(test_data,train_data)

cols <- grep("mean|std",features[,2])

merge_data <- select(merge_data, cols)
names(merge_data) <- features[,2][cols]
names(merge_subject) <- "subjectid"
names(merge_labels) <- "activityid"

final <- cbind(merge_labels, merge_subject, merge_data)

summary_data <- final %>% group_by(subjectid, activity) %>% summarise_each(funs(mean, sd), -activityid)

write.table(summary_data,"./results.txt",row.name = FALSE)