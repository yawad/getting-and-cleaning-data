Features: 
=========

The tidy data set "averageBySubjectAndActivity.txt" contains a subset of the features that are found in the original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original data set contains an extensive list of features from the accelerometer (tAcc-XYZ) and gyroscope ((tGyro-XYZ) 3-axial raw signals of a Samsung Galaxy S smartphone.  The `t`denotes the measurement in the time domain and the `f` is a measurement in the frequency domain.  These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  

The tidy dataset was computed by applying these threes steps to the original dataset:
  1. Each feature was grouped by Subject and Activity.
  2. The training and test observation were combined under a column `datatype`.  The training observation have datatype = 1, while the test observations have datatype = 2.
  3. The variables repressent the average of the mean() and std() variables for each feature.

Columns of the data set:
========================

- Subjects: the id of the subjects used in the experiment.
- Activity: the activity
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
- datatype (test = 2, training = 1)
