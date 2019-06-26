#' read_cattle_all
#'
#' This import the multiple cattle data from http://www.aiak.or.kr. please locate the xls files in the working directory.
#' @param path path to the xls/xlsx/csv/txt file.
#' @param drop.zero remove the dataset that milk yeild == 0.
#' @param add add some columns for additional analysis.
#' @keywords dairy cattle
#' @import janitor
#' @import dplyr
#' @import lubridate
#' @import readxl
#' @export
#' @examples
#' read_cattle_all(drop.zero = TRUE)
#' read_cattle_all(drop.zero = FALSE, add = TRUE)


read_cattle_all <- function(drop.zero = TRUE, add = TRUE) {
  nm <- list.files()
  nm <- subset(nm, grepl(".xls", nm) == TRUE | grepl(".xlsx", nm) == TRUE | grepl(".csv", nm) == TRUE | grepl(".txt", nm) == TRUE)

  result <- do.call(rbind, lapply(nm, FUN = function(x) dairyCattle::read_cattle(x, add = TRUE, drop.zero = TRUE)))
  return(result)
}


