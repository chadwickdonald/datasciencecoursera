create_test_tables <- function() {
  library(dplyr)
  setwd("/Users/chadwickbidwell/workspace/data_science")
  activity_labels <- read.table('uci_har_dataset/activity_labels.txt')
  features <- read.table('uci_har_dataset/features.txt')
  
  # test data
  subject_test <- read.table('uci_har_dataset/test/subject_test.txt')
  colnames(subject_test)[1] <- 'subject'
  y_test <- read.table('uci_har_dataset/test/y_test.txt')
  colnames(y_test)[1] <- 'activity'
  y_test$activity <- factor(y_test$activity, levels = activity_labels[,1], labels = activity_labels[, 2])
  test_data_raw <- cbind(subject_test, y_test)
  x_test <- read.table('uci_har_dataset/test/X_test.txt')
  colnames(x_test) <- features$V2
  test_data <- cbind(test_data_raw, x_test)
  
  # training data
  subject_train <- read.table('uci_har_dataset/train/subject_train.txt')
  colnames(subject_train)[1] <- 'subject'
  train_y <- read.table('uci_har_dataset/train/y_train.txt')
  colnames(train_y)[1] <- 'activity'
  train_y$activity <- factor(train_y$activity, levels = activity_labels[,1], labels = activity_labels[, 2])
  train_data_raw <- cbind(subject_train, train_y)
  train_x <- read.table('uci_har_dataset/train/X_train.txt')
  colnames(train_x) <- features$V2
  training_data <- cbind(train_data_raw, train_x)
  
  # need to merge data here before doing the next steps
  merged_data <- rbind(test_data, training_data)
  
  # get column headers
  feature_names = features$V2
  feature_mean_std <- feature_names[grep('mean|std|Mean', feature_names, ignore.case=TRUE)]
  subject_factor <- factor('subject')
  activity_factor <- factor('activity')
  col_headers <- unlist(list(subject_factor, activity_factor, feature_mean_std))
  col_headers <- as.character(col_headers)
  
  # this gets only std/mean data
  data <- merged_data[col_headers]
  
  #create average for each col
  avg_data <- aggregate(data[,3:88], list(data$subject, data$activity), mean)
}

