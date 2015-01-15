
# default directory "UCI HAR Dataset"

#doclean <- function(basedir="UCI HAR Dataset") {
  rm(list=ls())

  # Read activities
  al <- readLines("UCI HAR Dataset/activity_labels.txt")
  activities <- substring(al[1:6],3,20)
  rm("al")
  # Read features
  fl <- readLines("UCI HAR Dataset/features.txt") # to list
  features <- c() 
  for(i in 1:length(fl)) { features <- c(features, strsplit(fl[i]," ")[[1]][2]) }
  rm("fl")
  
  # Filter only mean and std features for use in columns
  found <- c()
  for(i in 1:length(features)) { found[i] <- grepl("mean|std",features[i]) }
  fcolnames <- features[found]

  getdataf <- function(dirname="UCI HAR Dataset", subdir="train") {
    # Create filepaths
    subsFile <- paste(dirname, subdir, "subject_", sep = "/")
    subsFile <- paste(subsFile, subdir, ".txt", sep="")
  
    yFile <- paste(dirname, subdir, "y_", sep = "/")
    yFile <- paste(yFile, subdir, ".txt", sep="")
  
    xFile <- paste(dirname, subdir, "X_", sep = "/")
    xFile <- paste(xFile, subdir, ".txt", sep="")
  
    frownames <- c()
    # Get subjects
    subs <- as.numeric(readLines(subsFile)) # 30 cases and rows=7352
    # Get data
    y <- readLines(yFile) # rows=7352
    X <- readLines(xFile) # rows=7352 columns=length(features) 561
    if (!identical(length(y),length(X))) { print("Failure! length(x) != length(y)") }

    # create data-frame
    # rows=7352 columns=561
    dat <- data.frame()
    for (i in 1:length(y)) { 
      r <- as.numeric(substring(X[i], seq(1, nchar(X[i])-15, 16), seq(16, nchar(X[i]), 16)))
      r <- r[found]
      dat <- rbind(dat, r)
    }
    # rows 1:30 subjects * 1:5 activity, columns 1:79 mean/std avg values
    dat2 <- data.frame()
    indexSTART <- 0
    indexEND <- 0
    for (i in 1:30) {
      if (sum(subs == i) == 0)
        next
      indexSTART <- indexSTART + 1
      indexEND <- indexEND + sum(subs == i)
      nr <- c()  
      for (j in 1:length(activities)) {
        for (k in 1:ncol(dat)) { 
          nr[k] <- mean(dat[y[indexSTART:indexEND] == j,k])
        }
        dat2 <- rbind(dat2, nr)
        frownames <- c(frownames, paste(i, activities[j], sep = "."))
      }
      indexSTART <- indexEND
    }
    colnames(dat2) <- fcolnames
    row.names(dat2) <- frownames
    dat2
  }

  dat <- getdataf()
  dat <- rbind(dat, getdataf(subdir="test"))
  dat <- dat[ order(rownames(dat)) , ]

  write.table(dat, file = "cleaned.csv", row.name=FALSE)
  write.table(rownames(dat), file = "rownames.csv", row.name=FALSE)
  #dat3 <- read.table(file = "cleaned.csv", sep = " ")
#}

