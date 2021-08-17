## code to prepare `crash_all` dataset goes here

# 1.0 create paths for retrieval ----
first.file <- system.file(
        "extdata",
        "crashes_all.csv",
        package = "KeyWestMopeds"
)
# 2.0 read in files ----
select <- c("XID", "CALENDAR_YEAR", "CRASH_DATE", "CRASH_TIME", "DAYOWEEK", "DOT_CNTY_CD", "COUNTY_TXT", "DHSMV_CTY_CD",
  "DHSCNTYCTY", "IN_TOWN_FLAG", "INJSEVER", "MOTORCYCLE_INVOLVED_IND",
  "NUMBER_OF_INJURED", "NUMBER_OF_KILLED", "NUMBER_OF_SERIOUS_INJURIES",
  "NUMBER_OF_PEDESTRIANS", "TOTAL_DRIVERS", "NUMBER_OF_BICYCLISTS",
  "NUMBER_OF_VEHICLES", "TOTAL_PERSONS", "IMPAIRED_DRIVER_IND")

df <- data.table::fread(
        first.file,
        select = select,
        colClasses = "character"
)

# 3.0 variable names ----
df <- df %>% janitor::clean_names()
# 4.0 create tidy data ----
mv_crashes_all <-
        df %>%
        mutate(crash_date = stringr::str_sub(crash_date, end =10),
               crash_date = crash_date %>% as.Date(format = "%Y/%m/%d")) %>%
        mutate(dayoweek = dayoweek %>% factor(ordered = T,
                labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))) %>%
        mutate(injsever= na_if(injsever, "0")) %>%
        mutate(injsever = factor(injsever, ordered = T, levels=c(1:6),
                                 labels = c("None", "Possible", "NonInc",
                                            "Incap", "Fatal", "NonTraf")
        )
        ) %>%
        mutate(impaired_driver_ind = factor(impaired_driver_ind,
                                            levels = c("Y", "N"),
                                            labels = c("Yes", "No")
        )
        ) %>%
        rename(impaired_driver = impaired_driver_ind) %>%
        mutate(in_town_flag = factor(in_town_flag,
                                     levels = c("Y", "N"),
                                     labels = c("Yes", "No")
                                     )
               ) %>%
        mutate(motorcycle_involved_ind = factor(motorcycle_involved_ind,
                                                levels = c("Y", "N"),
                                                labels = c("Yes", "No")
                                                )
               ) %>%
        rename(motorcycle_involved = motorcycle_involved_ind) %>%
        mutate(across(number_of_injured:total_persons, as.integer))
# "ALCINVCD" omitted because couldn't find codes
# Couldn't find code for helmet use either though they're both on report

# 5.0 save dataframe as KeyWestMopeds/data/fl_crashes_all.rdb
usethis::use_data(mv_crashes_all, overwrite = TRUE)
