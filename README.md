# README 
Cleaning_data_project

### Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
The project completed for the course "Getting and Cleaning Data" uses data collected from the accelerometers from the Samsung Galaxy S smartphone; data was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Files in this repository

This repository contains the required project files:

- **run_analysis.R**:  
This file contains an R script that does the following. 
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement 
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names
* 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


- **CodeBook.rm**: 
This file includes a description of the original data, the transformations done to produce a tidy data set (project_tidy.txt) , and the complete description of the variables included in the final tidy data set

- **README.rm**: 
This file includes general description of that has been done and what is included in this repository.

### Original data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The original data was obtained by conducting the following experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Transformations done on the original data

The project completed for the course "Getting and Cleaning Data" uses data collected from the accelerometers from the Samsung Galaxy S smartphone; data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The unzipped files (folder) were placed in the working directory

Data was transformed (using the run_analysis.R script) to produce a tidy data set.  

To produce the project_tidy data set, the following transformations were done to the original data set:

##### Step 1. Getting and joining data sets

The first activity was to obtain both sets of data: training and test data sets

30 individuals participated in the esperiment: 21 subjects participated in the experiment - training and 9 subjects participated in the experiment - test

For each of those sets, I had to read 3 separate data pieces, and, after labeling the columns with appropriate names, the three pieces were combined by joining columns; an additional varible "set" was added to keep track of the source.  Two temporary sets were created:
**train test_set** (with 2947 observations of 564 variables) and **train_set** (with 7352 observations of 564 variables), respectively.

The two sets were joined to create a complete set: **full_set**  (with 10299 observations of 564 variables)
Each record contains information for each combination of subject, activity of a repeted series of readings of each of 561 variables (the other three variables are subject, activity and set).
   
##### Step 2. Extracting only the measurements on the mean and standard deviation for each measurement. 

I chose to include only the columns with the words "mean()" or "std()" in them.

I created a new data set: **extracted_set** with 10299 observations with 69 variables (66 with measured data plus ID variables for subject, activity and set)

##### Step 3. Use descriptive activity names to name the activities in the data set

Note: this step was performed later, when other variables and contents were given descriptive names


##### Step 4. Appropriately labels the data set with descriptive variable names

The 66 variables corresponing to the measurements were given descriptive names that included the following characteristics:
* Type of feature: "Body_acceleration", "Gravity_Acceleration",  "Body_Acceleration_Jerk",  "Body_Angular_Velocity", and "Body_Angular_Velocity_Jerk"
* Axis: "X", "Y", "Z" or "magnitude" (when the value is an estimation form the XYZ values)
* Domain: "time" or "frequency" 
* Statistic: "mean" or "std" (standard deviation)

##### Step 5:  Creates a second, independent tidy data set with the average of each variable for each activity and each subject

I used features included in the following R libraries: dplyr, tidyr and reshape2

First, I **melted** the extracted_set so as to have one type of variable per for each subject and activity.
The resulting **melted_set** has 679,734 for 5 variables (subject, activity, set + variable and value)
The variable **variable** is a factor variable with each option beeing one of the descriptive names of the measures.

I change the subject, activity and set variables to be factors.

Second, I grouped the data by subject, activity, set and variable.  With this, I summarized the data by calculated the average **value** for each subject, activity and variable group: this was stored in a new variable named **average**

Lastly, I created additional factor variables, empty at this point, to include each of the characteristics of the "variable": feature, statistic, measurement and domain.  
I stored the resulting dataset as **melted_set**. This has 11,880 observations and 8 variables: "subject", "activity", "set", "feature", "domain", "statistic", "measurement" and "average".

Each variable was assigned a descriptive label equivalent to the feature it represented. For example:
* activity: "Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing" and "Laying".
* feature: "Body acceleration", "Gravity acceleration", "Body acceleration jerk", "Body angular velocity" and "Body angular velocity jerk"
* domain: "time" and "frequency"
* statistic: "mean" or "std"
* measurement: "X", "Y", "Z" or "magnitude"

The tidy_melt data set is the long form as mentioned in the rubric as either long 
or wide form is acceptable, see https://class.coursera.org/getdata-030/forum/thread?thread_id=107 for discussion"

However, I have reduced this long to a sort of "wide" form, to include one observation per subject and activity but by type of "statistic": mean or standar deviation; that is, for each feature, the x,y,z and total values are presented for both time and frequency domains.  In sum: there are 2 observations per subject and activity, one for "means" and one for "standard deviarions"

The resulting data set is **tidy_cast**, which has 1,800 observations with 12 variables: 
The project_tidy data set contains the following variables:  "subject", "activity", "feature",  "statistic", "X_time", "Y_time", "Z_time", "magnitude_time", "X_freq", "Y_freq", "Z_freq", and "magnitude_freq". 

The data set includes two observations per subject and activity and feature, one corresponding to the "mean" and one for the "standar deviation";  for each feature, the x,y,z and total values are presented for both time and frequency domains


30 subjects x 6 activitiesx x 5 features x 2 observations = 1,800 observations.

Now, there are more than one observation per subject and activity, so it is still sort of a "long" form since there is more than one observation per subject per activity, however, it is a tidy set: each variable that was measured is in one column, 
and each different observation of that variable is in a different row.

#####  Final step: save data set as a txt file using  write.table() using row.name=FALSE 

To complete the assingnment, the tidy_cast data set was saved as a text file to be uploaded, as required. This file was named **project_tidy.txt**, it was saved in the working directory.
 

Please note: This might be considered "long" by some, because it does not have only one observation for each subject and activity, however, it is mentioned in the rubric that either long or wide form is acceptable. See
https://class.coursera.org/getdata-030/forum/thread?thread_id=107 for discussion"

To obtain this new data set,  provided the file *Project_tidy.txt* is stored in the working directory, the following R command can be used to retrieve it:
project_tidy<-read.table("project_tidy.txt", header=TRUE)


________________________________________________


