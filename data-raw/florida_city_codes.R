## code to prepare `florida_city_codes` dataset goes here
# 1.0 create path ----
first.file <- system.file(
        "extdata",
        "tabula-CrashManualComplete.csv",
        package = "KeyWestMopeds"
)
# 2.0 read in file ----
city_codes <- read.csv(
        first.file,
        stringsAsFactors = FALSE,
        colClasses = "character",
        na.strings = "",
        encoding = "UTF-8"
)
# 3.0 create tidy data ---
fl_city_codes <-
        city_codes %>%
        janitor::clean_names() %>%
        tidyr::drop_na(city_name) %>%
        select(-county_name) %>%
        unite("city_code", county_code:city_code, sep = "") %>%
        rename(city = city_name) %>%
        dplyr::filter(!grepl("STA", city)) %>%
        mutate(city = city %>% toupper)

# 4.0 save dataframe as KeyWestMopeds/data/florida_city_codes_data.rda ----
usethis::use_data(fl_city_codes, overwrite = TRUE)
