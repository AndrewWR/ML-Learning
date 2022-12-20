library(tidyverse)
library(lubridate)
##  Note: mlr no longer maintained, use mlr3 instead
library(mlr3)
##  GGally is an extension to ggplot
library(GGally)

##  Load diabetes data from the mclust package
data(diabetes, package = "mclust")
diabetes <- diabetes %>% as_tibble()

##  Plot pairwise scatter plots. I've used the GGally package to do this
ggpairs(diabetes, aes(colour = class, alpha = 0.9)) + theme_light()

