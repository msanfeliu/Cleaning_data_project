#  CodeBook - Project_tidy


This code book describes the variables included in the data set **"Project_tidy"**, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

The dataset includes the following files:
- 'README.md':  general description of the project for the *"Getting and Cleaning Data"* course and all the details about the transformations done to the original data
- 'project_tidy.txt': data produced for this project.
- ´run_analysis.R´: the script used to transform the original data set to produce the dataset included in ´project_tidy.txt´
- ´CodeBook.md´: this file


###  About the original data

The original data was obtained by conducting the following experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Dataset: Project_tidy.txt

The project completed for the course "Getting and Cleaning Data" uses data collected from the accelerometers from the Samsung Galaxy S smartphone; data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data was transformed (using the run_analysis.R script) to produce a tidy data set.  To obtain this new data set,  provided the file *Project_tidy.txt* is stored in the working directory, the following R command can be used to retrieve it:
project_tidy<-read.table("project_tidy.txt", header=TRUE)

To produce the project_tidy data set, the following transformations were done to the original data set:
* 1. Merges the training and the test sets to create one data set.
* 2. Extracts only the measurements on the mean and standard deviation for each measurement
* 3. Uses descriptive activity names to name the activities in the data set
* 4. Appropriately labels the data set with descriptive variable names.
* 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
The project_tidy data set contains the following variables (see description below):  "subject", "activity", "feature",  "statistic", "X_time", "Y_time", "Z_time", "magnitude_time", "X_freq", "Y_freq", "Z_freq", and "magnitude_freq". 

The data set includes two observations per subject and activity, one corresponding to the "mean" and one for the "standar deviation";  for each feature, the x,y,z and total values are presented for both time and frequency domains

Please note: This might be considered "long" by some, because it does not have only one observation for each subject and activity, however, it is mentioned in the rubric that either long or wide form is acceptable. See
https://class.coursera.org/getdata-030/forum/thread?thread_id=107 for discussion"

 
### Variables:

subject (factor)
       An identifier of the subject who carried out the experiment.
 * 1 to 30
 
acticity   (factor)
* Walking
* Walking upstairs
* Walking downstairs
* Standing
* Sitting
* Lying

feature    (factor)
* Body acceleration        Triaxial acceleration from the accelerometer
* Body angular velocity    Triaxial Angular velocity from the gyroscope
* Body acceleration jerk   Jerk singnals (linear acceleration derived in time)
* Body angular velocity jerk           Jerk singnals (angular velocity derived in time)
* Gravity acceleration         The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

statistic  (factor)
       This variable identifies the type of statistic includen in the rest of variables, below
       
* mean
* sd

Note:  For all the variables described below, variables represent the average of indiviual records included in the original data sets, which are normalized and bounded within [-1,1].

X_time   (numeric)
      The average for the acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

Y_time    (numeric)
      The average for the acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'. 

Z_time  (numeric)
      The average for the acceleration signal from the smartphone accelerometer Z axis in standard gravity units 'g'. 

magnitude_time   (numeric)
       The estimated magnitud from the X-Y and X measurementes, in standard gravity units 'g'.

X_freq   (numeric)
      The average for angular velocity vector measured by the gyroscope X axis in radians/second. 

Y_freq    (numeric)
      The average for angular velocity vector measured by the gyroscope Y axis in radians/second. 

Z_freq  (numeric)
      The average for angular velocity vector measured by the gyroscope Z axis in radians/second. 

magnitude_freq   (numeric)
       The estimated magnitud from the X-Y and X measurementes, iin radians/second.



### Transformations and work done on the original data

 
 
###  Source of original data

Authors:

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine*. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
