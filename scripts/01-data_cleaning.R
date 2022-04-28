#### Preamble ####
# Purpose: Clean the survey data downloaded from "https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=1310079401"
# Author: Justin Teng
# Data: 6 April 2022
# Contact: just.teng@mail.utoronto.ca 

#### Workspace setup ####
library(haven)
library(tidyverse)

# Read in the raw data. 
raw_data <- read_csv("BMI_raw_data.csv")

# Cleaning the data set and selecting the variables of our interest 

reduced_data <- 
  raw_data %>% 
  select(REF_DATE, 
         GEO,
         `Age group`,
         Sex,
         `Measured adult body mass index`,
         Characteristics,
         VALUE)
reduced_data <- na.omit(reduced_data)

# Cleaning the characteristics and leaving only the number of persons
# which we need for our analysis

reduced_data <-
  reduced_data %>%
  subset(Characteristics != "High 95% confidence interval, number of persons" &
           Characteristics != "Low 95% confidence interval, number of persons" &
           Characteristics != "Coefficient of variation for number of persons" &
           Characteristics != "Percent" &
           Characteristics != "Low 95% confidence interval, percent" &
           Characteristics != "High 95% confidence interval, percent" &
           Characteristics != "Coefficient of variation for percent")

# Combine the the column "VARIABLE" and "Number of Persons" into one column

BMI_cleaned <-
  reduced_data %>%
  rename(Number_of_Persons = VALUE) %>%
  subset(select = -Characteristics)

# Change the variables' names for easier future reference
BMI_cleaned <-
  BMI_cleaned %>%
  rename(BMI =`Measured adult body mass index`)

# Shorten BMI's categories' name
BMI_cleaned <-
  BMI_cleaned %>%
  mutate(BMI = case_when(
    BMI == "Total population for the variable measured adult body mass index" ~ "Total Population",
    BMI == "Underweight, measured adult body mass index under 18.50" ~ "Underweight",
    BMI == "Normal weight, measured adult body mass index 18.50 to 24.99" ~ "Normal Weight",
    BMI == "Overweight, measured adult body mass index 25.00 to 29.99" ~ "Overweight",
    BMI == "Obese, measured adult body mass index 30.00 or higher" ~ "Obese",
    BMI == "Obese class I, measured adult body mass index 30.00 to 34.99" ~ "Obese Class I",
    BMI == "Obese class II, measured adult body mass index 35.00 to 39.99" ~ "Obese Class II",
    BMI == "Obese class III, measured adult body mass index 40.00 or higher" ~ "Obese Class III"
  ))

# Save the cleaned data set into a separate csv

write_csv(BMI_cleaned, "outputs/paper/BMI_cleaned.csv")

         



         