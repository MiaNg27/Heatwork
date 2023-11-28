setwd("C:\\Users\\manh2\\Desktop\\Heatwork")
install.packages("tidyverse")
library(tidyverse)
move1 <- as.data.frame(read.csv("Move 1.csv",header = TRUE,sep=";"))
move2 <- as.data.frame(read.csv("Move 2.csv",header = TRUE,sep=";"))
move3 <- as.data.frame(read.csv("Move 3.csv",header = TRUE,sep=";"))
move4 <- as.data.frame(read.csv("Move 4.csv",header = TRUE,sep=";"))
move5 <- as.data.frame(read.csv("Move 5.csv",header = TRUE,sep=";"))
move6 <- as.data.frame(read.csv("Move 6.csv",header = TRUE,sep=";"))
move7 <- as.data.frame(read.csv("Move 7.csv",header = TRUE,sep=";"))
move8 <- as.data.frame(read.csv("Move 8.csv",header = TRUE,sep=";"))
move9 <- as.data.frame(read.csv("Move 9.csv",header = TRUE,sep=";"))
move10 <- as.data.frame(read.csv("Move 10.csv",header = TRUE,sep=";"))


#put all data frames into list
data_list <- list(move1,move2,move3,move4,move5,move6,move7,move8,move9,move10)      

#merge all data frames together
data <- bind_rows(data_list)[,c(2:53)]

#SVM 
install.packages(c("e1071", "caret", "Rcpp","glue"))
library("caret")
library("e1071")
set.seed(270)
indexes <- createDataPartition(data$GPU.Power, p = .9, list = F)
train <- data[indexes,]
test <- data[-indexes,]

model_reg = svm(GPU.Power~., data=train)

gc()  

model_reg = svm(GPU.Power~., data=train)
