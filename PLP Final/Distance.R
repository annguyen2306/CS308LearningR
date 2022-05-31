library(tidyverse)
library(fs)
library(matrixStats)
library(dplyr)
library(randomForest)

#Function to calculate the Mahalanobis Distance of a test set against an average
#spectrum extracted from the train set
get_mahalanobis <- function(train,test){
  #Get mean of the properties and find covariance matrix
  train.center = colMeans(train) #Find mean of the matrix
  train.cov = cov(train) #Find covariance matrix
  #Get Mahalanobis Distance set
  result_set <- list()
  for (i in 1:range(ncol(t(test)))){
    newD <- mahalanobis(t(test)[,i], train.center, train.cov)
    result_set <- append(result_set, list(newD))
  } 
  return(result_set)
}

#Get content of folder containing CSV files and merge them into one matrix
get_content <- function(dir){
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
  return(file_contents)
}

#Get the train set and test set that has been optimized to eliminate redundant 
#features based on standard deviation. Besides, preparing the dimensions of
#train and test set to be fitting with Mahalanobis distance formula
get_train_test <- function(dir){
  file_contents <- get_content(dir)
  #reduce dataset based on the standard deviation
  reduce_data <- transform(file_contents, SD=apply(file_contents,1, sd, na.rm = TRUE))
  #standard deviation set to 10 since over this point, the distance matrix will 
  #be filled with negative numbers
  reduce_data <- head(arrange(reduce_data,desc(SD)), n = 10)
  significant_wave <- reduce_data['Wavenumber']
  
  #Prepare data for Mahalanobis
  opt_data <- subset(reduce_data, select = -c(Wavenumber))
  opt_data <- subset(opt_data, select = -c(SD))
  opt_data <- t(opt_data) #transpose to (30x3965)
  
  #Split to train set and test set at 80% train set
  dt = sort(sample(nrow(opt_data), nrow(opt_data)*.8))
  train <- opt_data[dt,] 
  test <- opt_data[-dt,]
  
  #Return list
  train_test_set <- list()
  train_test_set[[1]] <- train
  train_test_set[[2]] <- test
  
  return(train_test_set)
}

#Colors to tag data
colorPoint_fix <- list("red","blue","green")

#Get path to data folder
get_input <- function(i){
    insert <- paste("Enter path to datase",i,":")
    dirU <- readline(insert)
    nameU <- readline("Set name:")
    return(list(name = nameU, path = dirU, colData = colorPoint_fix[[i]]))
}

#Label the waves to create target feature for Random Forest
get_lab <- function(dir, label){
  content <- get_content(dir)
  content <- subset(content, select = -c(Wavenumber))
  content <- t(content)
  content <- cbind( a = label, content)
  return(content)
}

#Get importance of features using Random Forest, output is a list of most 
#important wavenumbers
get_random_importance <- function(dirW_s,dirG_s,dirR_s){
  #Merge vectors together
  set_merge <- rbind(get_lab(dirW_s,1),get_lab(dirG_s,2), get_lab(dirR_s,3))
  #Run random forest and extract importance list
  trait_vs_type <- randomForest(as.factor(a)~.,data = set_merge,ntree = 500)
  set_weight <- importance(trait_vs_type)
  #Plot to present the importance of each wavenumber (on the graph they are index
  #so it needs to add with 650 since the wave starts at this point)
  plot(set_weight, main = "Importance Scores of Wavenumber", xlab = 
         "Wavenumber Index", ylab = "Importance")
  top_weight <- sort(set_weight, decreasing = TRUE)[1:10]
  #convert to wavenumbers
  waves <- vector()
  for (i in top_weight){
    waves <- c(waves,which(set_weight == i))
  }
  return(waves)  
}

#Get train and test set based on the ranking of most importance from Random
#Forest, prepare matrix for Mahalanobis plot
get_train_test_rfe <- function(dir, waves){
  data_set <- get_content(dir)
  reduce_data <- data_set[waves[1],]
  for (i in 2:length(waves)){
    reduce_data <- rbind(reduce_data, data_set[waves[i],])
  }
  opt_data <- subset(reduce_data, select = -c(Wavenumber))
  opt_data <- t(opt_data) 
  #Split to train set and test set at 80% train set
  dt = sort(sample(nrow(opt_data), nrow(opt_data)*.8))
  train <- opt_data[dt,] 
  test <- opt_data[-dt,]
  
  #Return list
  train_test_set <- list()
  train_test_set[[1]] <- train
  train_test_set[[2]] <- test
  
  return(train_test_set)
}

#Plot the distances graphs
get_plot <- function(distance_base, distance_ag, dir_base, dir_ag,method){
  graph_title <- paste(dir_base$name, "versus", dir_ag$name, method)
  ylab_title <- paste("Distance from",dir_ag$name)
  xlab_title <- paste("Distance from", dir_base$name)
  plot(distance_base, distance_ag, main = graph_title, asp = 2, col = dir_base$colData,
       xlab = xlab_title, ylab = ylab_title)
}

{
  print("Please insert the dataset for distance calculation!")
  print("The program can ony take in data from 3 datasets to no exhaust the computation.")
  
  #input placeholder
  
  dirW <- get_input(1)
  dirG <- get_input(2)
  dirR <- get_input(3)
  
  whiskey_set <- get_train_test(dirW$path)
  gin_set <- get_train_test(dirG$path)
  rum_set <- get_train_test(dirR$path)
  
  
  distance_w_w <- get_mahalanobis(whiskey_set[[1]],whiskey_set[[2]])
  distance_w_r <- get_mahalanobis(rum_set[[1]],whiskey_set[[2]])
  distance_w_g <- get_mahalanobis(gin_set[[1]],whiskey_set[[2]])
  
  waves <- get_random_importance(dirW$path, dirG$path, dirR$path)
  
  whiskey_set <- get_train_test_rfe(dirW$path, waves)
  gin_set <- get_train_test_rfe(dirG$path, waves)
  rum_set <- get_train_test_rfe(dirR$path, waves)
  
  rfe_distance_w_w <- get_mahalanobis(whiskey_set[[1]],whiskey_set[[2]])
  rfe_distance_w_r <- get_mahalanobis(rum_set[[1]],whiskey_set[[2]])
  rfe_distance_w_g <- get_mahalanobis(gin_set[[1]],whiskey_set[[2]])
  
  par(mfrow=c(2,2))
  get_plot(distance_w_w, distance_w_r, dirW,dirR, method ="SD Sort")
  get_plot(distance_w_w, distance_w_g, dirW,dirG, method ="SD Sort")
  get_plot(rfe_distance_w_w, rfe_distance_w_r, dirW,dirR, method ="RFE Sort")
  get_plot(rfe_distance_w_w, rfe_distance_w_g, dirW,dirG, method ="RFE Sort")
}