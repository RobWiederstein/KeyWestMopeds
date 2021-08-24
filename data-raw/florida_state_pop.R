## code to prepare `fl_pop_data` dataset goes here

# 1.0 create path ----
first.file <- system.file(
        "extdata",
        "nst-est2019-01.xlsx",
        package = "KeyWestMopeds"
)
# 2.0 read-in data ----
fl_pop <- readxl::read_xlsx(
        first.file,
        range = "A19:M19",
        col_names = FALSE
)
# 3.0 create tidy data ----
fl_state_pop <-
        fl_pop %>%
        select(c(-2, -3)) %>%
        setNames(c("state", paste0(2010:2019))) %>%
        mutate(state = gsub("\\.", "", state)) %>%
        pivot_longer(!state, names_to = "calendar_year", values_to = "pop") %>%
        mutate(calendar_year = calendar_year %>% as.integer)

# 4.0 save dataframe as KeyWestMopeds/data/fl_pop_data.rda ----
usethis::use_data(fl_state_pop, overwrite = TRUE, compress = "bzip2")

