#ggplot exercise Day 1

#We will use the forest trajectory dataset to make some graphs. These are from 25m transects conducted across three islands within 4 different forest types. We measured a bunch of things along each transect, so the dataframe is relatively complex. 

#Load libraries
library(tidyverse)
library(ggplot2)
library(ggthemes)

#Load data
foresttraj <- read.csv("data/tidy/foresttrajectory_site_tidy.csv")

#1) Replicate the figure in the graphics folder called spprich.adult.pdf. 

spprich.adult <- ggplot(foresttraj, aes(forest.type, num.adult.spp, fill=island))+
  geom_boxplot()+
  ylab("Species richness - adult trees")+
  scale_x_discrete(name = "Forest Type", labels=c("Leucaena \nthicket", "Mixed introduced \nforest", "Native limestone \nforest", "Scrub-Shrub"))+
  theme_classic()+
  scale_fill_brewer(palette="Blues", name="Island", labels=c("Guam", "Rota", "Saipan"))+
  theme(axis.title = element_text(size=14), 
        axis.text.x = element_text(size=11))

ggsave("7. graphics/graphics/spprich.adult.pdf")

#2) Now, make a figure based on model output from the model below. The final figure should look like the one called num.adult.trees.pdf. Be sure to use the code in the ggplot_tutoria file for this. 

m1 <- glm(num.adults ~ island, data=foresttraj, family=poisson)
summary(m1)

#create dataframe over which to predict model results
preddata <- with(foresttraj, expand.grid(island = levels(island)))

#predict model results
preddata2 <- as.data.frame(predict(m1, newdata=preddata, type="link", se.fit=TRUE))
preddata2<-cbind(preddata, preddata2)

#calculate upper and lower CI's
preddata2 <- within(preddata2, {
  pred <- exp(fit)
  lwr <- exp(fit - (1.96 * se.fit))
  upr <- exp(fit + (1.96 * se.fit))
})

num.adult.trees <- ggplot(preddata2, aes(island, pred)) +
  geom_point()+
  geom_errorbar(aes(ymin=lwr, ymax=upr), width=0.2)+
  ylab("Number of adult trees per transect")+
  scale_x_discrete("Island", labels=c("Guam", "Rota", "Saipan"))+
  theme_classic()
  
ggsave("7. graphics/graphics/num.adult.trees.pdf")

#3) Come up with a cool way to visualize the relationship between the number of adult species and the number of seedling species across the islands and forest types. 

ggplot(foresttraj, aes(num.adult.spp, num.seedling.spp))+
  geom_point()+
  facet_grid(island~forest.type)+
  geom_smooth(method="lm", se=F)+
  theme_fivethirtyeight()

#4) Find a cool graphical approach from the websites below, then create a graph of that type using data from the foresttraj dataset 
# http://www.r-graph-gallery.com/ 
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html 


