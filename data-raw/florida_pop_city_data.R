first.file <- system.file(
        "extdata",
        "SUB-IP-EST2019-ANNRES-12-FL.xlsx",
        package = "KeyWestMopeds"
)
# 2.0 read in file ----
fl_city_pop <- readxl::read_xlsx(
        first.file,
        range = "A5:M416",
        col_names = paste("x", 1:13, sep = "")
)
# 3.0 create tidy data ----
fl_city_pop <-
        fl_city_pop %>%
        select(-x2, -x3) %>%
        setNames(c("city", paste0(2010:2019))) %>%
        separate(city, into = c("city", "state"), sep = ", ") %>%
        mutate(city = gsub(" city| town| village", "", city),
               city = city %>% toupper) %>%
        pivot_longer(cols = `2010`:`2019`, names_to = 'year', values_to = 'pop') %>%
        select(-state)

# 4.0 save dataframe as KeyWestMopeds/data/crash_data.rda ----
usethis::use_data(fl_city_pop, overwrite = TRUE)
