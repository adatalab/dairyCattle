#' mun_mp_tbl
#'
#' A function makes list for the milk mun-protein analysis
#' @keywords dairy cattle MUN
#' @import dplyr
#' @export
#' @examples
#' mun_mp_tbl(data = dairyCattle::read_cattle("cattle_data.xls", drop.zero = TRUE, add = TRUE))

mun_mp_tbl <- function(data, dataframe = FALSE) {
  # label
  data$mp_criteria <- ifelse(data$유단백질 >= 3.0 & data$유단백질 < 3.4, "3.0-3.4",
                             ifelse(data$유단백질 < 3.0, "< 3.0", "3.4 <"))
  data$mp_criteria <-  factor(data$mp_criteria, levels = c("3.4 <", "3.0-3.4", "< 3.0"))
  data$mun_criteria <- ifelse(data$mun >= 12 & data$mun < 18, "12-18",
                              ifelse(data$mun < 12, "< 12", "18 <"))
  data$mun_criteria <-  factor(data$mun_criteria, levels = c("< 12", "12-18", "18 <"))

  # get the list
  if(dataframe == FALSE) {
    result <- list(Group1 = filter(data, mp_criteria == "3.4 <" & mun_criteria == "< 12")$단축명호,
         Group2 = filter(data, mp_criteria == "3.4 <" & mun_criteria == "12-18")$단축명호,
         Group3 = filter(data, mp_criteria == "3.4 <" & mun_criteria == "18 <")$단축명호,
         Group4 = filter(data, mp_criteria == "3.0-3.4" & mun_criteria == "< 12")$단축명호,
         Group5 = filter(data, mp_criteria == "3.0-3.4" & mun_criteria == "12-18")$단축명호,
         Group6 = filter(data, mp_criteria == "3.0-3.4" & mun_criteria == "18 <")$단축명호,
         Group7 = filter(data, mp_criteria == "< 3.0" & mun_criteria == "< 12")$단축명호,
         Group8 = filter(data, mp_criteria == "< 3.0" & mun_criteria == "12-18")$단축명호,
         Group9 = filter(data, mp_criteria == "< 3.0" & mun_criteria == "18 <")$단축명호,
         summary = table(data$mp_criteria, data$mun_criteria)
  )}

  if(dataframe == TRUE) {
    result <- list(Group1 = filter(data, mp_criteria == "3.4 <" & mun_criteria == "< 12") ,
         Group2 = filter(data, mp_criteria == "3.4 <" & mun_criteria == "12-18") ,
         Group3 = filter(data, mp_criteria == "3.4 <" & mun_criteria == "18 <") ,
         Group4 = filter(data, mp_criteria == "3.0-3.4" & mun_criteria == "< 12") ,
         Group5 = filter(data, mp_criteria == "3.0-3.4" & mun_criteria == "12-18") ,
         Group6 = filter(data, mp_criteria == "3.0-3.4" & mun_criteria == "18 <") ,
         Group7 = filter(data, mp_criteria == "< 3.0" & mun_criteria == "< 12"),
         Group8 = filter(data, mp_criteria == "< 3.0" & mun_criteria == "12-18") ,
         Group9 = filter(data, mp_criteria == "< 3.0" & mun_criteria == "18 <") ,
         summary = table(data$mp_criteria, data$mun_criteria)
  )}

  # return
  return(result)
}

