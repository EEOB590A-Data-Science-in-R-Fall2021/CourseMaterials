# Intro to R - Part 2

######## Topics #######
# 1. Preparing and loading data files into R
# 2. Getting to know your data
# 3. Using $ and square brackets
# 4. Manipulating parts of data tables

# ----- 1. Preparing and loading data files into R ------

#   Can use .csv or .txt files or excel files

# Read file using read.csv, naming it something. Note that this must be in your 
# working directory

spider <- read.csv("1. Intro to R/data/spider.csv", header = TRUE)

# You can also use use file.choose()
spider <- read.csv(file.choose())

# Reading in excel files is easy too, with readxl package
library(readxl)

spiderprey <- read_excel("1. Intro to R/data/Prey_Capture_Final_Do_Not_Touch.xlsx", sheet = 2)

## Your Turn ##

# 1) Read in the first sheet of the Prey_Capture_Final excel file. Name it something appropriate for the content. 

# 2) Use the Import Dataset tool to bring in the dataset and change the classes of columns to something else (e.g. date, character etc.). Then look at the code that ran in the console below. 


# ----- 2. Getting to know your data ------

# What does R interpret this as? use class()

class(spider)

# Good! R interprets it as a data frame

# Look at the dimensions - rows by cols

dim(spider)

# Look at the first rows with head()

head(spider)

# What are the column names? Row names? 

colnames(spider)
rownames(spider)

# How are the rows, columns labeled?

labels(spider)

# Summarize your data

summary(spider)

# R describes data as numerical, factors, and integers
# Use str(data) to see what it is describing your data

str(spider)

# Change class using as.factor(), as.numeric(), as.integer(), as.character()

spider$survey <- as.factor(spider$survey)

str(spider)


## YOUR TURN ## 

#Using the Spider Prey dataset, do the following: 

#1) Find out what R interprets this object as. 

#2) Determine the dimensions of the dataframe.

#3) Look at the head of the dataset. How many rows does that show?

#4) Look at the column names and row names - are they logical? 

#5) Look at the summary & the structure of your dataframe. 

#6) change the site from a character to a factor class. 



# ----- 3. Using $ and square brackets ------

# To describe cells in your data frame,
#   R uses the form data[i,j]
#   where i is row, j is column
#   Or, data$column to describe columns

# Specific cells
spider[2,5]

# Specific row
spider[2,]

# Specific column
spider[,5]

# OR, data$column

spider$island

# OR, data[['column']]

spider[['island']]

## YOUR TURN ### 

#With the spiderprey dataset, answer the following: 

#1) What is the name of the web in the 12th row of data? 

#2) Pull out all of the values in the totalprey column using 3 different approaches. 


# ----- 4. Manipulating parts of data frames ------

# Create a vector by calculating
# This isnt automatically attached to the "spider" data frame
webs50m <- (spider$tot_webs/spider$length)*50

# To attach, use cbind() to add "disolved" to "flow"
spider <- cbind(spider,webs50m)

# Make sure the new column is there
head(spider)

## YOUR TURN ###
#using the spiderprey dataset...

#1) Make a new column that sums values from obs1 to obs8. Check to see if this matches the values in totalprey column. 
