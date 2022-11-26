#Initial Inspection
#Data upload

install.packages("readxl")
install.packages("tidyverse")
install.packages("GGally")
install.packages("mgcv")

library(mgcv)
library(tidyverse)
library(GGally)
library(readxl)

data <- read_excel("HDI Inequality_GAM.xlsx")
summary(data)

#Scatter plot matrix
data %>% ggpairs(columns = c("HDI", "CHIn", "LE", "Ed", "Inc", "MYSch"),
                 upper = list(continuous = wrap('cor', size = 8)), cardinality_threshold = NULL)

mod_gam2 = gam(HDI ~ s(CHIn) + s(LE) + s(Ed) + s(Inc) + s(MYSch), data = data)
summary(mod_gam2)
