
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Morgage Possession Orders by year"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("yearselected",
                  "Year:",
                  min = 2004,
                  max = 2009,
                  value = 2004, sep="")
       ,
       selectInput("varselected",label="Column to map",
                   choices=c("total","pct_change"), selected="pct_change")
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
