library(tidyverse)
library(lubridate)
##  Note: mlr no longer maintained, use mlr3 instead
library(mlr3verse)
##  Learner extension to get knn method
library(kknn)
##  GGally is an extension to ggplot
library(GGally)

##  Load diabetes data from the mclust package
data(diabetes, package = "mclust")
diabetes <- diabetes %>% as_tibble()

##  Plot pairwise scatter plots. I've used the GGally package to do this
ggpairs(diabetes, aes(colour = class, alpha = 0.9)) + theme_light()

##  Using mlr3

task_diabetes <- as_task_classif(diabetes, target = "class")

##  I can represent the paired data using autoplot from mlr3viz
autoplot(task_diabetes, type = "pairs")

##  Note: k nearest neighbours is in package kknn
learner_knn <- lrn("classif.kknn", k = 5)

##  Split dataset into training and testing
splits <- partition(task_diabetes)
splits

## Train model
learner_knn$train(task_diabetes, splits$train)
learner_knn$model


##  Predict
predictions <-  learner_knn$predict(task_diabetes, splits$test)
predictions
## Plot response and truth using autoplot from mlr3viz package
autoplot(predictions)

##  Classification measures that can be used:
mlr_measures$keys("classif")

##  Scoring measures:
measure <-  msr( "classif.acc")
predictions$score(measure)

##  Confusion matrix
predictions$confusion

