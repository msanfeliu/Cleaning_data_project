## run_analysis.R
### Getting and Cleaning Data course Project


### Get data

##  data was obtained from 
##   
##  The unzipped files (folder) were placed in the working directory

## 30 subjects participated in the experiment

###  get training set

labels<- read.delim("UCI HAR Dataset/features.txt", header=FALSE)[,1]


## 21 subjects participated in the experiment - training
## 

    x_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"")
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"")
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")
    
    ## label columns

    colnames(x_train)<-labels
    names(y_train)<-c("activity")
    names(subject_train)<-c("Subject")

    # combine above data.frames
    
    train_set<- cbind(subject_train,y_train, x_train )

    ### Add a variable indicating it refears to the "train set"
    train_set$Set<-"Training"
    
    
### get test set
## 9 subjects participated in the experiment - test
## 

    x_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"")
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"")
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")

    ## label columns
    
    names(y_test)<-c("activity")
    names(subject_test)<-c("Subject")
    colnames(x_test)<-labels

    # combine previous data.frames
    
    test_set<- cbind(subject_test, y_test, x_test )

    ### Add a variable indicating it refears to the "test set"
    test_set$Set<-"Test"
    
  
    
##  merge training and test set to create one data set

### Observations from each set will be identified by the Type variable ("Test" or "Training") 
### to keep track where they came from


full_set<- rbind(test_set, train_set)

###   Extracts only the measurements on the mean and standard deviation for each measurement. 
###  I chose to include only the columns with the words "mean()" or "std()" in them

extracted_set<- full_set[, grep("(Subject|activity|Set|mean\\(\\)|std\\(\\))", colnames(full_set), ignore.case = FALSE)]

### Uses descriptive activity names to name the activities in the data set

### Note: this will be done later

### Appropriately labels the data set with descriptive variable names. 

names(extracted_set)<- 
  c( "subject", "activity",
     "Body_Acceleration-mean-X_time_domain",      
     "Body_Acceleration-mean-Y_time_domain",  
     "Body_Acceleration-mean-Z_time_domain",  
     "Body_Acceleration-std-X_time_domain",      
     "Body_Acceleration-std-Y_time_domain",  
     "Body_Acceleration-std-Z_time_domain",  
     "Gravity_Acceleration-mean-X_time_domain",
     "Gravity_Acceleration-mean-Y_time_domain",
     "Gravity_Acceleration-mean-Z_time_domain",
     "Gravity_Acceleration-std-X_time_domain",
     "Gravity_Acceleration-std-Y_time_domain",
     "Gravity_Acceleration-std-Z_time_domain",
     "Body_Acceleration_Jerk_mean-X_time_domain",
     "Body_Acceleration_Jerk_mean-Y_time_domain",
     "Body_Acceleration_Jerk_mean-Z_time_domain",
     "Body_Acceleration_Jerk_std-X_time_domain",
     "Body_Acceleration_Jerk_std-Y_time_domain",
     "Body_Acceleration_Jerk_std-Z_time_domain",
     "Body_Angular_Velocity-mean_X_time_domain",
     "Body_Angular_Velocity-mean_Y_time_domain",
     "Body_Angular_Velocity-mean_Z_time_domain",
     "Body_Angular_Velocity-std_X_time_domain",
     "Body_Angular_Velocity-std_Y_time_domain",
     "Body_Angular_Velocity-std_Z_time_domain",
     "Body_Angular_Velocity_Jerk_mean-X_time_domain",
     "Body_Angular_Velocity_Jerk_mean-Y_time_domain",
     "Body_Angular_Velocity_Jerk_mean-Z_time_domain",
     "Body_Angular_Velocity_Jerk_std-X_time_domain",
     "Body_Angular_Velocity_Jerk_std-Y_time_domain",
     "Body_Angular_Velocity_Jerk_std-Z_time_domain",
     "Estimated_Body_Acceleration_mean_time_domain" ,     
     "Estimated_Body_Acceleration_std_time_domain",   
     "Estimated_Gravity_Acceleration_mean_time_domain",      
     "Estimated_Gravity_Acceleration_std_time_domain", 
     "Estimated_Body_Acceleration_Jerk_mean_time_domain",      
     "Estimated_Body_Acceleration_Jerk_std_time_domain", 
     "Estimated_Body_Angular_Velocity_mean_time_domain" ,     
     "Estimated_Body_Angular_Velocity_std_time_domain",  
     "Estimated_Body_Angular_Velocity_Jerk_mean_time_domain",
     "Estimated_Body_Angular_Velocity_Jerk_std_time_domain",      
     "Body_Acceleration-mean-X_frequency_domain",      
     "Body_Acceleration-mean-Y_frequency_domain",  
     "Body_Acceleration-mean_Z_frequency_domain",  
     "Body_Acceleration-std_X_frequency_domain",      
     "Body_Acceleration-std-Y_frequency_domain",  
     "Body_Acceleration-std-Z_frequency_domain",  
     "Body_Acceleration_Jerk_mean-X_frequency_domain",
     "Body_Acceleration_Jerk_mean-Y_frequency_domain",
     "Body_Acceleration_Jerk_mean-Z_frequency_domain",
     "Body_Acceleration_Jerk_std-X_frequency_domain",
     "Body_Acceleration_Jerk_std-Y_frequency_domain",
     "Body_Acceleration_Jerk_std-Z_frequency_domain",
     "Body_Angular_Velocity-mean_X_frequency_domain",
     "Body_Angular_Velocity-mean_Y_frequency_domain",
     "Body_Angular_Velocity-mean_Z_frequency_domain",
     "Body_Angular_Velocity-std_X_frequency_domain",
     "Body_Angular_Velocity-std_Y_frequency_domain",
     "Body_Angular_Velocity-std_Z_frequency_domain",
     "Estimated_Body_Acceleration_mean_frequency_domain",      
     "Estimated_Body_Acceleration_std_frequency_domain",  
     "Estimated_Body_Acceleration_Jerk_mean_frequency_domain",     
     "Estimated_Body_Acceleration_Jerk_std_frequency_domain",
     "Estimated_Body_Angular_Velocity_mean_frequency_domain",      
     "Estimated_Body_Angular_Velocity_std_frequency_domain",  
     "Estimated_Body_Angular_Velocity_Jerk_mean_frequency_domain",     
     "Estimated_Body_Angular_Velocity_Jerk_std_frequency_domain",
     "set")          
     

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject


