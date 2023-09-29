#load the proper libraries
library(tidyverse)
library(haven)
library(ggplot2)

#read and transform the data
nfhs <- read_dta("IAHR52FL.dta")
hh <- select(nfhs, hhid:shstruc)
hhmem <- select(nfhs, hv009)

#visualize the distribution with a histogram
ggplot(data = hhmem, aes(x = hv009)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(
    title = "Distribution of Listed Household Members",
    x = "Number of Household Members",
    y = "Frequency"
  )

#filter out more specific subsets of the data based on urban area type
hhurban <- filter (nfhs, hv025 == 1)
hhurban$UrbanType <- factor(hhurban$hv026, levels = c(0, 1, 2), labels = c("Large City", "Small City", "Town"))

#visualize the distribution with a boxplot
ggplot(data = hhurban, aes(x = UrbanType, y = hv009)) +
  geom_boxplot(fill = "blue", color = "black") +
  labs(
    title = "Distribution of Household Size by Urban Area Type",
    x = "Urban Area Type",
    y = "Household Size"
  )

#calculate the means and medians to compare the numbers
summary_stats <- hhurban %>%
  group_by(UrbanType) %>%
  summarise(
    Mean_Household_Size = mean(hv009),
    Median_Household_Size = median(hv009)
  )

print(summary_stats)