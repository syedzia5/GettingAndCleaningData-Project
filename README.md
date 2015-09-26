# GettingAndCleaningData-Project
Contains project deliverables for the course - "Getting and Cleaning Data" of Coursera - John Hopkins Data Science Certification

The deliverables for this project include following:

1. This readme.md file which describes the run_analysis.R script in the next section
2. run_analysis.R
3. code_book.md which describes the tidy data set created as part of the project
4. The tidy data set itself: mean_of_train_test_std_mean_tidy_data.txt

run_analysis.R
--------------------
This script creates a tidy set from the data obtained from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
as per the following steps mentioned on the project page:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

package requirements:
---------------------
Apart from the base packages, the script requires following packages:

1. data.table
2. sqldf

The script checks if the above mentioned packages are available and if they are not availabe 
then it gets them, installs them and loads them. Hence while running the script internet 
connection should be available

Installation:
--------------
The script needs to installed and loaded from the "UCI HAR Dataset" directory or a directory that contains
following project related data:

1. The directory "train"
	The "train" directory should contain following files:
	(a) subject_train.txt
	(b) X_train.txt
	(c) y_train.txt
2. The directory "test"
	The "test" directory should contain following files:
	(a) subject_test.txt
	(b) X_test.txt
	(c) y_test.txt
3. Following files:
	(a) activiy_labels.txt
	(b) features.txt

Parameters:
------------
The script doesn't take any parameters. It is assumed it will be installed and run from a directory
as described in the Installation section above.

Process:
--------

The process for creating the data is as follows:

1. Check if data.table and sqldf packages are installed, if not installed then get and install, load them
2. Read the data files mentioned in the Installation section
3. Assign features mentioned in features.txt as column names of the data read from X_(train|test).txt
4. Assign "subject_id" as column name for the data read from subject_(train|test).txt
5. Assign "activity-id" as column name to the data read from y_(train|test).txt
6. Assign "activity-id" and "Activity" as column names to the data read from activity_labels.txt
7. Join the data from from subject_(train|test).txt, X_(train|test).txt, y_(train|test).txt
   into single joined train and test data sets.
   These data sets will have following column(names) in that order:
   (a) subject_id
   (b) columns with names as the features mentioned in the features.txt in the order as they appear in features.txt
   (c) activity_id
   
8. Merge the joined train and test data sets into a single data sets
9. From the merged data set of step 8, subset the following columns into another data set:
	(a) subject_id
	(b) columns that contain "std()" and "mean()" in their names, eg.tBodyAcc-std()-Z, tBodyAcc-mean()-Z, etc.
	(c) activity_id
10. create data table from the the subset data set of step 9 and data set from activity_labels.txt
11. join the data tables of step 10 using the following sql query:
	sqldf("select t.*,a.Activity  from ttsm t, activity_labels_dt a where t.'activity-id' = a.'activity-id'")
12. Calculate the mean of each column grouped by subject_id and activity
13. export the data set obtained in step 12 to a file named "mean_of_train_test_std_mean_tidy_data.txt"

Output:
==========

A file named "mean_of_train_test_std_mean_tidy_data.txt" that containes the tidy data set of means
of the 'mean' and 'standard deviation' related measurements, grouped by subject(subject_id) and activity.

