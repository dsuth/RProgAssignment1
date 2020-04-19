# corr takes a directory (of csv data files), a threshold for complete cases, and calculates the correlation between 
# nitrate and sulfate for monitors over the threshold value. Returns a numeric vector of correlations, length = 0 if no matches

corr <- function(directory, threshold = 0) {
  
  # Get list of files from directory
  files <- list.files(directory, full.names = TRUE)
  
  result <- numeric(length = 0)
  # for each file, check if complete.cases >= threshold. If so, run correlate (cor) on nitrate and sulfate columns, else skip
  # to next file.
  for (i in 1:length(files)) {
    tmp <- read.csv(files[i])[, c("nitrate", "sulfate")]
    observations <- sum(complete.cases(tmp))
    # print(i)
    if (observations >= threshold & observations >0) {
      # print("above threshold")
      result <- c(result, cor(tmp[,1], tmp[,2], use = "na.or.complete"))
    } 
    
  }
  #return results vector
  result
}