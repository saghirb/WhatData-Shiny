library(shiny)
library(shinydashboard)
library(DT)

readr::read_rds("data/all_ds")
readr::read_rds("data/all_long")

uniqueClasses <- fct_unique(all_long$class)
uniquePackages <- unique(all_ds$Package) %>% sort()
