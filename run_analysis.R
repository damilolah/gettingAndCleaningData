

## read the rough data set into x1, x2, y1 and y2 
x1 <- read.table("UCI HAR Dataset/train/X_train.txt")

x2 <- read.table("UCI HAR Dataset/test/X_test.txt")

y1 <- read.table("UCI HAR Dataset/train/y_train.txt")

y2 <- read.table("UCI HAR Dataset/test/y_test.txt")

## as well as the subject identities for train subjects and test subjects
subject1 <- read.table("UCI HAR Dataset/train/subject_train.txt")

subject2 <- read.table("UCI HAR Dataset/test/subject_test.txt")

## bind the 30 observations together, their activity id as well as the subject ids
x <- rbind(x1, x2)
y <- rbind(y1, y2)

subject <- rbind(subject1, subject2)

## Read the measurement names into variable measurements
measurements<- read.table("UCI HAR Dataset/features.txt")

## we only need the second column to be column name for the observations x
measurements<- measurements[, "V2"]

colnames(x) <- measurements
colnames(y) <- "activity_id"
colnames(subject) <- "subject"

## We need tidy data consisting of the means and standard deviations only
means <- grep("-mean\\(\\)", measurements, value=TRUE)
stdevs <- grep("-std\\(\\)", measurements, value=TRUE)


xsubset <- x[, c(means, stdevs)]

## read the activity labels 
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

colnames(activity_labels) <- c("activity_id", "activity")

##Assign labels to activity ids in y
ymerged <- merge(y, activity_labels)

## form a dataset of observations and activities
tdata <- cbind(xsubset, ymerged["activity"])

## Add subject ids to that dataset
tdataset <- cbind(tdata, subject)

## we need to load the reshape2 package into R,
## since we want to use melt and dcast functions
library(reshape2)

meltdataset <- melt(tdataset , id=c("subject", "activity"))

summary(meltdataset)

tidydataset <- dcast(meltdataset, activity + subject ~ variable, mean)

summary(tidydataset)

write.csv(tidydataset, "tidydata.txt")

names(tidydataset)


