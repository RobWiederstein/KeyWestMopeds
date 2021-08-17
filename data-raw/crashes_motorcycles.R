## code to prepare `crash_data` dataset goes here

# 1.0 create paths for retrieval ----
first.file <- system.file(
        "extdata",
        "crashes_motorcycle.csv",
        package = "KeyWestMopeds"
)
second.file <- system.file(
        "extdata",
        "tabula-CrashManualComplete.csv",
        package = "KeyWestMopeds"
)

third.file <- system.file(
        "extdata",
        "SUB-IP-EST2019-ANNRES-12-FL.xlsx",
        package = "KeyWestMopeds"
)

# 2.0 read in files ----
mv_crashes <- data.table::fread(
        first.file,
        stringsAsFactors = FALSE,
        encoding = "UTF-8"
)
city_codes <- read.csv(
        second.file,
        stringsAsFactors = FALSE,
        colClasses = "character",
        na.strings = "",
        encoding = "UTF-8"
)
city_pop <- readxl::read_xlsx(
        third.file,
        range = "A5:M416",
        col_names = paste("x", 1:13, sep = "")
)

# 3.0 motorcycle and moped crashes ----
my_columns <- c("xid", "calendar_year", "crash_date", "crash_time", "dayoweek",
                "weekday_txt", "dot_cnty_cd", "county_txt", "dhsmv_cty_cd",
                "dhsmv_cty_cd", "dhscntycty", "in_town_flag", "injsever",
                "alcinvcd", "motorcycle_involved_ind", "number_of_injured", "number_of_killed",
                "number_of_serious_injuries", "number_of_pedestrians", "total_drivers",
                "number_of_bicyclists", "number_of_vehicles", "total_persons"
)


df.m1 <-
        mv_crashes %>%
        janitor::clean_names() %>%
        select(my_columns) %>%
        mutate(city_code = stringr::str_sub(dhscntycty, start = -2)) %>%
        dplyr::filter(!grepl("00", city_code)) %>%
        dplyr::filter(motorcycle_involved_ind == "Y") %>%
        dplyr::filter(in_town_flag == "Y") %>%
        select(-city_code) %>%
        rename(year = calendar_year, city_code = dhscntycty) %>%
        mutate(year = year %>% as.character)

# 4.0 city codes from Uniform Traffic Crash Report Manual Appendix C ----

df.c1 <-
        city_codes %>%
        janitor::clean_names() %>%
        tidyr::drop_na(city_name) %>%
        select(-county_name) %>%
        unite("city_code", county_code:city_code, sep = "") %>%
        rename(city = city_name) %>%
        dplyr::filter(!grepl("STA", city))

# 5.0 merge crash data with city codes ----
df.f <- dplyr::left_join(df.m1, df.c1, by = "city_code")
df.f1 <-
        df.f %>%
        drop_na() %>%
        mutate(city = gsub("Ft ", "Ft. ", city),
               city = gsub("St ", "St. ", city),
               city = city %>% toupper
               )

#sort(unique(df.f1$city))
#Amelia::missmap(df.f1)
# 6.0 census population by city in Florida ----

df.p1 <-
        city_pop %>%
        select(-x2, -x3) %>%
        setNames(c("city", paste0(2010:2019))) %>%
        separate(city, into = c("city", "state"), sep = ", ") %>%
        mutate(city = gsub(" city| town| village", "", city),
               city = city %>% toupper) %>%
        pivot_longer(cols = `2010`:`2019`, names_to = 'year', values_to = 'pop') %>%
        select(-state)

# 7.0 merge crash_data with population ----

df.f2 <- dplyr::left_join(df.f1, df.p1, by = c("year", "city"))
crash_motorcycle <- df.f2 %>% tidyr::drop_na()

# 8.0 save dataframe as KeyWestMopeds/data/crash_data.rda ----
usethis::use_data(crash_motorcycle, overwrite = TRUE)
