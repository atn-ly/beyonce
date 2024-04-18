#### Preamble ####
# Purpose: Tests the cleaned Beyonce data.
# Author: Tam Ly
# Date: 18 April 2024
# Contact: annatn.ly@mail.utoronto.ca
# Pre-requisites: Run 02-data_cleaning.R and 04-model.R
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(arrow)


#### Read data ####
beyonce_cleaned <- read_parquet("data/analysis_data/beyonce_cleaned.parquet")


#### Read model ####
beyonce_pois <- readRDS(file = here::here("models/beyonce_pois.rds"))
beyonce_nbinom <- readRDS(file = here::here("models/beyonce_nbinom.rds"))


#### Test data ####
#Tests of class:
beyonce_cleaned$wks_on_chart |> class() == "integer"
beyonce_cleaned$spotify_streams |> class() == "integer"

#Tests of number of observations:
beyonce_cleaned$wks_on_chart |> min() >= 0
beyonce_cleaned$wks_on_chart |> max() <= 52
beyonce_cleaned$spotify_streams |> min() >= 1
beyonce_cleaned$spotify_streams |> max() <= 2000000000

#### Test model ####
#Tests of coefficients
between(beyonce_pois$coefficients[1], 0, 20)
between(beyonce_pois$coefficients[2], 0, 20)
