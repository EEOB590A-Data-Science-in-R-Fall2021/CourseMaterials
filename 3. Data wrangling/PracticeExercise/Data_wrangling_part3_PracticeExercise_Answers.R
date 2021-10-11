# EEOB590A - Data_wrangling part 3 practice exercise ------

# Part 1: Get set up ----------

## 1.1) Load libraries ----------
library(tidyverse)

## 1.2) Read in data ----------
# From the tidy folder, read in the file you created from last week's assignment on the pollination dataset ("poll_long_tidy.csv")

poll <- read_csv("data/tidy/poll_long_tidy.csv")

## 1.3) Change the class of each variable if needed ------

str(poll) #most things are characters, dates are Dates, and numinsects and duration are numeric

# Part 2: Subset & summarize --------

## 2.1) Make a new dataframe with just the data from Guam at the racetrack site and name accordingly. --------
poll_gu_race <- poll %>%
  filter(island == "guam" & site == "race")

## 2.2) Make a new dataframe with just the uniqueID, island, site, transect, insectorder, numinsects, and duration columns. --------

poll2 <- poll %>%
  select(uniqueID, island, site, transect, insectorder, numinsects, duration)

## 2.3) With the full database (not the new ones you created in the two previous steps), summarize data, to get: --------

### 2.3.a) a table with the total number of insects at each site, and then arrange rows in descending order --------
pollsite <- poll %>%
  group_by(site) %>%
  summarize(totalnum = sum(numinsects, na.rm = TRUE)) %>%
  arrange(desc(totalnum))

### 2.3.b) a table that shows the mean number of insects per island, arranged in ascending (smallest first) order --------
pollisl <- poll %>%
  group_by(island) %>%
  summarize(meannum = mean(numinsects, na.rm = TRUE)) %>%
  arrange(meannum)

### 2.3.c) a table that shows the min and max number of insects per transect (note that the transects have the same name at each site) --------
polltrans <- poll %>%
  group_by(site, transect) %>%
  summarize(minnum = min(numinsects, na.rm = TRUE), maxnum = max(numinsects, na.rm = T))

## 2.4) Figure out which insect order is found across the greatest number of sites and has the most total insects --------

poll %>%
  filter(numinsects > 0) %>%
  group_by(insectorder) %>%
  summarize(nsites = n_distinct(site), totinsects = sum(numinsects, na.rm = TRUE)) %>%
  arrange(desc(nsites), desc(totinsects))

## 2.5) For the insect order with the greatest total number of insects and found at the most sites, calculate the mean and sd by site. Include the island name in the final table. --------
poll %>%
  filter(insectorder == "Lepidoptera") %>%
  group_by(island, site) %>%
  summarize(avgbutterflies = mean(numinsects, na.rm = TRUE), sdbutterflies = sd(numinsects, na.rm = TRUE)) %>%
  arrange(desc(avgbutterflies))

## 2.6) Ask a question about the relationship between bowl color and insectorder, and then write the code to answer your question. ------


