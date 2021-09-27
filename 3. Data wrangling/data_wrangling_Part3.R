# EEOB590: Data wrangling Part 3 ----------


# Part 3: Start subsetting & summarizing 
# 1) Subset data (filter, select)
# 2) Summarize data (summarise)
# 3) Group data (group_by)
# 4) Print tidied, wrangled, summarized database


# 6: Subset data (filter, select) ----------
#use filter to extract rows according to some category
transplant_guam <- transplant %>%
  filter(island == "guam", site == "anao")

#use select to choose columns
basic_transplant <- transplant %>%
  select(island, site, websize, duration)

transplant %>%
  select(island, site, websize, duration)

# 7: Summarize data (summarise, count) ----------
#use summarize to compute a table using whatever summary function you want (e.g. mean, length, max, min, sd, var, sum, n_distinct, n, median)
trans_summ <- transplant %>%
  summarise(avg = mean(websize), numsites = n_distinct(site))

#use count to count the number of rows in each group
count(transplant, site) #base R approach

transplant %>%
  count(site)  #piping approach

# 8: Group data (group_by) ----------
#use group_by to split a dataframe into different groups, then do something to each group

transplant %>%
  group_by(island) %>%
  summarize (avg = mean(websize))

trans_summ <- transplant %>%
  group_by(island, site, netting) %>%
  summarize (avgweb = mean(websize),
             avgduration = mean(duration))


# 9: Print summary database ----------

write.csv(trans_summ, "data/tidy/transplant_summary.csv", row.names=F)
