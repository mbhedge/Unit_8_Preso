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
    select(ABV,IBU,Ounces) %>% 
    ggpairs()
  
  summary(Beers)
  str(Breweries)
  Breweries

total_BR=count(Breweries$State)

p = Breweries %>% 
  ggplot(aes(y=total_BR)) +
  geom_boxplot() +
  ggplotly(Breweries$State)

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
  ggpairs(aes(color="State"), cardinality_threshold = NULL, bins)

z = All_Beer %>% 
  ggplot(aes(x="state")) +
  geom_histogram() +
  ggplotly()

gg_miss_var(All_Beer)

write.csv(All_Beer,"All_Beer.csv")
