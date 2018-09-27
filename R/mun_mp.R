#' mun_mp
#'
#' A function for mun-milk protein analysis
#' @keywords dairy cattle MUN
#' @import ggplot2
#' @import dplyr
#' @export
#' @examples
#' mun_mp(data = dairyCattle::read_cattle("cattle_data.xls", drop.zero = TRUE, add = TRUE))

mun_mp <- function(data) {

  criteria0 <- data.frame(mun=seq(6,24,length.out=100))
  criteria0$유단백질 <- 3.2
  criteria1 <- data.frame(mun=seq(6,24,length.out=100))
  criteria1$유단백질 <- 3.4
  criteria2 <- data.frame(mun=seq(6,24,length.out=100))
  criteria2$유단백질 <- 3.0
  criteria3 <- data.frame(유단백질=seq(2.2,4,length.out=100))
  criteria3$mun <- 12
  criteria4 <- data.frame(유단백질=seq(2.2,4,length.out=100))
  criteria4$mun <- 18

  data %>%
    ggplot(aes(x=mun,y=유단백질, colour=parity)) +
    stat_density2d(aes(fill=..density..), geom="raster", contour=FALSE) +
    geom_point(aes(shape=parity)) +
    scale_shape_manual(values=c(1,19)) +
    geom_line(data=criteria0, color="grey") +
    geom_line(data=criteria1, color="grey") +
    geom_line(data=criteria2, color="grey") +
    geom_line(data=criteria3, color="grey") +
    geom_line(data=criteria4, color="grey") +
    geom_rug() +
    theme_linedraw(base_family = "NanumGothic")
}
