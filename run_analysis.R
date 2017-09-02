## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

setwd ('C:\\Sai\\Trainings\\Coursera\\DS_Course3_Getting_and_CleaningData\\Project\\UCI HAR Dataset')
list.files(".")

# Load activity labels + features

# Load: activity labels
activityLabels <- read.table("activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
activityLabels


# Load: data column names [features]
features_rm <- read.table("features.txt")
nrow(features_rm )
ncol(features_rm )
head(features_rm )
tail(features_rm )
rm(features_rm )

features <- read.table("features.txt")[,2]
tail(features)
features <- as.character(features)
head(features)

# Extract only the measurements on the mean and standard deviation for each measurement.
#extract_features <- grepl("mean|std", features)

# Extract only the data on mean and standard deviation
grep(".*mean.*|.*std.*", features)
featuresWanted <- grep(".*mean.*|.*std.*", features)
features[featuresWanted]
featuresWanted.names <- features[featuresWanted]
featuresWanted.names = gsub('-mean', 'Mean', featuresWanted.names)
featuresWanted.names = gsub('-std', 'Std', featuresWanted.names)
featuresWanted.names <- gsub('[-()]', '', featuresWanted.names)
featuresWanted.names
class(featuresWanted)
featuresWanted.names
#79 features
featuresWanted

setwd ('C:\\Sai\\Trainings\\Coursera\\DS_Course3_Getting_and_CleaningData\\Project\\UCI HAR Dataset\\test')

# Load the datasets
train <- read.table("train/X_train.txt")[featuresWanted]
nrow(train)
ncol(train)
trainActivities <- read.table("train/Y_train.txt")
nrow(trainActivities)
ncol(trainActivities)
trainSubjects <- read.table("train/subject_train.txt")
nrow(trainSubjects)
ncol(trainSubjects)
train <- cbind(trainSubjects, trainActivities, train)


test <- read.table("test/X_test.txt")[featuresWanted]
nrow(test)
ncol(test)
testActivities <- read.table("test/Y_test.txt")
nrow(testActivities)
ncol(testActivities)
testSubjects <- read.table("test/subject_test.txt")
nrow(testActivities)
ncol(testActivities)
# capture mean & std features of each of subjects while performing 6 various activities
test <- cbind(testSubjects, testActivities, test)
nrow(test)


# merge datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", featuresWanted.names)
head(allData)
nrow(allData)

# turn activities & subjects into factors
table(allData$activity)
activityLabels
allData$activity <- factor(allData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
table(allData$activity)

table(allData$subject)
allData$subject <- as.factor(allData$subject)
table(allData$subject)

allData[1,]
install.packages("reshape2")
library(reshape2)
allData.melted <- melt(allData, id = c("subject", "activity"))
head(allData.melted)
tail(allData.melted)
nrow(allData.melted)

allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

write.csv(allData.mean, "tidy.csv", row.names=FALSE)
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
