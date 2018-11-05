#' parturition_tbl
#'
#' A time table for parturition of herd.
#' @keywords dairy parturition
#' @import dplyr
#' @export
#' @examples
#' df <- dairyCattle::read_cattle("cattle_data.xls", drop.zero = FALSE, add = TRUE)
#' parturition_tbl(data = df)
#' parturition_tbl(data = df, year = 2018, month = 8)

parturition_tbl <- function(data, year = NULL, month = NULL) {
  data$year_calving <- data$분만예정일 %>% lubridate::year()
  data$month_calving <- data$분만예정일 %>% lubridate::month() %>% factor(levels = c(1:12))


  if (!is.null(year) & !is.null(month)) {
    result <- list(
      tbl = table(data$year_calving, data$month_calving),

      cows = filter(data, year_calving == year & month_calving == month)$단축명호
    )
  } else {
    result <- table(data$year_calving, data$month_calving)
  }


  return(result)
}
