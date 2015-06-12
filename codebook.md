# Codebook

This project is based on data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data Set Information: 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity have been captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Raw data: 
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

No unit of measures is reported as all features were normalized and bounded within [-1,1].

In total, eight raw data files have been used in this course project:
- activity-labels.txt
- features.txt
- subject_test.txt
- subject_train.txt
- X-test.txt
- X-train.txt
- y-test.txt
- y-train.txt

## Detailed description about the operations performed
The raw data sets are processed with the run_analisys.R script to create a tidy data set.
The 3 test and 3 train files have been merged forming two data frames containing subject ids, all the measurements (features) and the activities performed. These two data frames have again been combined into one big master data frame (named "complete" in the R script). The feature names from features.txt have been used to form the column headings for the measurements. "Subject" and "activity" columns have been labeled accordingly. Activity numbers have been replaced by activity names from activity-labels.txt. Only measurement columns containing means (column name contains "-means") and standard deviations (column name contains "-std") have been kept. All other measurement columns have been dropped. A summarizing data set showing averages for all means and std measurements for each subject-activity-combination (180 rows in total) has been created and saved to disc.

## Variables
- readvec is a vector repeating the sequence "(-1,15)" 561 times. It is used to read in the fixed length files X-test.txt and X-train.txt.
- xtrain, ytrain, xtest, ytest, strain and stest contain the data from the downloaded files.
- test, train and complete merge the previous datasets.
- features contains the correct names for the complete dataset, which are applied to the column names.
- activities contains the correct activity labels for the complete dataset, which are applied to the activity values.
- toMatch is a vector used to drop any column not containing either "subject", "activity", "-mean" or "-std". The result ist stored in meanstd.
- final is the final data set before summarizing the data for the output file. 
- averages contains the relevant averages which will be later stored in a .txt file. The dplyr package is used to create the summarizing output file.

## Processed data: 
For each subject-activity-combination (180 rows) a 79-feature-table containing the summarizing averages for all means- and standard deviation-measurements is provided.
