#' parturition
#'
#' A time table for parturition of herd.
#' @keywords dairy parturition
#' @import ggplot2
#' @import dplyr
#' @import timevis
#' @export
#' @examples
#' parturition(data = dairyCattle::read_cattle("cattle_data.xls", drop.zero = TRUE, add = TRUE))

parturition <- function(data) {
  
  parturition <- data[c("parity","단축명호", "분만예정일", "산차")]
  colnames(parturition) <- c("parity","content","start","산차")
  parturition$end <- NA
  # parturition$start <- as.factor(parturition$start)
  parturition <- filter(parturition, is.na(start) == FALSE)
  
  timevis(parturition)
}

# library(shiny)
# 
# ui <- fluidPage(
#   timevisOutput("timeline")
# )
# 
# server <- function(input, output, session) {
#   output$timeline <- renderTimevis({
#     timevis(parturition)
#   })
# }
# 
# shinyApp(ui = ui, server = server)
# 


