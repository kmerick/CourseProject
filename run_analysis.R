##Load the X_test.txt data into R
xtest <- read.table("UCI HAR Dataset\\test\\X_test.txt")
head(xtest)

##Load the X_train.txt data into R
xtrain <- read.table("UCI HAR Dataset\\train\\X_train.txt")
head(xtrain)

##Load the y_test.txt data into R
ytest <- read.table("UCI HAR Dataset\\test\\y_test.txt")
head(ytest)

##Load the y_train.txt data into R
ytrain <- read.table("UCI HAR Dataset\\train\\y_train.txt")
head(ytrain)

##1. Combine the training and the test sets to create one data set.
xdata <- rbind(xtest,xtrain)
ydata <-rbind(ytest,ytrain)
fulldata <- cbind(xdata, ydata)
names(fulldata)[ncol(fulldata)] <- "y"

head(fulldata[c("V1","y")])

##2. Extract only the measurements on the mean and standard deviation for each measurement.
#Use the file called features to find the needed variables
features <- read.table("UCI HAR Dataset\\features.txt")
head(features)
names(features)
nrow(features)
ncol(fulldata)

#find the variables we need for the anlaysis using the grep function
means<- grep("-mean()", features$V2, value=TRUE, fixed=TRUE)
sdevs<- grep("-std()", features$V2, value=TRUE, fixed=TRUE)
varstouse <- c(means, sdevs)

colstouse <- match(varstouse, features$V2)



##3.  Use descriptive activity names to name the activities in the data set.
###read in the activity labels.
actlabels <- read.table("UCI HAR Dataset\\activity_labels.txt")
names(actlabels)
actlabels

#merge your dataset with the activity label
names(fulldata)
complete<- merge(fulldata, actlabels, by.x = "y", by.y = "V1")
names(complete)
#reorder the columns
complete <- complete[,c(2:562,1,563)]
head(complete[c("V1","y","V2.y")])
names(complete)

##4.  Appropriately label the data set with descriptive variable names.
##Load the subject_test.txt data into R
subtest <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
head(subtest)

##Load the subject_train.txt data into R
subtrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
head(subtrain)

##combine both files - stack them (unique identifier subject)
subfull <-rbind(subtest,subtrain)
str(subfull)

##Now we have  1) complete and 2) subfull - combine them
final<-cbind(complete, subfull)
names(final)
names(final)[ncol(final)] <- "subject"
names(final)
#take only the subset of variables to use for the analysis
final <- final[c(colstouse,562:564)]

#varstouse - are the labels for the means and sdevs
#colstouse - are the columns containing the means and sdevs
#activity - y, V2.y at the end of the file
#subject - subject at the end of the file

newnames <- gsub("-","_",varstouse) # Clean Vars by dropping the " - " in order to make it a character and not a list
newnames <- gsub("()","", newnames, fixed=TRUE) # Clean Vars by dropping the " () " 
varnames<- c(newnames, "ActNum", "ActLab", "Subject")

##Now apply the new descriptive names to the data
names(final) <- varnames
#check to make sure it worked
names(final)

##5. From the data set in Step4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
AggFinal<-aggregate(final[newnames], by = final[c("ActLab", "Subject")], mean, na.rm = TRUE)
head(AggFinal)
write.table(AggFinal, file ="AggFinal.txt", row.names=FALSE)


