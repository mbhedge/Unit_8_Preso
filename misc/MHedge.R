library(funModeling) 
library(Hmisc)

# basic EDA commands to look at Beer data
  glimpse(Beers)
  df_status(Beers)
  freq(Beers) 
  profiling_num(Beers)
  plot_num(Beers)
  describe(Beers)

# basic EDA commands to look at Breweries data
  glimpse(Breweries)
  df_status(Breweries)
  freq(Breweries) 
  profiling_num(Breweries)
  plot_num(Breweries)
  describe(Breweries)
  
  str(Beers)
  summary(Beers)
  head(Beers)
  count(Beers)
  length(Beers)

  Beers %>% 
    select(ABV,IBU) %>% 
    ggpairs()
  
  summary(Beers)
  str(Breweries)
  Breweries

  # counts number of breweries in datafile
total_BR=Breweries %>%
  group_by("State") %>% 
  summarise(count=n())

total_BR



p = Breweries %>% 
  ggplot(aes(y=total_BR)) +
  geom_boxplot() #+
  ggplot(Breweries$State)


Beers
Breweries
gg_miss_var(Beers)

All_Beer <-merge(Breweries, Beers, by.x="Brew_ID", by.y = "Brewery_id")
All_Beer

head(All_Beer)

str(Beers)
str(Breweries)
str(All_Beer)


All_Beer %>% 
  select(ABV,IBU,State) %>% 
  ggpairs(aes(color="State"), cardinality_threshold = NULL)

z = All_Beer %>% 
  ggplot(aes(x="state")) +
  geom_histogram() +
  ggplotly()

gg_miss_var(All_Beer)

write.csv(All_Beer,"All_Beer.csv")
gg_miss_var(brewery_count_by_state)
brewery_count_by_state %>% ggplot(aes(x=brewery_count_by_state$count)) +
  geom_histogram() +
  ggplotly()

str(All_Beer)
head(All_Beer)
names(All_Beer)

names(All_Beer)[2] <- "Brewery"
names(All_Beer)[5] <- "Beer"

All_Beer %>% 
  select("State","Brewery") %>% 
  group_by("state") %>% 
  summarize("Brewery")
  
ST_tot <-count(All_Beer, vars = "State") # count ("st_total")
ST_tot
summary(ST_tot)



summarize("st_tot")
summary(All_Beer$ABV)
boxplot(All_Beer$ABV)

cor("st_tot")


head(All_Beer,6)
tail(All_Beer,6)
table("st_tot")


max(All_Beer$ABV,na.rm = TRUE)

max(All_Beer$IBU,na.rm = TRUE)

summary(All_Beer$ABV)


mean(All_Beer$ABV, na.rm=TRUE)
sd(All_Beer$ABV, na.rm=TRUE)


mean(All_Beer$IBU, na.rm=TRUE)
summary(All_Beer$IBU,na.rm=TRUE)
sd(All_Beer$IBU,na.rm=TRUE)
boxplot(All_Beer$IBU, x=0:20)
boxplot(All_Beer$IBU)

head(All_Beer)

max_abv <- All_Beer %>% 
    select(All_Beer, ABV,IBU,State) %>%
  rev(sort(ABV))

adjData %>% group_by("Style") %>% summarize(Median=median(IBU)) %>% 
  ggplot(aes(x="Style", y=Median)) +
  geom_bar(stat="identity") #+
  coord_flip()
  
adjData %>% group_by(Style) %>% summarize(Median=median(Ounces)) %>% 
  ggplot(aes(x=Style, y=Median)) +
  geom_bar(stat="identity") +
  coord_flip()

adjData %>% 
  select(Style, Ounces) %>% 
  ggpairs(aes(color="Style"), cardinality_threshold = NULL)

str(adjData)
