#### Preamble ####
# Purpose: Models number of Spotify streams based on number of weeks on the Billboard Hot 100.
# Author: Tam Ly
# Date: 18 April 2024
# Contact: annatn.ly@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run 02-data_cleaning.R
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
beyonce_cleaned <- read_parquet("data/analysis_data/beyonce_cleaned.parquet")

### Model data ####
beyonce_pois <-
  stan_glm(
    spotify_streams ~ wks_on_chart,
    data = beyonce_cleaned,
    family = poisson(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 302
  )

beyonce_nbinom <-
  stan_glm(
    spotify_streams ~ wks_on_chart,
    data = beyonce_cleaned,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 302
  )

#### Save model ####
saveRDS(
  beyonce_pois,
  file = "models/beyonce_pois.rds"
)

saveRDS(
  beyonce_nbinom,
  file = "models/beyonce_nbinom.rds"
)
