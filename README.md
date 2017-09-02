# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project
This is the Getting and Cleaning Data Coursera course project. 
The R script, run_analysis.R, does the following:

1.  Download the dataset if it does not already exist in the working directory
2.  Load the activity and feature info
    Activities are like Walking,Sitting,Standing etc.,
    Features are observation values captured during each activity
3.  Then Load both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
4.  Load the activity and subject data for each dataset, and merge those columns with the dataset
5.  Merge the two datasets
6.  Convert the activity and subject columns into factors

This Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.csv file
