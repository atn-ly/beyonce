#### Preamble ####
# Purpose: Simulates a dataset of number of Spotify streams and number of weeks on the Billboard Hot 100.
# Author: Tam Ly
# Date: 18 April 2024
# Contact: annatn.ly@mail.utoronto.ca
# Pre-requisites: Run 00-install_packages
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
#Set seed for reproducibility
set.seed(302)

#Create simulated dataset
beyonce_simulation <-
  tibble(
    number_weeks_on_chart = runif(min = 0, max = 20, n = 100) |> round(0),
    number_streams = rpois(n = 100, lambda = 15)
  )

#Change class of number_week_on_chart to integer
beyonce_simulation <-
  beyonce_simulation |> 
  mutate(
    number_weeks_on_chart = as.integer(number_weeks_on_chart)
    )

#Create a scatterplot of simulated dataset
beyonce_simulation |>
  ggplot(aes(y = number_streams, x = number_weeks_on_chart)) +
  geom_point() +
  labs(
    x = "Number of weeks on Billboard Hot 100",
    y = "Number of Spotify streams (in millions)"
  ) +
  theme_classic() +
  scale_fill_brewer(palette = "Set1")


#### Test simulated data ####
#Tests of class:
beyonce_simulation$number_weeks_on_chart |> class() == "integer"
beyonce_simulation$number_streams |> class() == "integer"

#Tests of number of observations:
beyonce_simulation$number_weeks_on_chart |> min() >= 0
beyonce_simulation$number_weeks_on_chart |> max() <= 52
beyonce_simulation$number_streams |> min() >= 1
beyonce_simulation$number_streams |> max() <= 2000
