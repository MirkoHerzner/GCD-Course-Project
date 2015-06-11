# GCD-Course-Project
Getting and Cleaning Data Course Project

The R script run_analysis.R assumes that all the relevant data have been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzipped and put in the working directory.

It will perform all the merging, tidying, summarizing and output steps asked for in the Course Project Description. It performs its tasks using the dplyr package.

## Detailed description about the operations performed
The 3 test and 3 train files have been merged forming two data frames containing subject ids, all the gyroscope measurements (features) and the activity performed. These two data frames have again been combined into one big master data frame (named "complete" in the R script). The feature names from features.txt have been used to form the column headings for the measurements. "Subject" and "activity" columns have been labeled accordingly. Activity numbers have been replaced by activity names from activity-labels.txt. Only measurement columns containing means (column name contains "-means") and standard deviations (column name contains "-std") have been kept. All other measurement columns have been dropped. A summarizing data set showing means for all means and std measurements for each subject-activity-combination (180 rows in total) has been created and saved to disc.
