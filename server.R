
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(dplyr)
load("data/londonrepossessions.RData")

shinyServer(function(input, output) {
# reactive({
#  
# })
  output$distPlot <- renderPlot({
    indata= filter(lnd_fnew, year == input$yearselected) 
    fillvar=input$varselected
    ggplot(data = indata, aes_string(x = "long", y = "lat", fill = as.name(fillvar), group = "group")) +
    geom_polygon() + 
    geom_path(colour="black", lwd=0.05) + 
    coord_equal() + 
    scale_fill_gradient2(low = "green", mid = "grey", high = "red", midpoint = 0)
  })

})



