This document describes the tidy data set submitted as part of the course project. 

Study Design
-------------

The tidy data set was created from the raw data from the 
link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
which has been provided on the course project page.

The tidy data set was created by running the script “run_analysis.R” on the raw data obtained 
from the link mentioned above. The algorithm of the script has been provided in the file- “README.md”.

Code Book
----------
This section describes the variables of the submitted tidy data set.

the tidy data set that has been submitted with the assignmnet has following variables(columns):

1.	subject_id
	This identifies the subject of the experiment, obtained from subject_(train|test).txt
2.	Activity
	This is the descriptive activity of the subject identified by the subject_id and is obtained by
	using activity_id of y_(train|test).txt indexed into activity_labels.txt
3.	The rest 66 variables contains means of  the following features of the merged train and test data 
	and grouped by <subject_id, activity>:
		* tBodyAcc-mean()-X
		* tBodyAcc-mean()-Y
		* tBodyAcc-mean()-Z
		* tBodyAcc-std()-X
		* tBodyAcc-std()-Y
		* tBodyAcc-std()-Z
		* tGravityAcc-mean()-X
		* tGravityAcc-mean()-Y
		* tGravityAcc-mean()-Z
		* tGravityAcc-std()-X
		* tGravityAcc-std()-Y
		* tGravityAcc-std()-Z
		* tBodyAccJerk-mean()-X
		* tBodyAccJerk-mean()-Y
		* tBodyAccJerk-mean()-Z
		* tBodyAccJerk-std()-X
		* tBodyAccJerk-std()-Y
		* tBodyAccJerk-std()-Z
		* tBodyGyro-mean()-X
		* tBodyGyro-mean()-Y
		* tBodyGyro-mean()-Z
		* tBodyGyro-std()-X
		* tBodyGyro-std()-Y
		* tBodyGyro-std()-Z
		* tBodyGyroJerk-mean()-X
		* tBodyGyroJerk-mean()-Y
		* tBodyGyroJerk-mean()-Z
		* tBodyGyroJerk-std()-X
		* tBodyGyroJerk-std()-Y
		* tBodyGyroJerk-std()-Z
		* tBodyAccMag-mean()
		* tBodyAccMag-std()
		* tGravityAccMag-mean()
		* tGravityAccMag-std()
		* tBodyAccJerkMag-mean()
		* tBodyAccJerkMag-std()
		* tBodyGyroMag-mean()
		* tBodyGyroMag-std()
		* tBodyGyroJerkMag-mean()
		* tBodyGyroJerkMag-std()
		* fBodyAcc-mean()-X
		* fBodyAcc-mean()-Y
		* fBodyAcc-mean()-Z
		* fBodyAcc-std()-X
		* fBodyAcc-std()-Y
		* fBodyAcc-std()-Z
		* fBodyAccJerk-mean()-X
		* fBodyAccJerk-mean()-Y
		* fBodyAccJerk-mean()-Z
		* fBodyAccJerk-std()-X
		* fBodyAccJerk-std()-Y
		* fBodyAccJerk-std()-Z
		* fBodyGyro-mean()-X
		* fBodyGyro-mean()-Y
		* fBodyGyro-mean()-Z
		* fBodyGyro-std()-X
		* fBodyGyro-std()-Y
		* fBodyGyro-std()-Z
		* fBodyAccMag-mean()
		* fBodyAccMag-std()
		* fBodyBodyAccJerkMag-mean()
		* fBodyBodyAccJerkMag-std()
		* fBodyBodyGyroMag-mean()
		* fBodyBodyGyroMag-std()
		* fBodyBodyGyroJerkMag-mean()
		* fBodyBodyGyroJerkMag-std()

	To maintain consistency, the names of the variables in the tidy data set have been kept same 
	as the names of the corresponding features from the merged train and test data, the difference 
	being that in the tidy data set the variable now store mean of the corresponding measurements 
	from the merged train and test data set - grouped by <subject_id, Activity> combination.
	
	Explaination of feature/variable names:
	
	In variable names are a combination of terms as follows:
	
	* first character 't' stands for time domain signals
	* first character 'f' stands for frequency domain signals
	* 'Body' stands for body component of the measurement
	* 'Gravity' stands for gravity part of the measurement
	* 'Jerk' stands for jerk signals
	* 'Acc' stands for acceleration measurement from accelerometer 
	* 'Gyro' stands for measurement from gyroscope
	* '-X', '-Y', '-Z' is used to denote 3-axial signals in the X, Y and Z directions directions.
	* 'Mag' is the magnitude of the three-dimensional signals calculated using the Euclidean norm
	* 'mean()' calculated mean of signal measurement
	* 'std()' calculated standard deviation of the signal measurment
	
	Thus for example the variable:
		*	'tGravityAcc-mean()-X' in the tidy data set is the mean(grouped by subject_id and Activity) of the 
			'mean of time domain gravity component of accelaration signal over the X-axis' 
			from the train-test data set.
		*	'fBodyAcc-mean()-X' in the tidy data set is the mean(grouped by subject_id and Activity)  of the 
			'mean of frequency domain body component of accelaration signal over the X-axis' 
			from the train-test data set.
		*	'tGravityAccMag-mean()' is the mean(grouped by subject_id and Activity)  of the 
			'magnitude(euclidean norm) of tGravityAcc-mean()-X,	tGravityAcc-mean()-Y and tGravityAcc-mean()-Z' 
			from the train-test data set
	
In a nutshell, the process for creating the tidy data set is as follows:

	1. 	Read the required data files (activity_labels.txt, subject_*.txt, X_*.txt, y_*.txt), where '*' stands for 'train' and 'test'
	2. 	Join subject_*.txt, X_*.txt, y_*.txt for each of train and test data sets, and then assign column names
	3. 	Then merge the data sets of step 2
	4.	Join data set of step 3 with activity_labels on activity id
	5. 	Subset the required columns(subject, activity and mean and std related columns from the data set obtained in step 4
	6.	create a tidy data by calculating mean each column, grouped by subject and activity, of the data set of step 5

The detailed algorithm has been provided in README.md
