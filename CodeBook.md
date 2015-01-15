Getting and Cleaning Data Course Project
========================================
Run script with:
```
> source("run_analysis.R") # does run the script
> ls() # outcomes
> "activities" "dat"        "fcolnames"  "features"   "found"      "getdataf" 
> dim(dat)
> [1] 180  79
> list.files() #outcomes
> "UCI HAR Dataset"     "cleaned.csv"         "rownames.csv"        "run_analysis.R"
```
# The variables & The data
Outcome Variables:
- **activities** is a string list that contains all the activities in a string format and is referred by an index.
- **dat** is a data.frame and contains the final data set written into the file. Should contain 180 rows and 79 columns.
- **features** is a string list that contains all the features in a string format and is referred by an index.
- **found** is a truth table that tells what features are included in the final data set.
- **fcolnames** is a string list that contains filtered features used as column headers in the final data set ```features[found]```.
- **getdataf** is a nested function to get data for each data set, test and train in this case ```getdataf(dirname="UCI HAR Dataset", subdir="train")```.

# Transformations and work performed to clean up the data 
Steps done in the script:

1. **activities** are read from "UCI HAR Dataset/activity_labels.txt".
2. **features** are read from "UCI HAR Dataset/features.txt".
3. **found** truth table is constructed based on ```grepl("mean|std",features[i])``` values.
4. In **getdataf** function the data is constructed as:
  * **subjects** is read from "UCI HAR Dataset/[train|test]/subject_[train|test].txt" into a numeric list.
  * **y** is read from "UCI HAR Dataset/[train|test]/y_[train|test].txt" into a numeric list.
  * **X** is read from "UCI HAR Dataset/[train|test]/X_[train|test].txt" into a data.frame.
  * Each of these should contain 7352 rows. Initially **X** has 561 features in each row, but only 79 are used for the final data set based on **found** truth table.
  * Each **X** row has a counterpart in the same index in **y** and **subjects**. Each **X** row measurement has one activity in **y** and one subject in **subjects**.
  * There many measurements for the same activity and the subject, those averages ```mean()``` are used in the final data set. Hence each row header in the final data set is in a format of [subject].[activity string] e.g. "18.WALKING" or "5.SITTING". Column headers come from **fcolnames**.
  * In the final data set **dat** there is 180 rows and 79 columns, 126 from the train data set and 54 from the test data set.
5. Finally the two data sets are merged with *rbind* and *ordered* based on *rownames*. 
6. The result **dat** is written by ```write.table(dat, file = "cleaned.csv", row.name=FALSE)``` into *"cleaned.csv"* and rownames are written similarly into *"rownames.csv"*.
