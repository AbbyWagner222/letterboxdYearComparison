#load libraries

library(tidyverse)

library(ggpubr)

library(rstatix)

#read csv

diary <- read.csv('/Users/abby/downloads/diary.csv')


#remove unnecessary columns
diary$Date <- NULL
diary$Year <- NULL

#rename Watched Date column
diary <- diary %>%
  rename(date = Watched.Date)


#sort by date watched
diary <- diary %>%
  arrange(date)

#separate date watched by year

diary <- diary %>%
  mutate(year=substr(date,1,4))

#create ggplot for yearly movie counts

yearly_counts <- ggplot(data=diary, aes(x=year))+ geom_bar(fill = heat.colors(3)) + geom_text(stat='count', aes(label=..count..)) + labs(title = "Movies Watched Each Year")

print(yearly_counts)


#create box and whiskers for each year's film ratings

yearly_rating_distributions <- ggsummarystats(diary, x="year", y="Rating", ggfunc = ggboxplot, add = "jitter", color = "year", palette = "heat.colors")

print(yearly_rating_distributions)











