library(tidyverse)
library(fs)
library(matrixStats)

#Create a graph that shows the wavefunctions as integrated
get_intgraph <- function(dir,title){
  #input folder path
  file_paths <- fs::dir_ls(dir)
  file_paths
  #Looping folder to geth paths
  file_contents <- list()
  
  for (i in seq_along(file_paths)) {
    file_contents[[i]] <- read_csv(
      file = file_paths[[i]]
    )
  }
  
  file_contents <- set_names(file_contents, file_paths)
  
  #Fill contents into file paths
  file_paths %>%
    
    map(function (path){
      read_csv(path)
    })
  
  #Join files together into 1 df 
  file_contents <- reduce(file_contents, full_join, by ="Wavenumber")
  for (i in 2:range(length(file_contents))) {
    names(file_contents)[i] <- i-1
  }
  
  plot(file_contents[[1]],file_contents[[2]], xlab = "Wavenumber", ylab = "Intensity", type = "l", main = title)
  
  #For each file, add a spectrum to overlay the graphs on top of each other
  for (i in 3:range(length(file_contents))) {
    lines(file_contents[[1]],file_contents[[i]])
  }
  
  return(file_contents)
}
par(mfrow=c(3,1))

title_representation <- "spectrum representation"

#Get path to data folder
get_input <- function(i){
  insert <- paste("Enter path to datase",i,":")
  dirU <- readline(insert)
  nameU <- readline("Set name:")
  return(list(name = nameU, path = dirU, colData = colorPoint_fix[[i]]))
}

dirW <- get_input(1)
dirG <- get_input(2)
dirR <- get_input(3)

whiskey_set <- get_intgraph(dirW$path,title = paste(dirW$name,title_representation))
gin_set <- get_intgraph(dirG$path, title = paste(dirG$name,title_representation))
rum_set <- get_intgraph(dirR$path, title = paste(dirR$name,title_representation))



