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

##  Purrr
par(mfrow = c(1,3))
numeric_data <- list(a=rnorm(5, 10, 3), b=rnorm(9, 20, 5), c=rnorm(10, 2, 1))
iwalk(numeric_data, ~hist(.x, main = .y))
iwalk(numeric_data, ~paste0("Mean of ", .y, ": ", mean(.x) %>%  round(1)) %>% print())

##  Define a dataframe of arguments to pass to rnorm
arguments <- expand.grid(n = c(100, 200), mean = c(1, 10), sd = c(1, 10))
##  Create data from rnorm with theses arguments
plot_data <- pmap(arguments, rnorm)

## Change shape of plot area
par(mfrow = c(2,4))

##  Plot the data
iwalk(plot_data, ~hist(.x, main = paste("Element", .y), xlab = "Data values"))



