## code to prepare `fl_county_codes` dataset goes here
# 1.0 create path ----
first.file <- system.file(
        "extdata",
        "countyFips.csv",
        package = "KeyWestMopeds"
)
# 2.0 read in file ----
county_codes <- readr::read_csv(
        first.file
)
# 3.0 create tidy data ----
fl_county_codes <-
        county_codes %>%
        dplyr::filter(state == "Florida") %>%
        select(fips, county) %>%
        mutate(county = gsub(" County", "", county) %>% toupper)

# 4.0 save dataframe as KeyWestMopeds/data/fl_county_codes.rda ----
usethis::use_data(fl_county_codes, overwrite = TRUE, compress = "bzip2")
