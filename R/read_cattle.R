#' read_cattle
#'
#' This import the cattle data from http://www.aiak.or.kr.
#' @param file file path
#' @param na.rm remove the dataset that milk yeild == 0.
#' @keywords dairy cattle
#' @import janitor
#' @import dplyr
#' @import lubridate
#' @import readxl
#' @export
#' @examples
#' read_cattle("test.xlsx",na.rm=TRUE)
#' read_cattle("test.xlsx",na.rm=FALSE)

read_cattle <- function(file, na.rm=FALSE) {
  
  # package
  stopifnot(require(janitor), require(dplyr), require(lubridate), require(readxl))
  
  df <- readxl::read_excel(file)
  df <- janitor::clean_names(df,case = "lower_camel")
  df[,c(4,6,7,8,26,30)] <- lapply(df[,c(4,6,7,8,26,30)],FUN = ymd)
  
  if(na.rm==TRUE) {
    df <- dplyr::filter(df, 유량 > 0)
  }
  
  return(df)
}
