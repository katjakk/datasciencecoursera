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
Variable outcomes:
- **activities** is a string list and contains all the activities in a string format that are referred by an index.
- **dat** is a data.frame and contains the final data set that is written into the file. Should contain 180 rows and 79 columns.
- **features** is a string list and contains all the features in a string format that are referred by an index.
- **found** is a truth table that tells which features are included in the final data set.
- **fcolnames** is a string list that contains filtered features used as column headers in the final data set ```features[found]```.
- **getdataf** is a nested function to get data for each data set, test and train in this case ```getdataf(dirname="UCI HAR Dataset", subdir="train")```.

# Transformations and work performed to clean up the data 
1. **activities** are read from "UCI HAR Dataset/activity_labels.txt".
2. **features** are read from "UCI HAR Dataset/features.txt".
3. **found** truth table is constructed based on ```grepl("mean|std",features[i])``` values.
4. In **getdataf** function the data is constructed as:
  * Item
3. Item 3
   * Item 3a
   * Item 3b
