# Richard Ngamita
# ngamita@gmail.com
# ui.R file for the shiny app
# This app is developed to help in visualising the airquality dataset in R
# To be improved to pull in PiMaa data for monitoring airquality in Kampala.

library(shiny)
library(markdown)

shinyUI(navbarPage("Airquality Data",
  tabPanel("Graphs",
  
  sidebarLayout(
    sidebarPanel(
      h3("Histogram"),
      helpText("Select a variable to plot a histogram."),
      radioButtons("plot","Variable",
                   c("Temperature"="var0",
                     "Relative Humidity"="var1",
                     "Gas Concentration"="var2"
                   )),
      hr(),
      h3("Scatterplot with regression line"),
      helpText("Select a factor to plot and show regression line for Gas Concentration."),
        selectInput("varx", "X factor:",
                    choices =c("var0","var1")
                   )
    ),
    mainPanel(
      plotOutput("lineplot_a", height="300px"),
      plotOutput("lineplot_n", height="300px"),
      plotOutput("boxplot", height="300px"),
      plotOutput("boxplot_o", height="300px"),
      plotOutput("boxplot_n", height="300px")
      
      
      
    )
  )
),
  
  tabPanel("Tables",
     mainPanel(
        includeMarkdown("about.md")
     )
  )
)
)
