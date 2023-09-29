library(tidyverse)
library(haven)

nfhs <- read_dta("IAHR52FL.dta")
hh <- select(nfhs, hhid:shstruc)
