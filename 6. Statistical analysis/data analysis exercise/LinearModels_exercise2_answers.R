#Linear Models Exercise 2

library(tidyverse)
library(lme4)
library(ggResidpanel)
library(emmeans)

#We will use the same dataset from last week

traits <- read_csv("data/tidy/tidyREUtraits.csv")

traits <- traits %>%
  filter(!is.na(thickness))

traits <- traits %>%
  filter(species == "aglaia"| species == "aidia" | species == "guamia" | species == "cynometra" | species == "neisosperma" | species == "ochrosia" | species == "premna")  


#1) Let's assess model fit for the model that came out on top for all 4 methods
thick1 <- lm(thickness ~ island*species, data = traits)
resid_panel(thick1)
resid_xpanel(thick1)

#Do data follow the assumptions of:
#1) independence?
#2) normality?
#3) constant variance?
#4) linearity?

#2) Now let's interpret the results, using each of the methods from last week: 

#Option 1: Traditional hypothesis testing (simplified model). 
#use emmeans to tell whether there are differences between islands for a given species
#which species differ between islands? 
thick1 <- lm(thickness ~ island*species, data = traits) #final model
emmeans(thick1, pairwise ~ island|species)

#Option 2: Full model approach. 
#get confidence intervals using emmeans, and determine species
thick1 <- lm(thickness ~ island*species, data = traits) #final model


#Option 3: Likelihood Ratio Test approach
#use emmeans to determine whether there are differences between species across all islands
thick1 <- lm(thickness ~ island*species, data = traits) #final model
emmeans(thick1, pairwise ~ species) #most species differ, except aidia & cynometra, aidia and guamia, and cynometra and guamia

#Option 4: Create a full model and all submodels and compare AIC values to choose the best fitting model
#just interpret the best fitting model. 

#Best fitting model includes species, island and an island*species interaction. So, the effect of species, depends on island. 

#To interpret this, we will graph it. 
ggplot(traits, aes(species, thickness, fill=island))+
  geom_boxplot()

ggplot(traits, aes(species, thickness))+
  geom_boxplot()+
  theme_classic()
