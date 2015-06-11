## Loading dplyr package.
library(dplyr)

## Read file "subject_test.txt".
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Read file "X_test.txt". As the file has a fixed width for all its
## 561 variables, I create a vector first that repeats the sequence
## "drop one column, read 15 columns" 561 times.
readvec <- rep(c(-1,15), times = 561)
xtest <- read.fwf("./UCI HAR Dataset/test/X_test.txt", 
        widths=readvec)

## Read file "Y_test.txt".
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")

## Merging the "test" data.
test <- cbind(stest, xtest, ytest)

## Read file "subject_train.txt".
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Read file "X_train.txt".
xtrain <- read.fwf("./UCI HAR Dataset/train/X_train.txt", 
                   widths=readvec)

## Read file "Y_train.txt".
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")

## Merging the "train" data.
train <- cbind(strain, xtrain, ytrain)

## Merging the "test" and "train" data.
complete <- rbind(test, train)

## Read file "features.txt" and keep only second column as vector.
features <- read.table("./UCI HAR Dataset/features.txt")
features <- as.vector(features[,2])

## Apply the column header derived from features to data.
complete <- setNames(complete, c("subject",features,"activity"))

## Filtering out any columns not containing means or standard deviations.
toMatch <- c("subject", "-mean", "-std", "activity")
meanstd <- complete[,grep(paste(toMatch,collapse="|"), colnames(complete)), ]

## Read file "activity_labels.txt".
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Merge data with activity labels.
final <- merge(meanstd, activities, by.x="activity",by.y="V1", all = TRUE)

## Get rid of old integer activity column.
final$activity <- NULL

## Rename V2 (activity labels).
colnames(final)[81] <- "activity"

## Create data frame with the average of each variable for each activity and each subject.
averages <- final %>% group_by(subject, activity) %>% summarise_each(funs(mean))

## Writing the table to disk.
write.table(averages, "averages.txt", row.name=FALSE) 