gettingAndCleaningData
======================

### Collect, work with, and clean a data set.

## This is the README.md, the markdown to explain how the script works.

The script run_analysis.R transforms the data obtained from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
into a tidy dataset.
The dataset for the project was taken from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Steps:
Download and extract the zip file into your working directory.
Run the script run_analysis.R 
The resulting content of tidydata.txt in your working directory is your tidy dataset.
The codebook describing the variables contained in the tidydata.txt is CodeBook.md.
The run_analysis.,R file basically does the following:
*1.	It reads data from raw data files and folders into variables x1, x2, subject1, subject2 as shown in the script.
*2.	The script merges the datasets aptly
*3.	Extracts the correct columns
*4.	Labels the dataset with descriptive variable names
*5.	Ensures that each variable forms a column
*6.	Ensures that each observation forms a row
*7.	And finally creates an independent tidy dataset


