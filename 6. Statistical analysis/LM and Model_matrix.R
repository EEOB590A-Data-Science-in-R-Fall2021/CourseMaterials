# EEOB590A 
# Learning about model matrices/design matrices ------

library(lme4)
library(tidyverse)

# 1. Create dataset ------
set.seed(14)
spidex <- tibble(
    species = rep(c("spA", "spB", "spC"), each = 4), 
    island = rep(c("Guam", "Saipan"), times = 6), 
    websize = rnorm(12, mean = 50, sd = 5), 
    temp = rnorm(12, mean = 34, sd = 8))

view(spidex)

# 2. Example 1: Linear regression -------

spidmod1 <- lm(websize ~ temp, data = spidex)

model.matrix(spidmod1)

summary(spidmod1)

ggplot(spidex, aes(temp, websize)) +
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) +
  xlim(0,50) +
  ylim(40,70)

# 3. Example 2: T-test ---------

spidmod2 <- lm(websize ~ island, data = spidex)

model.matrix(spidmod2)

summary(spidmod2)

ggplot(spidex, aes(island, websize)) +
  geom_boxplot()+
  geom_point()

# 4. Example 3: Anova ----------

spidmod3 <- lm(websize ~ species, data = spidex)

model.matrix(spidmod3)

summary(spidmod3)

ggplot(spidex, aes(species, websize)) +
  geom_boxplot()+
  geom_point()

# 5. Example 4: Two-way anova with interaction ---------

spidmod4 <- lm(websize ~ island * species, data = spidex)

model.matrix(spidmod4)

summary(spidmod4)

ggplot(spidex, aes(island, websize)) +
  geom_boxplot() +
  geom_point() +
  facet_grid(.~species)

# 6. Example 5: Linear mixed effects ------------

spidmod5 <- lmer(websize ~ island + (1|species), data = spidex)

model.matrix(spidmod5)

summary(spidmod5)
confint(spidmod5)

