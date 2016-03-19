        #  download files from internet and unzip
        ProjectUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(ProjectUrl, destfile = "./project.zip", method = "curl")
        unzip("project.zip", exdir = "project")   #downloads files
        
        #  read tables from the “test” group into working directory
Xtest <- read.table("./project/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
        ##   str(Xtest)   is a data.frame with 2947 observations of 561 variables
testactivity <- read.table("./project/UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
        ##  str(testactivity)   is a data.frame with 2947 observations of 1 variable. YAY!! Same number of observations!
testsubject <- read.table("./project/UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
        ##  str(testsubject)  is a data.frame with 2947 observations of 1 variable. YAY!! Same number of observations!
        
        #  library plyr and make a column that these data are from the “test” group.
        #  I did this so that no info will be lost if it becomes necessary later.
library(plyr)
testsubject <- mutate(testsubject, group = "test")
        
        #  add the subject and activity columns to the big test dataset
Test <- cbind(testsubject, testactivity, Xtest)
        ##  str(Test)  is a data.frame with 2947 observations of 564 variables. YAY!! Subject, group, and activity columns added!
        
        #  read tables from the "training" group into working directory
        
Xtrain <- read.table("./project/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
        ##  str(Xtrain)  is a data.frame with 7352 observations of 561 variables
trainactivity <- read.table("./project/UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
        ##  str(trainactivity)   is a data.frame with 7352 observations of 1 variable. YAY!!
trainsubject <- read.table("./project/UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
        ##  str(trainsubject)  is a data.frame with 7352 observations of 1 variable. YAY!!
        
        #  make a column that these data are from the "training" group.
        #  I did this so that no info will be lost if it becomes necessary later.
trainsubject <- mutate(trainsubject, group = "training")
        
        #  add the subject and activity columns to the big test dataset
Train <- cbind(trainsubject, trainactivity, Xtrain)
        ##  str(Train)   is a data.frame with 7352 observations of 564 variables. YAY!! Subject, group, and activity columns added!
        
        #  connect the two datasets
alldata <- rbind(Test, Train)
        ##  str(alldata)  is a data.frame with 10299 observations of 564 variables. YAY!!
        #  read in file with variable names, take a look at it, delete unwanted column, and add "subject", "group" and "activity" variables.
features <- read.table("./project/UCI HAR Dataset/features.txt", sep = "", header = FALSE, stringsAsFactors = FALSE)
        ##  str(features) is a data.frame with 561 observations of 2 variable
names <- features[, 2]
v1 <- c("subject", "group", "activity")
v2 <- c(v1, names)
names(alldata) <- v2
        ##  head(alldata)   YAY!! Has a proper header!
        
        #  get only columns with means and std devs of measured data, while including “subject”, “group”, “activity”
means <- grep("mean()", v2, value = TRUE, fixed = TRUE)
stdevs <- grep("std()", v2, value = TRUE, fixed = TRUE)
selectdata <- alldata[, c("subject", "group", "activity", c(means, stdevs))]
        ##  str(selectdata) is a data.frame with 10299 observations of 69 variables. YAY!!
library(dplyr)        
        #  download activity labels file and replace number coding for "activity" with words
activitylabels <- read.table("./project/UCI HAR Dataset/activity_labels.txt")
names(activitylabels) <- c("number", "activity")
selectdata2 <- merge(activitylabels, selectdata, by.x = "number", by.y = "activity", all = TRUE)
selectdata3 <- select(selectdata2, -number)  ## this removes the extra unwanted column
        
        # cleaning up the variable names (I did not make everything lowercase
        #  nor did I make "Acc" into "Acceleration" because I wanted the names to be understandable and not too, too long)
names(selectdata3) <- gsub("-", "", names(selectdata3))
names(selectdata3) <- gsub("BodyBody", "Body", names(selectdata3))
names(selectdata3) <- gsub("fBody", "frequencydomainBody", names(selectdata3))
names(selectdata3) <- gsub("fBody", "frequencydomainBody", names(selectdata3))
names(selectdata3) <- gsub("Mag", "Magnitude", names(selectdata3))
names(selectdata3) <- gsub("std", "SD", names(selectdata3))
names(selectdata3) <- gsub("mean", "Mean", names(selectdata3))
names(selectdata3) <- gsub("tBody", "timedomainBody", names(selectdata3))
names(selectdata3) <- gsub("tGravity", "timedomainGravity", names(selectdata3))
        ## head(selectdata3) variable names look better!
        
        # use dplyr to group by subject and activity and report the means of all the means and std devs of the variables measured.
final <- selectdata3%>%group_by(activity, subject)%>%summarize_each(funs(mean), -group)
final #  prints table
   

