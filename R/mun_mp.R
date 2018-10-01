#' mun_mp
#'
#' A function for the milk mun-protein analysis
#' @keywords dairy cattle MUN
#' @import ggplot2
#' @import dplyr
#' @import viridis
#' @export
#' @examples
#' mun_mp(data = dairyCattle::read_cattle("cattle_data.xls", drop.zero = TRUE, add = TRUE), grid=TRUE)

mun_mp <- function(data, grid = FALSE, density = FALSE, line = FALSE, text = FALSE) {

  plot <- data %>%
    ggplot(aes(x = mun, y = 유단백질, colour=parity)) +
    scale_shape_manual(values = c(1,19)) +
    geom_rug() +
    scale_y_continuous(limits = c(2, 4), breaks = seq(2, 4, 0.5)) +
    scale_x_continuous(limits = c(0, 30), breaks = seq(0, 30, 5)) +
    theme_linedraw(base_family = "NanumGothic") +
    labs(x = "MUN, mg/dL", y = "Milk protein, %")

  if(density == TRUE) {
    plot <- plot +
      stat_density2d(aes(fill=..density..), geom="raster", contour=FALSE) +
      viridis::scale_fill_viridis()
  }

  if(grid == TRUE) {
    plot <- plot +
      facet_grid(parity ~ .) +
      theme(strip.background = element_rect(fill = "black"))
  }

  if(line == TRUE) {
    plot <- plot +
      geom_hline(yintercept = 3.2, color = "grey") +
      geom_hline(yintercept = 3.4, color = "grey") +
      geom_hline(yintercept = 3.0, color = "grey") +
      geom_vline(xintercept = 12, color = "grey") +
      geom_vline(xintercept = 18, color = "grey")
  }

  if(text == TRUE) {
    plot <- plot +
      geom_text(aes(y = 유단백질 - 0.07, label=단축명호), size = 2, vjust = 0)
  }

  plot <- plot +
    geom_point(aes(shape = parity))

  return(plot)
}
