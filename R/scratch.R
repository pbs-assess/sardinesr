library(dplyr)
source("R/utils.R")

d <- load_data()
j <- d$catch

## The Sardine catch is way off what's in the SR document.
ct <- d$catch %>%
  group_by(year) %>%
  summarize(catch = sum(landed_kg + discarded_kg) / 1000)
