getting-and-cleaning-data
=========================

This repository contains the submision for the Coursera "Getting and Cleaning Data" course project.  It contains the following files:

1 - run_analysis.R : the R script used to process the original data set and output the tidy data set.  The scripts:
  - Groups the original data set by Subject and Activity.
  - Combines the training and test observations under the varibale ``datatype``. The training observations have datatype = 1, while the test observations have datatype = 2.
  - The variables repressent the average of the mean() and std() variables for each feature.

2- averageBySubjectAndActivity.txt: this a tidy data obtained by computing the averages for measurements from the following dataset, grouped by Subjects and Activity
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

3 - CodeBook.md: this is a code book that describes the variables, the data, and how the tidy data set was obtained



