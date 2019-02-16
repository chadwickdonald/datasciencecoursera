# Getting and Cleaning Data Final Project

This R script pulls raw data from the UCI Machine Learning Repository and cleans up the data before calculating means of all fields. (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Data files are located here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Script

* The raw data files are downloaded
* activity_labels and features are read into dataframes
* for test and training data the following steps are executed: data is read into dataframes, the subject and activity data is combined with the data, the column names are added
* training and test dataframes are merged
* the data is then filtered to only mean and std data
* the mean is calculatate for all fields by subject and activity