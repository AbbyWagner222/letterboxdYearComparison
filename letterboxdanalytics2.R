library(tidyverse)

#read csv

diary <- read.csv('/Users/abby/downloads/diary.csv')

#find overall stats

overall_mean_rating <- mean(diary$Rating, na.rm=TRUE)

overall_median_rating <- median(diary$Rating, na.rm=TRUE)

overall_sd <- sd(diary$Rating, na.rm=TRUE)

overall_iqr <- IQR(diary$Rating, na.rm=TRUE)

#find if normally distributed ala Shapiro Wilk test

is_normal_overall <- shapiro.test(diary$Rating)



#find yearly stats

diary <- diary %>%
  mutate(year_watched=substr(Watched.Date,1,4))

years_encompassed <- unique(diary$year_watched, na.rm = TRUE)

#create list of means for each year
yearly_mean_ratings <- list()

#for each year in years_encompassed, find mean
for (i in years_encompassed)
{
  year_average <- mean(diary$Rating[diary$year_watched == i], na.rm = TRUE)
  #add year to yearly_mean_ratings list
  yearly_mean_ratings <- append(yearly_mean_ratings, i)
  #add calculated mean to yearly_mean_ratings list
  yearly_mean_ratings <- append(yearly_mean_ratings, year_average)
}
#list should now be ordered in (yearA, meanA, yearB, meanB...) format


#repeat process for yearly_median_ratings
yearly_median_ratings <- list()

for (i in years_encompassed)
{
  year_median <- median(diary$Rating[diary$year_watched == i], na.rm = TRUE)
  yearly_median_ratings <- append(yearly_median_ratings, i)
  yearly_median_ratings <- append(yearly_median_ratings, year_median)
}


#repeat process for yearly_sd_ratings
yearly_sd_ratings <- list()

for (i in years_encompassed)
{
  year_sd <- sd(diary$Rating[diary$year_watched == i], na.rm = TRUE)
  yearly_sd_ratings <- append(yearly_sd_ratings, i)
  yearly_sd_ratings <- append(yearly_sd_ratings, year_sd)
}