library(dplyr)
library(tidyr)
library(reshape2)


melted_set<-melt(extracted_set, id=c("subject", "activity","set"), na.rm=TRUE, value.name="value")

melted_set<- tbl_df(melted_set)
melted_set$set<-as.factor(melted_set$set)
melted_set$subject<-as.factor(melted_set$subject)
melted_set$activity<-as.character(melted_set$activity)

tidy_melt<- 
  melted_set %>%
  group_by(subject,activity, set, variable) %>%
  summarize(average=mean(value)) %>%
  mutate(feature="") %>%
  mutate(statistic="") %>%
  mutate(measurement="") %>%
  mutate(domain="")

for(i in 1:nrow(tidy_melt)){
    if(grepl("Body_Acceleration",          tidy_melt$variable[i])) tidy_melt$feature[i]<-"Body acceleration"
    if(grepl("Gravity_Acceleration",       tidy_melt$variable[i])) tidy_melt$feature[i]<-"Gravity acceleration"
    if(grepl("Body_Acceleration_Jerk",     tidy_melt$variable[i])) tidy_melt$feature[i]<-"Body acceleration jerk"
    if(grepl("Body_Angular_Velocity",      tidy_melt$variable[i])) tidy_melt$feature[i]<-"Body angular velocity"
    if(grepl("Body_Angular_Velocity_Jerk", tidy_melt$variable[i])) tidy_melt$feature[i]<-"Body angular velocity jerk"

     if(grepl("mean",tidy_melt$variable[i])) tidy_melt$statistic[i]<-"mean"
     if(grepl("std",tidy_melt$variable[i])) tidy_melt$statistic[i]<-"standard deviation"  

     if(grepl("X",tidy_melt$variable[i])) tidy_melt$measurement[i]<-"X direction"
     if(grepl("Y",tidy_melt$variable[i])) tidy_melt$measurement[i]<-"Y direction"
     if(grepl("Z",tidy_melt$variable[i])) tidy_melt$measurement[i]<-"Z direction"
     if(grepl("Estimated",tidy_melt$variable[i])) tidy_melt$measurement[i]<-"magnitude"

     if(grepl("time",tidy_melt$variable[i])) tidy_melt$domain[i]<-"time"
     if(grepl("freq",tidy_melt$variable[i])) tidy_melt$domain[i]<-"frequency"
    
     if(grepl("1",tidy_melt$activity[i])) tidy_melt$activity[i]<-"1. Walking"    
     if(grepl("2",tidy_melt$activity[i])) tidy_melt$activity[i]<-"2. Walking upstairs"
     if(grepl("3",tidy_melt$activity[i])) tidy_melt$activity[i]<-"3. Walking downstairs"
     if(grepl("4",tidy_melt$activity[i])) tidy_melt$activity[i]<-"4. Sitting"
     if(grepl("5",tidy_melt$activity[i])) tidy_melt$activity[i]<-"5. Standing"      
     if(grepl("6",tidy_melt$activity[i])) tidy_melt$activity[i]<-"6. Laying"

}

tidy_melt$feature<-as.factor(tidy_melt$feature)
tidy_melt$statistic<-as.factor(tidy_melt$statistic)
tidy_melt$measure<-as.factor(tidy_melt$measure)
tidy_melt$domain<-as.factor(tidy_melt$domain)
tidy_melt$activity<-as.factor(tidy_melt$activity)

tidy_melt<-select(tidy_melt, subject, activity, set, feature,measurement, statistic, average)

####  save data set as a txt file using  write.table() using row.name=FALSE 

write.table(tidy_melt, file = "tidy_melt.txt", row.names = FALSE)

## the table is saved in the working directory, to read it back use
## read.table("tidy_melt.txt")


