  The code details the steps needed to do this project. Please see the code (run_analysis.R) which is annotated to describe each step in detail.
  
  Step 1. Briefly, the code downloads and unzips the files, reads in the files, joins files together to add the subject, activity, (and group, if wanted) columns to the two main (training and test) data sets. These two large data sets are then combined into one big data set. The header is assembled by adding on subject, group, and activity to those in the features.txt file and then assigned to the data set. 
  Step 2. Those columns that relate to the averages and standard deviations of measurements in the data set are extracted. 
  Step 3. The activity labels file is then merged with the main dataset file and the numeric coding for activity is thereby replaced with desciptive words. 
  Step 4. The variable names (column names) are then cleaned up by removing hyphens, removing typos, and expanding abbreviations to make clear, descriptive (and hopefully, not too long!) names. 
  Step 5. Finally, a new tidy data set is constructed with the average means and standard deviations for the measurements made for each subject during each activity. 
  
  The units for variables related to acceleration (Acc) are "g", the standard gravity unit. The units related to the angular velocity vector measured by the gyroscope (Gyro) are radians/second. 
  
  The average mean and standard deviations for each subject performing each of the six activities are of the following variables:
  
  timedomainBodyAccMean()X, Y, and Z axes           (3 separate variables)
  
  timedomainGravityAccMean()X, Y, and Z axes        (3 separate variables)
  
  timedomainBodyAccJerkMean()X, Y, and Z axes       (3 separate variables)
  
  timedomainBodyGyroMean()X, Y, and Z axes          (3 separate variables)
  
  timedomainBodyGyroJerkMean()X, Y, and Z axes      (3 separate variables)
  
  timedomainBodyAccMagnitudeMean()
  
  timedomainGravityAccMagnitudeMean()
  
  timedomainBodyAccJerkMagnitudeMean()
  
  timedomainBodyGyroMagnitudeMean()
  
  timedomainBodyGyroJerkMagnitudeMean()
  
  frequencydomainBodyAccMean()X, Y, and Z axes        (3 separate variables)
  
  frequencydomainBodyAccJerkMean()X, Y, and Z axes    (3 separate variables)
  
  frequencydomainBodyGyroMean()X, Y, and Z axes       (3 separate variables)
  
  frequencydomainBodyAccMagnitudeMean()
  
  frequencydomainBodyAccJerkMagnitudeMean()
  
  frequencydomainBodyGyroMagnitudeMean()
  
  frequencydomainBodyGyroJerkMagnitudeMean()
  
  The original README.TXT and features_info.txt files are attached below as this readme file is a modification of these.
  
  
  
  ==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'


  
