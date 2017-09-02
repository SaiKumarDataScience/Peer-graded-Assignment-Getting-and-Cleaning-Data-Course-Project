# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project
This is the Getting and Cleaning Data Coursera course project. 
The R script, run_analysis.R, does the following:

Download the dataset if it does not already exist in the working directory
Load the activity and feature info
Activities are like Walking,Sitting,Standing etc.,
Features are observation values captured during each activity
Then Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
Load the activity and subject data for each dataset, and merge those columns with the dataset
Merge the two datasets
Convert the activity and subject columns into factors
Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
The end result is shown in the file tidy.csv file
