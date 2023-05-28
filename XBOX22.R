setwd("/Users/elliottoates/Desktop/Fifa22")
load("XBOXworkspace.RData")


library(usethis)
library(googlesheets4)
library(rfutbin)
library(tidyverse)
library(R.utils)

write_sheet(read_sheet(ss=ssxb, sheet = "o19", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o20")
write_sheet(read_sheet(ss=ssxb, sheet = "o18", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o19")
write_sheet(read_sheet(ss=ssxb, sheet = "o17", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o18")
write_sheet(read_sheet(ss=ssxb, sheet = "o16", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o17")
write_sheet(read_sheet(ss=ssxb, sheet = "o15", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o16")
write_sheet(read_sheet(ss=ssxb, sheet = "o14", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o15")
write_sheet(read_sheet(ss=ssxb, sheet = "o13", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o14")
write_sheet(read_sheet(ss=ssxb, sheet = "o12", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o13")
write_sheet(read_sheet(ss=ssxb, sheet = "o11", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o12")
write_sheet(read_sheet(ss=ssxb, sheet = "o10", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o11")
write_sheet(read_sheet(ss=ssxb, sheet = "o9", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o10")
write_sheet(read_sheet(ss=ssxb, sheet = "o8", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o9")
write_sheet(read_sheet(ss=ssxb, sheet = "o7", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o8")
write_sheet(read_sheet(ss=ssxb, sheet = "o6", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o7")
write_sheet(read_sheet(ss=ssxb, sheet = "o5", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o6")
write_sheet(read_sheet(ss=ssxb, sheet = "o4", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o5")
write_sheet(read_sheet(ss=ssxb, sheet = "o3", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o4")
write_sheet(read_sheet(ss=ssxb, sheet = "o2", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o3")
write_sheet(read_sheet(ss=ssxb, sheet = "o1", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o2")


ssxb <- "1g-0HmEzmLpgDivQ9CR3i8Vv1BJs4DGMEXS_iVTD_VTk"

options(gargle_oauth_email = TRUE)

nxb <- futbin_scrap(url = "https://www.futbin.com/22/players?page=1&xbox_price=5000-15000000&eLeagues=2118&version=gold_all", platform = "xone", sleep_time = runif(1,6,9))

nxb$Criteria <- paste(nxb$name, "-", nxb$rating, "-", nxb$position, "-", nxb$version)
nxb <- nxb %>% select(1,5,24)
nxb <- rbind(timestamp(),nxb)

write_sheet(read_sheet(ss=ssxb, sheet = "NEW", range = NULL, col_names = TRUE, trim_ws = TRUE), ss=ssxb, sheet="o1")

write_sheet(nxb, ss=ssxb, sheet="NEW")

save.image(file = "XBOXworkspace.RData") 