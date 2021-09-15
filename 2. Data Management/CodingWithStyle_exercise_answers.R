# 590A Data Science ------
## Coding with Style ------
### 15 September 2021 ------

#Fix this script, using good coding convention. 

#This is a made-up dataset, so you can create any story and associated meaningful variable and filenames to go with it. 
#Put this script into the format for the Outline feature in RStudio

# 1. Load libraries --------

library(ggplot2)
library(lme4)

# 2. Create dataset ---------

statecats <- data.frame(state = c('Iowa', 'Vermont', 'Hawaii', 'Texas','Alaska'),
                  statebird = c('American Goldfinch', 'Hermit Thrush', 'Nene',
                                'Northern Mockingbird', 'Willow Ptarmigan'),
                  snow = c(1, 1, 0, 0, 1),
                  numcats = sample(3:10, 5, replace=TRUE))

# 3. Explore dataset ---------

ggplot(statecats, aes(state, numcats)) +
  geom_point()

# 4. Create new column ---------

statecats$maxcats <- 10

# 5. Analyze dataset ---------

snowcat_mod <- glm(snow ~ numcats, family = binomial, data = statecats)
summary(snowcat_mod)

# 6. Create a csv file ---------

write.csv(statecats, "statecats.csv")
