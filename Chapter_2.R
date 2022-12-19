library(tidyverse)
library(lubridate)


data("CO2")

CO2 <- CO2 %>% as_tibble()

##  How many Types?
CO2 %>% pull(Type) %>% unique()
##  And Treatments??
CO2 %>% pull(Treatment) %>% unique()
## And plants?
CO2 %>% pull(Plant) %>% unique()

p <- ggplot(CO2, aes(x = conc, y = uptake)) + geom_point(aes(colour = Treatment))
p <- p + geom_density_2d()
p <- p + theme_minimal()
p

p <- p + facet_wrap( ~ Type)
p
