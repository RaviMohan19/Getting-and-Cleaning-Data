##################################################################################

## Author : Ravi M.B.
## Course : Getting and Cleaning Data - Data Science Specalization
## Project: Getting and Cleaning Data 

##################################################################################


# Acquisition of the project data from the recommended URL


if(!file.exists("./data")){
dir.create("./data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

# Extracting the data frm the zip file

unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Setting the Working directory in R Studio

setwd("~/data/UCI HAR Dataset")

# Reading the training data

study_x_train <- read.table("train/X_train.txt")
study_y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Reading the test data

study_x_test <- read.table("test/X_test.txt")
study_y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Goal 1
# Now Goal is to tidy the data set 
# Nerge the train and test data

study_features <- read.table("features.txt")
study_activity <- read.table("activity_labels.txt")
colnames(study_x_train) <- study_features[,2] 
colnames(study_y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(study_x_test) <- study_features[,2] 
colnames(study_y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(study_activity) <- c('activityId','activityType')

merge_train_data <- cbind(study_y_train, subject_train, study_x_train)
merge_test_data <- cbind(study_y_test, subject_test, study_x_test)
merge_all_data <- rbind(merge_train_data, merge_test_data)

# Goal 2 and Goal 3
# Now the goal is to extract only the measurements on the mean and standard deviation for each measurement
# label the data set with descriptive variable names

read_names <- colnames(merge_all_data)

mean_std_dev <- (grepl("activityId" , read_names) | 
                       grepl("subjectId" , read_names) | 
                       grepl("mean.." , read_names) | 
                       grepl("std.." , read_names) 
                      )

calc_mean_stdev<- merge_all_data[ , mean_std_dev == TRUE]


# Goal 4
# name the activities in the data set by using descriptive activity names 

name_activities <- merge(calc_mean_stdev, study_activity, by ='activityId',all.x=TRUE)

# Goal 5
# create a second, independent tidy data set with the average of each variable for each activity and each subject
# this needs to be achieved using the steps in Goal 3


ind_tidy_set <- aggregate(. ~subjectId + activityId, name_activities, mean)
ind_tidy_set <- ind_tidy_set[order(ind_tidy_set$subjectId, ind_tidy_set$activityId),]
write.table(ind_tidy_set, "ind_tidy_set.txt", row.name=FALSE)
write.table(ind_tidy_set, "ind_tidy_set.csv", row.name=FALSE)















 