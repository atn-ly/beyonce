#### Preamble ####
# Purpose: Cleans the raw Beyonce data.
# Author: Tam Ly
# Date: 18 April 2024
# Contact: annatn.ly@mail.utoronto.ca
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(arrow)


#### Clean data ####
#Read in raw data
beyonce_raw <- read_csv("data/raw_data/beyonce_raw.csv")

#Clean column names using janitor and change classes to integer
beyonce_cleaned <-
  beyonce_raw |>
  clean_names() |> 
  mutate(
    spotify_streams = as.integer(spotify_streams),
    wks_on_chart = as.integer(wks_on_chart)
  )


#### Save data ####
write_parquet(beyonce_cleaned, "data/analysis_data/beyonce_cleaned.parquet")
