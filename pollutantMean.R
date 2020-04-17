
pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  files <- list.files(directory, full.names = TRUE)
  
  df <- data.frame()
  
  for (i in id) {
    
    df <- rbind(df, read.csv(files[i]))
    #print(dim(df))
  }

  lapply(df[pollutant], function(x) mean(x, na.rm = TRUE))
  
}

