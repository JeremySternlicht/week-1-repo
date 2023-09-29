library(tidyverse)
library(haven)
library(ggplot2)

nfhs <- read_dta("IAHR52FL.dta")
hh <- select(nfhs, hhid:shstruc)
hhmem <- select(nfhs, hv009)

ggplot(data = hhmem, aes(x = hv009)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(
    title = "Distribution of Listed Household Members",
    x = "Number of Household Members",
    y = "Frequency"
  )
