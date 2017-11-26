library(shiny)
library(shinydashboard)
library(DT)

# Libraries for datasets
library(tidyverse)
library(tibble)
library(stringr)
library(MASS)
library(DT)
library(fivethirtyeight)
library(gapminder)
library(nycflights13)
#library(Epi)
library(stratification)
library(lsmeans)
library(SwissAir)
library(eha)
#library(MEMSS)
#library(fda)
library(bundesligR)
library(boot)
library(nlme)
library(Ecdat)
library(eurostat)
library(europop)
library(HistData)
library(babynames)
library(fueleconomy)
library(nasaweather)
#library(UScensus2010)


# Identifying all the available datasets.
all_ds_ls <- data(verbose = TRUE)

all_ds <- all_ds_ls$results %>%
  tibble::as_tibble() %>%
  dplyr::rename(Data_Orig = Item) %>%
  dplyr::mutate(dataset = stringr::word(Data_Orig, 1)) %>%
  dplyr::mutate(Class = purrr::invoke_map(class, as.list(parse(text = dataset)))) %>%
  tidyr::unnest(Class) %>%
  dplyr::select(Package, Data_Orig, Title, Class) %>%
  dplyr::arrange(Package, Data_Orig, Class) %>%
  dplyr::mutate(Val = Class) %>%
  tidyr::spread(key = Class, value=Val, fill = "") %>%
  tidyr::unite(Classes, c(-Package, -Data_Orig, -Title), sep= " ") 

# Define unique packages and classes to be used for the UI
uniqueClasses <- gsub("\\s+", " ", all_ds$Classes) %>% 
  str_split("\\s+") %>% 
  unlist() %>% 
  unique() %>% 
  .[nzchar(.)] %>% 
  sort()

uniqueClasses

uniquePackages <- unique(all_ds$Package) %>% 
  sort()