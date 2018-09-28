#' mun_mp
#'
#' A function for mun-milk protein analysis
#' @keywords dairy cattle MUN
#' @import ggplot2
#' @import dplyr
#' @import viridis
#' @export
#' @examples
#' mun_mp(data = dairyCattle::read_cattle("cattle_data.xls", drop.zero = TRUE, add = TRUE), grid=TRUE)

mun_mp <- function(data, grid=FALSE) {

  plot <- data %>%
    ggplot(aes(x=mun,y=유단백질, colour=parity)) +
    stat_density2d(aes(fill=..density..), geom="raster", contour=FALSE) +
    scale_fill_viridis() +
    geom_point(aes(shape=parity)) +
    scale_shape_manual(values=c(1,19)) +
    geom_hline(yintercept = 3.2, color = "grey") +
    geom_hline(yintercept = 3.4, color = "grey") +
    geom_hline(yintercept = 3.0, color = "grey") +
    geom_vline(xintercept = 12, color = "grey") +
    geom_vline(xintercept = 18, color = "grey") +
    geom_rug() +
    theme_linedraw(base_family = "NanumGothic") +
    labs(x = "MUN", y = "Milk protein")

  if(grid == TRUE) {
    return(
      plot +
      facet_grid(parity ~ .) +
      theme(strip.background = element_rect(fill = "black"))
    )
  } else {
    return(plot)
  }


}
