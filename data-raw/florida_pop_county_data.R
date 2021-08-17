first.file <- system.file(
        "extdata",
        "co-est2019-annres-12.xlsx",
        package = "KeyWestMopeds"
)
# 2.0 read in file ----
df <- readxl::read_xlsx(
        first.file,
        range = "A6:M72",
        col_names = c("county","census", "base", paste0(2010:2019))
)
# 3.0 create tidy data ----
fl_county_pop <-
        df %>%
        select(-c(2,3)) %>%
        pivot_longer(!county, names_to = "year", values_to = "pop") %>%
        mutate(county = gsub("\\.", "", county),
               county = gsub(" County", "", county) %>% toupper,
               year = year %>% as.integer) %>%
        separate(county, into = c("county", NA), sep = ", ")
# 4.0 save dataframe as KeyWestMopeds/data/fl_county_pop.rda ----
usethis::use_data(fl_county_pop, overwrite = TRUE)
