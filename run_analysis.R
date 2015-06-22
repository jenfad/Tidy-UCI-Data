##Merges the training and the test sets to create one data set.

##read the sets and labels for the training and test sets
train_labels<-read.table("UCI data/UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
train_set<-read.table("UCI data/UCI HAR Dataset/train/x_train.txt", stringsAsFactors = FALSE)
test_labels<-read.table("UCI data/UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
test_set<-read.table("UCI data/UCI HAR Dataset/test/x_test.txt", stringsAsFactors = FALSE)
features<-read.table("UCI data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
train_xy<-cbind(train_labels, train_set)
test_xy<-cbind(test_labels, test_set)
train_test<-rbind(train_xy, test_xy)
col.names<-c("Activity",  features[,2])
data<-as.data.frame(train_test)
names(data)<-col.names

##Uses descriptive activity names to name the activities in the data set
data$Activity<-as.numeric(data$Activity)
data$Activity_labels[data$Activity == 1]<-"Walking"
data$Activity_labels[data$Activity == 2]<-"Walking Upstairs"
data$Activity_labels[data$Activity == 3]<-"Walking Downstairs"
data$Activity_labels[data$Activity == 4]<-"Sitting"
data$Activity_labels[data$Activity == 5]<-"Standing"
data$Activity_labels[data$Activity == 6]<-"Laying"
 
##Select, subject, activity, and the measurements on the mean and standard deviation 
Mean<-data[grep(c("mean()"),names(data),fixed = TRUE)]
std<-data[grep(c("std()"),names(data),fixed = TRUE)]

Activity_Labels<-data$Activity_labels

train_subject<-read.table("UCI data/UCI HAR Dataset/train/subject_train.txt", 
                          stringsAsFactors = FALSE)
test_subject<-read.table("UCI data/UCI HAR Dataset/test/subject_test.txt", 
                         stringsAsFactors = FALSE)
Subjects <-rbind(train_subject, test_subject)
Subject<-as.data.frame(Subjects)
Tidy<-cbind(Subject, Activity_Labels, Mean, std)

##Create a second, independent tidy data with the average of each variable
Tidy2<-tbl_df(Tidy)
Tidy2<-mutate(Tidy2, Subject = V1)%>%select(-V1)
Tidy3<-group_by(Tidy2, Subject, Activity_Labels)
Tidyaverages <- ddply(Tidy3, c(.(Subject), .(Activity_Labels)), colwise(mean))

#Save the table
write.table(Tidyaverages, file = "~/TidyUCI.txt", row.names = FALSE)




