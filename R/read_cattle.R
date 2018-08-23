#' read_cattle
#'
#' This import the cattle data from http://www.aiak.or.kr.
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
#' read_cattle(path="result.xls",drop.zero=TRUE)
#' read_cattle(path="result.xls",drop.zero=FALSE,add=TRUE)

read_cattle <- function(path, drop.zero=FALSE, add=FALSE) {

  # package
  stopifnot(
    require(janitor),
    require(dplyr),
    require(lubridate),
    require(readxl)
  )

  df <- if(grepl(".xls", path) == TRUE | grepl(".xlsx", path) == TRUE) {
    readxl::read_excel(path)
  } else {read.csv(path)}
  df <- janitor::clean_names(df,case = "lower_camel")
  df[,c(4,6,7,8,26,30)] <- lapply(df[,c(4,6,7,8,26,30)],FUN = ymd)
  df$분만후첫수정일까지일수 <- as.numeric(df$분만후첫수정일까지일수)
  df$산차 <- as.numeric(df$산차)

  if(drop.zero==TRUE) {
    df <- dplyr::filter(df, 유량 > 0)
  }

  if(add==TRUE) {
    # 분만예정일
    df$분만예정일 <- ifelse(
      df$최종수정일자+280>today(),
      df$최종수정일자+280,
      NA)
    df$분만예정일 <- as.Date(df$분만예정일, origin = "1970-01-01")

    # parity
    df$parity <- ifelse(
      df$산차>1,
      "Multiple",
      ifelse(df$산차==1,"First",NA))
  }

  return(df)
}
