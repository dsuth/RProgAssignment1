# Read a directory full of files, and return the number of complete cases in the files in a data frame of format:
# filename | number of complete cases

complete <- function(directory, id = 1:332) {
  # Directory is the path to files
  # id is the integer file number (refers to monitor number in this case)
  # return data frame:
  # id  nobs
  # 1   117
  # 2   1041
  # ...
  
  files <- list.files(directory, full.names = TRUE)
  df <- data.frame("id"=numeric(), "nobs"=numeric())
  x <- 1
  for (i in id) {
    tmp <- read.csv(files[i])
    observations <- sum(complete.cases(tmp))
    
    df[x,] <- c(i,observations)
    x <- x+1
  }
  print(df)
}