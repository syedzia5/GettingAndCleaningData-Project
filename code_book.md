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
		1.	tBodyAcc-mean()-X
		2.	tBodyAcc-mean()-Y
		3.	tBodyAcc-mean()-Z
		4.	tBodyAcc-std()-X
		5.	tBodyAcc-std()-Y
		6.	tBodyAcc-std()-Z
		7.	tGravityAcc-mean()-X
		8.	tGravityAcc-mean()-Y
		9.	tGravityAcc-mean()-Z
		10.	tGravityAcc-std()-X
		11.	tGravityAcc-std()-Y
		12.	tGravityAcc-std()-Z
		13.	tBodyAccJerk-mean()-X
		14.	tBodyAccJerk-mean()-Y
		15.	tBodyAccJerk-mean()-Z
		16.	tBodyAccJerk-std()-X
		17.	tBodyAccJerk-std()-Y
		18.	tBodyAccJerk-std()-Z
		19.	tBodyGyro-mean()-X
		20.	tBodyGyro-mean()-Y
		21.	tBodyGyro-mean()-Z
		22.	tBodyGyro-std()-X
		23.	tBodyGyro-std()-Y
		24.	tBodyGyro-std()-Z
		25.	tBodyGyroJerk-mean()-X
		26.	tBodyGyroJerk-mean()-Y
		27.	tBodyGyroJerk-mean()-Z
		28.	tBodyGyroJerk-std()-X
		29.	tBodyGyroJerk-std()-Y
		30.	tBodyGyroJerk-std()-Z
		31.	tBodyAccMag-mean()
		32.	tBodyAccMag-std()
		33.	tGravityAccMag-mean()
		34.	tGravityAccMag-std()
		35.	tBodyAccJerkMag-mean()
		36.	tBodyAccJerkMag-std()
		37.	tBodyGyroMag-mean()
		38.	tBodyGyroMag-std()
		39.	tBodyGyroJerkMag-mean()
		40.	tBodyGyroJerkMag-std()
		41.	fBodyAcc-mean()-X
		42.	fBodyAcc-mean()-Y
		43.	fBodyAcc-mean()-Z
		44.	fBodyAcc-std()-X
		45.	fBodyAcc-std()-Y
		46.	fBodyAcc-std()-Z
		47.	fBodyAccJerk-mean()-X
		48.	fBodyAccJerk-mean()-Y
		49.	fBodyAccJerk-mean()-Z
		50.	fBodyAccJerk-std()-X
		51.	fBodyAccJerk-std()-Y
		52.	fBodyAccJerk-std()-Z
		53.	fBodyGyro-mean()-X
		54.	fBodyGyro-mean()-Y
		55.	fBodyGyro-mean()-Z
		56.	fBodyGyro-std()-X
		57.	fBodyGyro-std()-Y
		58.	fBodyGyro-std()-Z
		59.	fBodyAccMag-mean()
		60.	fBodyAccMag-std()
		61.	fBodyBodyAccJerkMag-mean()
		62.	fBodyBodyAccJerkMag-std()
		63.	fBodyBodyGyroMag-mean()
		64.	fBodyBodyGyroMag-std()
		65.	fBodyBodyGyroJerkMag-mean()
		66.	fBodyBodyGyroJerkMag-std()

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
