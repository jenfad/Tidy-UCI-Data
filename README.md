# Tidy-UCI-Data
Tidying up the UCI data to include activity levels, the training and test sets, and descriptive variable names

###Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###More Info on Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

*1. The train and test sets containing 561 variables and are read into R
*2. The train and test labels which contain numbers (1-6) that representing the activity type are also read into R
*3. The column of labels was added to the train and test set
*4. The train and text sets were combined 
*5. The features text was read into R and used as column names for the data frame
*6. Read in the subject documents into R that contain the number of the participant for each observation
*7. Combine subject, Activity labels, all variables that calculate mean and standard deviation into the data set "Tidy"
*8. The data frame Tidyaverages find the mean of each variable by subject number and activity 
*9. Save Tidyaverages as the file "TidyUCI.txt"
