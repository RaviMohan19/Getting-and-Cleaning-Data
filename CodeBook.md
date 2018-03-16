# Author : Ravi .M.B

# Data Acquisition:

Data for the project downloaded from the following URL

[URL] : (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data from the above URL is used as the source, the data consists of *Human Activity Recogitio using smartphones*. Ater data is downloaded it is extracted in to a directoy called "*data*".

# R Script
## Data Reading for analysis,Variables for storing the relevant information 

*run_analysis* performs the following tasks suggested in the course project instructions, please note the order of the tasks accomplishment is in no particular order, follow the notes mentioned in the *run_analysis* script 

* Goal 1: Tidy the data set Merge the train and test data
* Goal 2: extract only the measurements on the mean and standard deviation for each measurement
* Goal 3: label the data set with descriptive variable names
* Goal 4: name the activities in the data set by using descriptive activity names * Goal 5: create a second, independent tidy data set with the average of each variable for each activity and each subject

The above mentioned *tasks/goals* are met, it is observed that source data consists of various text files categorized as training and test.Training Data an Test Data are both read for analysis. Training data is read and stored in the following *variables*

* study_x_train
* study_y_train
* subject_train

Test Data is read and stred in the following *variables*

* study_x_test
* study_y_test
* subject_test

*variable* such as **calc_mean_stdev** is use for calculating the mean and standard deviation of the measurements.

**ind_tidy_set** is the second indepedent tidy set 





