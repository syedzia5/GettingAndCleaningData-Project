run_analysis <- function() {
### load the data.table and sqldf packages
	if("data.table" %in% rownames(installed.packages()) == FALSE)
	{
		install.packages("data.table")
	}
	require(data.table)
	if("sqldf" %in% rownames(installed.packages()) == FALSE)
	{
		install.packages("sqldf")
	}	
	require(sqldf)
	
	message ("\n\nStart reading data from data files\n\n")
	
### Read the data from the respective files, will be reading only X & y data from train and test
	activity_labels <- read.table("activity_labels.txt") ### read the activity labels
	colnames(activity_labels) <- c("activity-id", "Activity")

	features <- read.table("features.txt") ### read the features list
	message ("Finished reading activity labels and features\n")
	
### Read the train data
	X_train <- read.table("train/X_train.txt")
	y_train <- read.table("train/y_train.txt")
	subject_train <- read.table("train/subject_train.txt")
	
	message("Finished reading train data\n")

### Assign the feature names as labels for the columns of the X data, 
### activity-id as column name for y data and subject_id as colname for subjects data.
### The feature names themselves as descriptive hence I am not trying to 
### make them more descriptive as this would make them quite long(like
### I am not trying to replace 't' by 'Time' or 'f' by 'Fourier Transform', etc.
	colnames(X_train) <- features$V2
###	colnames(X_train)
	colnames(y_train) <- c("activity-id")
###	colnames(y_train)
	colnames(subject_train) <- c("subject_id")
	message("Column names assigned to train data\n")
	
### Column bind the subject, X and y data
	X_train_y = cbind(subject_train, X_train, y_train)
	message("merged train:<Subject, X and y> in a single table\n")

### Read the test data
	X_test <- read.table("test/X_test.txt")
	y_test <- read.table("test/y_test.txt")
	subject_test <- read.table("test/subject_test.txt")
	message("Finished reading test data\n")

### Assign the feature names as labels for the columns of the X data, 
### activity-id as column name for y data and subject_id as colname for subjects data
### The feature names themselves as descriptive hence I am not trying to 
### make them more descriptive as this would make them quite long(like
### I am not trying to replace 't' by 'Time' or 'f' by 'Fourier Transform', etc.
	colnames(X_test) <- features$V2
	colnames(y_test) <- c("activity-id")
	colnames(subject_test) <- c("subject_id")
	message("Column names assigned to test data\n")

### Column bind the X and y data
	X_test_y = cbind(subject_test, X_test, y_test)
	message("merged test:<Subject, X and y> in a single table\n")
	
### Merge the train and test data. I am assuming that test data is to be 
### row-appended to the train data as this seems to be locical.
	train_test <- rbind(X_train_y, X_test_y)
	message ("Finished merging train and test data\n")
	
### Create column-names vector to subset the data, basically those column names 
### to be in the vector which end with std() or mean() as per point number 2 in project desc.
### [2. Extracts only the measurements on the mean and standard deviation for each measurement. ]
	subset_col_names <- c("subject_id", grep("(std|mean)\\(\\)", names(train_test), value = TRUE), "activity-id")
	message("subset colnames condition created for subsetting std and mean measurement columns\n")
	
### subset data from the merged train and test data, based on the subset column vector 'subset_col_names'
	train_test_std_mean <- train_test[subset_col_names]
	message("subsetted std and mean measurements from the main data set\n")
	
### convert the required data frames to data table so that some sql type queries can be done
### to join the train-test data and activity labels based on the activity id so that in 
### in the final result we can see the descriptive activity lables instead of 
### of the integer activity-id
	ttsm <- as.data.table(train_test_std_mean)
	activity_labels_dt <- as.data.table(activity_labels)
	message("Created data tables from subsetted data and activity labels data\n")
	
### fire  the join sql query on the data tables created
	fttsm <- sqldf("select t.*,a.Activity  from ttsm t, activity_labels_dt a where t.'activity-id' = a.'activity-id'")
	message("joined subsetted data table and activity_labels data table on activity-id\n") 

### calculate mean(average) of the measurements  
	fttsm_mean <- aggregate(fttsm[,2:67],by=list(subject_id = fttsm$subject_id, Activity = fttsm$Activity),FUN=mean)
	message("Calculated mean of the subsetted measurments(std and mean) grouped by subject(subject_id) and activity\n")
	
### I beleive the data set obtained above is tidy since:
### 		(a) each variable has its own column (subject-id, activity, and each 
###				measurment's mean have their own column)
###			(b) each observation forms a row (the combination of <subject-id, activity, 
###				set of mean of measurements> form a row
###			(c) each type of observational unit forms a table ( the data set is mean of 
###				measurements for a combination of <subject-id, activity>
### hence export the data set obtained above as 'fttsm_mean' in a csv file(easy to read in MS-Excel) 
### and as normal text file with fields seperated by space

	write.table(fttsm_mean, file = "mean_of_train_test_std_mean_tidy_data.csv",sep = ",", row.names = FALSE)
	message ("created mean_of_train_test_std_mean_tidy_data.csv\n")
	
	write.table(fttsm_mean, file = "mean_of_train_test_std_mean_tidy_data.txt",row.names = FALSE)
	message ("created mean_of_train_test_std_mean_tidy_data.txt\n")
}