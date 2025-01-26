library(tidyverse)
library(dplyr)

#read csv

diary <- read.csv('/Users/abby/downloads/diary.csv')

#find q3

rating_cutoff <- unname(quantile(diary$Rating, 0.75, na.rm=TRUE))

#create df with only movies with rating at or above cutoff

top_rated_movies <- filter(diary, Rating >= rating_cutoff)

#export top_rated_movies as csv

write.csv(top_rated_movies,"topratedmovies.csv", row.names = FALSE)


