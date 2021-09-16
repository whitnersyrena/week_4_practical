### libraries used 
library(ggplot2)
library(tibble)
library(tidyverse)

rm(list=ls())

### QUESTION 1
#Do we really need to write out the equation when R has sd as a standard function? 
y = c(1, 2, 3, 4, 5, 6)
sd_y = sd(y)

### QUESTION 2 
coral_pop = c("Montipora capitata", "Porites compressa", "Porites lobata")
coral = sample(coral_pop, size = 100, replace = TRUE)
status = c("TRUE", "FALSE")
health_status = sample(status, size = 100, replace = TRUE, prob = c(0.8, 0.2))
coral_health_tibble = tibble(data.frame(coral, health_status))

### QUESTION 3 
coral_health_tibble$coral_cover = NA 
coral_health_tibble$coral_cover[coral_health_tibble$health_status == TRUE] = rnorm(n = length(
  coral_health_tibble$coral[coral_health_tibble$health_status == TRUE]), mean = 9, sd = 2)
coral_health_tibble$coral_cover[coral_health_tibble$health_status == FALSE] = rnorm(n = length(
  coral_health_tibble$coral[coral_health_tibble$health_status == FALSE]), mean = 1, sd = 3)

### QUESTIONS 4 
coral_health_tibble$binary_health_status = as.integer(coral_health_tibble$health_status)-1

### QUESTION 5 
ggplot(coral_health_tibble, aes(x=coral_cover, fill=health_status))+scale_fill_manual(values = c("goldenrod", "darkorchid4"))+ 
  geom_histogram(aes(y=..count../sum(..count..)),binwidth = 1, colour = "black")

### Question 6 
ggplot(coral_health_tibble, aes(x=coral_cover, fill=coral))+scale_fill_manual(values = c("goldenrod", "darkorchid4","dodgerblue"))+ 
  geom_density(aes(y=..count../sum(..count..)),adjust=2, colour = "black")+xlim(c(-30,30))

