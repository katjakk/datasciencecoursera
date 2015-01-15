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
- **activities** is a string list and contains all the activities in a string format that are referred by an index.
- **dat** is a data.frame and contains the final data set that is written into the file.
- **features** is a string list and contains all the features in a string format that are referred by an index.
- **found** is a truth table that tells which features are included in the final data set.
- **fcolnames** is a string list that contains filtered features used as column headers in the final data set ```features[found]``.

# Transformations and work performed to clean up the data 
1. Item 1
2. Item 2
3. Item 3
   * Item 3a
   * Item 3b
