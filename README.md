Getting and Cleaning Data Course Project
========================================

The directory should contain the following files and subdirectories:
```
> list.files()
[1] "UCI HAR Dataset"     "cleaned.csv"         "rownames.csv"        "run_analysis.R" 
```
It is important to run "run_analysis.R" in the current working directory to be able to read "UCI HAR Dataset".

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

