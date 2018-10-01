#' fat_prot
#'
#' A function for the milk fat-protein analysis of the herd.
#' @keywords dairy cattle milk fat protein
#' @import ggplot2
#' @import dplyr
#' @import viridis
#' @export
#' @examples
#' fat_prot(data = dairyCattle::read_cattle("cattle_data.xls", drop.zero = TRUE, add = TRUE), grid = FALSE, density = FALSE, line = FALSE, text = FALSE)

fat_prot <- function(data, grid = FALSE, density = FALSE, line = FALSE, text = FALSE) {
  model <- lm(유단백질 ~ 유지율, data)
  xmin <- min(data$유지율)
  xmax <- max(data$유지율)
  predicted <- data.frame(유지율=seq(xmin,xmax, length.out=100))
  predicted$유단백질 <- predict(model, predicted)
  
  plot <- data %>%
    ggplot(aes(x = 유지율, y = 유단백질, color = parity))
  
  if(density == TRUE) {
    plot <- plot + 
      stat_density2d(aes(fill=..density..), geom="raster", contour=FALSE) +
      viridis::scale_fill_viridis(option = "A")
  }
  
  if(grid == TRUE) {
    plot <- plot +
      facet_grid(parity ~ .) +
      theme(strip.background = element_rect(fill = "black"))
  }
  
  if(line == TRUE) {
    plot <- plot +
      # geom_vline(xintercept = 305, color = "grey") +
      geom_vline(xintercept = mean(data$유지율), color = "grey") +
      geom_vline(xintercept = median(data$유지율), color = "grey", linetype="dashed") +
      geom_hline(yintercept = mean(data$유단백질), color = "grey") +
      geom_hline(yintercept = median(data$유단백질), color = "grey", linetype="dashed") +
      geom_line(data=predicted, size=0.5, color = "grey")
  }
  
  if(text == TRUE) {
    plot <- plot +
      geom_text(aes(y = 유단백질 - 0.05, label=단축명호), size = 2, vjust = 0)
  }
  
  plot <- plot +
    geom_point(aes(shape = parity)) +
    scale_shape_manual(values = c(1,19)) +
    geom_rug() +
    theme_linedraw(base_family = "NanumGothic") +
    # scale_x_continuous(breaks = seq(0, 400, 50)) +
    labs(x = "Milk fat, %", y = "Milk protein, %")
  
  return(plot)
}
