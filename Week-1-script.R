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

hhurban <- filter (nfhs, hv025 == 1)
hhurban$UrbanType <- factor(hhurban$hv026, levels = c(0, 1, 2), labels = c("Large City", "Small City", "Town"))

ggplot(data = hhurban, aes(x = UrbanType, y = hv009)) +
  geom_boxplot(fill = "blue", color = "black") +
  labs(
    title = "Distribution of Household Size by Urban Area Type",
    x = "Urban Area Type",
    y = "Household Size"
  )
