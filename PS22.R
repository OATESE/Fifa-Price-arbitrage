setwd("/Users/elliottoates/Desktop/Fifa22")
load("PSworkspace.RData")

library(usethis)
library(googlesheets4)
library(rfutbin)
library(tidyverse)
library(R.utils)

ssps <- "1HFIwpMJJbAVI_TVfYUkrCX56fx_Opb--MVYMnirGzvk"


write_sheet(read_sheet(ss=ssps, sheet = "o9", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o10")
write_sheet(read_sheet(ss=ssps, sheet = "o8", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o9")
write_sheet(read_sheet(ss=ssps, sheet = "o7", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o8")
write_sheet(read_sheet(ss=ssps, sheet = "o6", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o7")
write_sheet(read_sheet(ss=ssps, sheet = "o5", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o6")
write_sheet(read_sheet(ss=ssps, sheet = "o4", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o5")
write_sheet(read_sheet(ss=ssps, sheet = "o3", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o4")
write_sheet(read_sheet(ss=ssps, sheet = "o2", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o3")
write_sheet(read_sheet(ss=ssps, sheet = "o1", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o2")

nps <- futbin_scrap(url = "https://www.futbin.com/22/players?page=1&eLeagues=2118&eUnt=1&ps_price=20000-15000000", sleep_time = runif(1,6,9))

nps$Criteria <- paste(nps$name, "-", nps$rating, "-", nps$position, "-", nps$version)
nps <- nps %>% select(1,5,24)
nps <- rbind(timestamp(),nps)

write_sheet(read_sheet(ss=ssps, sheet = "NEW", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssps, sheet="o1")
write_sheet(nps, ss=ssps, sheet="NEW")

save.image(file = "PSworkspace.RData") 
