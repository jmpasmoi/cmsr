library(readr)

cmsales <- read_csv("data-raw/cmsales.csv")
devtools::use_data(cmsales, overwrite = TRUE)

cmstelecom <- read_csv("data-raw/cmstelecom.csv")
devtools::use_data(cmstelecom, overwrite = TRUE)
