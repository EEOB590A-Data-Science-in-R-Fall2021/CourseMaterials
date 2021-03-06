#ggplot Exercise 
#EEOB590

#We will use the forest trajectory dataset to make some graphs. These are from 25m transects conducted across three islands within 4 different forest types. We measured a bunch of things along each transect, so the dataframe is relatively complex. Be sure to use the ggplot_tutorial.R script to help you with this exercise. 

#Load libraries
library(tidyverse)
library(ggthemes)

#Load data
foresttraj <- read.csv("data/tidy/foresttrajectory_site_tidy.csv")

#1) Replicate the figure in the graphics folder called spprich.adult.pdf. Note that adult species richness is represented in the num.adult.spp column. 

#2) Now, make a figure based on model output from the model below. The final figure should look like the one called num.adult.trees.pdf. Be sure to use the code in the ggplot_tutoria file for this. 

m1 <- glm(num.adults ~ island, data=foresttraj, family=poisson)

#3) Come up with a cool way to visualize the relationship between the number of adult species and the number of seedling species across the islands and forest types. 


#4) Find a cool graphical approach from the websites below, then create a graph of that type using data from the foresttraj dataset 
# http://www.r-graph-gallery.com/ 
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html 


