f <- function(x, dec.points = 0){
  ## Format x to have supplied number of decimal points
  ## Make thousands seperated by commas and the number of decimal points given by
  ##  dec.points
  format(round(x,dec.points), big.mark = ",", nsmall = dec.points)
}

#' Create the data file for the given species by running gfplot routines
#'
#' @param species_name the name of the species or species code as described in gfplot
#' @param file the full path filename including extension .rds
#'
#' @export
#'
#' @examples
#' \dontrun{
#' fetch_data()
#' fetch_data("yelloweye rockfish")
#' }
fetch_data <- function(species_name = "pacific sardine",
                       file = here::here("data", "pacific-sardine.rds")) {
  d <- list()
  d$commercial_samples <- gfplot::get_commercial_samples(species_name)
  d$survey_samples <- gfplot::get_survey_samples(species_name)
  d$catch <- gfplot::get_catch(species_name)
  d$survey_index <- gfplot::get_survey_index(species_name)
  saveRDS(d, file)
}

#' Load the data in from the data file for the given species
#'
#' @param species_name the name of the species or species code as described in gfplot
#' @param file the full path filename including extension .rds
#'
#' @return the contents of the rds file as a list
#'
#' @importFrom rlang abort
#'
#' @export
#'
#' @examples
#' \dontrun{
#' d <- load_data()
#' }
load_data <- function(species_name = "pacific sardine",
                      file = here::here("data", "pacific-sardine.rds")) {
  if(!file.exists(file)){
    stop("Error, file ", file, " does not exist. To create it, run fetch_data().\n")
  }
  readRDS(file)
}
