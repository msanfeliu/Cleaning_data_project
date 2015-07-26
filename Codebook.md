#  CodeBook - Project_tidy


This code book describes the variables included in the data set **"Project_tidy"**, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 

codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?

###  xxx

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws



### Dataset: Project_tidy.txt

To obtain the data for this prooject, provided the file *Project_tidy.txt* is stored in the working directory,
the following R command can be used to retrieve it:
project_tidy<-read.table("project_tidy.txt", header=TRUE)
 
### Variables:

subject
 * 1 to 30
 
acticity   (factor)
* Walking
* Walking upstairs
* Walking downstairs
* Standing
* Sitting
* Lying

feature    (factor)
* Body acceleration        
* Body acceleration jerk    
* Body angular velocity   
* Body angular velocity jerk                 
* Gravity acceleration    

statistic  (factor)

       This variable identifies the type of statistic includen in the rest of variables, below
       
* mean
* sd

Note:  For all the variables described below, variables represente the average of indiviual records included in the original data sets, which are normalized and bounded within [-1,1].

X_time
  The mean for the acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

Y_time

  The acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'. 

Z_time

  The acceleration signal from the smartphone accelerometer Y axis in standard gravity units 'g'. 

magnitude_time
 The estimated magnitud fromt the X-Y and X measurementes from acceleration signal from the smartphone accelerometer,
 in standard gravity units 'g'.




###  Obtaining the original data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The project completed for the course "Getting and Cleaning Data" uses data collected from the accelerometers from the Samsung Galaxy S smartphone; data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Variables


### Original data



### Transformations and work done on the original data
 a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
 
 
###  Source of original data

Authors:

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Publication:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. *Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine*. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
