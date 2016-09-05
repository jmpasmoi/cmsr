library(readr)

cmsales <- read_csv("data-raw/cmsales.csv")
devtools::use_data(cmsales, overwrite = TRUE)
