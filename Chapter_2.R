library(tidyverse)
library(lubridate)


data("CO2")

CO2 <- CO2 %>% as_tibble()

##  How many Types?
CO2 %>% pull(Type) %>% unique()
##  And Treatments?
CO2 %>% pull(Treatment) %>% unique()

p <- ggplot(CO2) + geom_point(aes(x = conc, y = uptake, colour = Treatment))
p <- p + theme_minimal()
p

p <- p + facet_wrap( ~ Type)
p
