library(tidyverse)
library(arrow)

path <- "data"
network <- "grid"

read_adata <- function(network, path) {
  runs <- grep(network, list.files(path), value = TRUE)
  df <- arrow::read_feather(
    file.path(path, runs[1], "data", "agents", "adata.feather")
  )
  for (run in runs[2:length(runs)]) {
    df %>% 
      rbind(
        arrow::read_feather(
          file.path(path, run, "data", "agents", "adata.feather")
        )
      ) -> df
  }
  return(df)
}



 


