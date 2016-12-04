setwd("C:/Users/Bazhma02/Desktop/R/Getting and cleaning data/CourseProject")
setwd("./UCI HAR Dataset")
getwd()

################ Extract labels

activity_labels <- as.data.frame(read.table("activity_labels.txt", header = FALSE, sep = " "))
View(activity_labels)
names(activity_labels) <- c("ID","Activity")

features <- as.data.frame(read.table("features.txt", header = FALSE, sep = " "))
View(features)

################ Extract train data

setwd("./train")
getwd()

subject_train <- as.data.frame(read.table("subject_train.txt", header = FALSE, sep = " "))
View(subject_train)
table(subject_train)
names(subject_train) <- "Subject"

X_train <- read.table("X_train.txt", header = FALSE)
View(X_train)

Y_train <- read.table("Y_train.txt", header = FALSE)
View(Y_train)
table(Y_train)
names(Y_train) <- "Activity"

################ Extract test data

setwd("..")
setwd("./test")
getwd()

subject_test <- as.data.frame(read.table("subject_test.txt", header = FALSE, sep = " "))
View(subject_test)
table(subject_test)
names(subject_test) <- "Subject"

X_test <- read.table("X_test.txt", header = FALSE)
View(X_test)

Y_test <- read.table("Y_test.txt", header = FALSE)
View(Y_test)
table(Y_test)
names(Y_test) <- "Activity"

################ Label test data

library(data.table)

names(X_test) <- features$V2
View(X_test)

test_merged <- cbind(subject_test$Subject, Y_test$Activity,X_test)
View(test_merged)

test_merged_labeled <- merge(activity_labels, test_merged, by.x = "ID", by.y = "Y_test$Activity")
View(test_merged_labeled)

colnames(test_merged_labeled)[3] <- "Subject"
test_merged_labeled$ID <- NULL

################ Label train data

names(X_train) <- features$V2
View(X_train)
 
train_merged <- cbind(subject_train$Subject, Y_train$Activity,X_train)
View(train_merged)

train_merged_labeled <- merge(activity_labels, train_merged, by.x = "ID", by.y = "Y_train$Activity")
View(train_merged_labeled)

colnames(train_merged_labeled)[3] <- "Subject"
train_merged_labeled$ID <- NULL

################ Merge and extract data

Merged_data <- rbind(train_merged_labeled, test_merged_labeled)
View(Merged_data)

extract_index <- as.numeric(c("1","2",grep('mean|std',names(Merged_data))))
Tidy_dataset <- Merged_data[,extract_index]
View(Tidy_dataset)

MeltData <- melt(Tidy_dataset,id = c("Subject","Activity"))
View(MeltData)
Final_mean_data <- dcast(MeltData, Subject + Activity ~ variable, mean)
View(Final_mean_data)

setwd("..")
setwd("..")
write.table(Final_mean_data, "Tidy_dataset.txt", row.names=FALSE)
