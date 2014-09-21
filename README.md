getting-and-cleaning-data
=========================

This repository contains the submision for the Coursera "Getting and Cleaning Data" course project.  It contains the following files:

1 - averageBySubjectAndActivity.txt: this a tidy data obtained by computing the averages for measurements from the following dataset, grouped by Subjects and Activity
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

  The tidy dataset was computed by applying these threes steps to the original dataset:

  - Each feature was grouped by Subject and Activity.
  - The training and test observation were combined under a column datatype. The training observation have datatype = 1, while the test observations have datatype = 2.
  - The variables repressent the average of the mean() and std() variables for each feature.
 
2 - CodeBook.md: this is a code book that describes the variables, the data, and how the tidy data set was obtained

3 - run_analysis.R : the R script that was used to process the original data set and output the tidy data set.


