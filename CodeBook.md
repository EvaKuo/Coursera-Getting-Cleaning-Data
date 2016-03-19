  The code details the steps needed to download and unzip the files, read in the files, join files together to add the subject, activity, (and group, if wanted) columns to the two main (training and test) data sets. These two large data sets are then combined into one big data set. The header is assembled by adding on subject, group, and activity to those in the features.txt file and then assigned to the data set. 
  Those columns that relate to the averages and standard deviations of measurements in the data set are extracted. 
  The activity labels file is then merged with the main dataset file and the numeric coding for activity is thereby replaced with desciptive words. 
  The variable names (column names) are then cleaned up by removing hyphens, removing typos, and expanding abbreviations to make clear, descriptive (and hopefully, not too long!) names. 
  Finally, a new tidy data set is constructed with the average means and standard deviations for the measurements made for each subject during each activity. 
  
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
