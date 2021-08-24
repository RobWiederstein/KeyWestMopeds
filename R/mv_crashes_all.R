#' Florida motor vehicle crash data 2012 - 2021
#'
#' A dataset containing motorcycle and moped crashes in Florida cities. The data was from
#' two sources: the Florida Department of Transportation (FDOT) and the U.S. Census Bureau.
#' This file shows crash locations for Long-Form-reported crashes within the state of Florida and
#' is subset to those occurring within towns and having a county-city code assigned.
#'
#' @format A data frame with 2,733,425 rows and 21 variables:
#'
#' \describe{
#' \item{xid}{a unique identifier for each crash}
#' \item{calendar_year}{calendar year as string}
#' \item{crash_date}{date of crash as date}
#' \item{crash_time}{four character string for time on 12 hour interval}
#' \item{date}{date formatted as "YYYY-mm-dd"}
#' \item{dayoweek}{three letter abbreviation for day of week (Mon through Sun)}
#' \item{dot_cnty_cd}{Florida Department of Transportation county code}
#' \item{county_txt}{county name}
#' \item{dhsmv_cty_cd}{four digit string unique city code}
#' \item{dhscntycty}{four digit string unique county city code}
#' \item{in_town_flag}{crash in town (Yes) or out of town (No)}
#' \item{injsever}{injury severity (1 None; 2 Possible; 3 Non-Incapacitating;
#' 4 Incapacitating; 5 Fatal (within 30 days); and 6 Non-traffic Fatality}
#' \item{motorcycle_involved}{motorcyle involved (Yes) or not involved (No)}
#' \item{number_of_injured}{integer number of persons injured}
#' \item{number_of_killed}{integer number of persons killed}
#' \item{number_of_serious_injuries}{interger number of persons seriously injured}
#' \item{number_of_pedestrians}{integer number of pedestrians involved}
#' \item{total_drivers}{integer number of drivers}
#' \item{number_of_bicyclists}{integer number of bicyclists}
#' \item{number_of_vehicles}{integer number of vehicles}
#' \item{total_persons}{integer number of persons}
#' \item{impaired_driver}{integer number of impaired drivers (may mean physically or under the influence)}
#' }
#'
#' @note
#'
#' The original dataframe included 158 variables.  A code sheet, while available online,
#' did not match column names or responses.  A variable like "ALCINVCD" presumably was
#' an abbreviation for "alcohol involved" but it was omitted because no explanation
#' could be found.  Additionally, pertinent information on "helmet use" is collected
#' on the uniform long form traffic crash report but could not be found in the variable
#' names.
#'
#' @references
#' Florida Department of Highway Safety and Motor Vehicles, Uniform Traffic
#' Crash Report Manual (Rev'd Feb. 2, 2019)
#'
#' @source \href{https://gis-fdot.opendata.arcgis.com/maps/fdot::crashes-all/about}{FDOT Open Data Hub: Crashes All}
"mv_crashes_all"
