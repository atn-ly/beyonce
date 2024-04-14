#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Tam Ly
# Date: 18 April 2024
# Contact: annatn.ly@mail.utoronto.ca
# Pre-requisites: Run 0-install_packages.R
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 
