#  CodeBook - Project_tidy


This code book describes the variables included in the data set "Project_tidy", the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 


### Dataset: Project_tidy.txt

To obtain the data for this prooject, provided the file Project_tidy.txt is stored in the working directory,
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

domain    (factor)
* time
* frequency
* 

statistic
* mean
* sd


X
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   
   -0.9968 -0.9716 -0.3708 -0.3932 -0.0262  0.9745     360 

Y
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   
   -0.9971 -0.9536 -0.3164 -0.4369 -0.0390  0.9566     360 

Z
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
   
   -0.9954 -0.9564 -0.4176 -0.4704 -0.0675  0.9579     360

magnitude
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 

-0.9977 -0.9654 -0.7997 -0.6201 -0.3050  0.6446 

###  Obtaining the original data

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The project completed for the course "Getting and Cleaning Data" uses data collected from the accelerometers from the Samsung Galaxy S smartphone; data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Variables


### Original data



### Transformations and work done on the original data
 a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
 
 


 
