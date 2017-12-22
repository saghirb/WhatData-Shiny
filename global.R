library(shiny)
library(shinydashboard)
library(DT)
library(tidyverse)

load("data/all_ds.RData")
load("data/all_long.RData")

uniqueClasses <- fct_unique(all_long$class)
uniquePackages <- unique(all_ds$Package) %>% sort()
