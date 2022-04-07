#### Preamble ####
# Purpose: Clean the survey data downloaded from "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310079401"
# Author: Justin Teng
# Data: 6 April 2022
# Contact: just.teng@mail.utoronto.ca 

#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
# Read in the raw data. 
raw_data <- read_csv("BMI_raw_data.csv")
# Just keep some variables that may be of interest (change 
# this depending on your interests)

reduced_data <- 
  raw_data %>% 
  select(REF_DATE, 
         GEO,
         `Age group`,
         Sex,
         `Measured adult body mass index`,
         Characteristics,
         VALUE)

#rm(raw_data)
         



         