# GCD-Course-Project
This repository hosts the R code, output and documentation files for the course "Getting and Cleaning Data". The Course Project serves to demonstrate the collection and cleaning of a data set that can be used for subsequent analysis.

The dataset being used is: Human Activity Recognition Using Smartphones.

The R script run_analysis.R assumes that all the relevant data have been downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzipped and put in the working directory within its original folder "UCI HAR Dataset".
It will perform all the merging, tidying, summarizing and output steps asked for in the Course Project Description. It performs its tasks using the dplyr package.

codebook.md describes the raw data, variables and any transformations performed to clean up the data.

README.md is this file.

averages.txt is the output file asked for in the Course Project Description.

## Important:
If you view the averages.txt in programs like notepad or in your browser (e. g. in the Coursera Course Project page), it might not look very tidy in the beginning. This is not a fault of my script but of the program used for viewing it. To make sure that my script really produces a tidy data set you can open it in R. The code used for doing this would be

averages <- read.table(file, header = TRUE)

View(averages)

Make sure to replace the "file" with the path/filename you saved it to.
