# EEOB590A - Data_wrangling part 2 practice exercise ------

# Part 1: Get set up ----------

## 1.1) Load libraries ----------

## 1.2) Read in data ----------
# From the tidy folder, read in the file on pollination you created after finishing last week's assignment

## 1.3) Change name of columns -------
# "date traps out" should be "dateout" and and "date traps coll" sould be "datecoll"

## 1.4) Change the class of each variable as appropriate ------
# Make variables into factors, numeric, character, etc. Leave the dates as is for now. 

## 1.5) What format are the dates in? Change to date format ----

# Part 2: Fix errors within cells ------

## 2.1) Fix the levels of island and site ------
# Maks sure all island and site names are in lowercase 
# Rename sites: forbigrid as forbig and racetrack as race

## 2.2) Do you see any other errors that should be cleaned up? -----
# Just good practice to do a final check on this. Insect orders should remain capitalized. 

# Part 3: Create new columns ------

## 3.1: Create a new column for the duration of time traps were out. ------
# Make sure new column is in the numeric class. 

## 3.2: Create a new column with just the first 5 letters of the InsectOrder ------
# Name new column order_abbrev and make sure it is a factor 

# Part 4: Re-arrange levels of a variable and rearrange rows ------
## 4.1) Arrange levels of insectorder by average number of insects. ------ 
#this will let us create a graph later on of insect orders with the most common on one side and least common on the other side of the x-axis.

## 4.2) Arrange entire dataset by the number of insects ------
# make these descending, so the greatest number is on row 1. 

# Part 5: Print tidied, wrangled database ------
# name file "poll_long_tidy.csv" and put in tidy database


