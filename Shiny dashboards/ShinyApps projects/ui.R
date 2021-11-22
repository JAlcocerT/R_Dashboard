library(plotly)




ui <- fluidPage(
  titlePanel("Index nominal vs real value"),
  
  sidebarPanel(
    sliderInput("Year_from", "Since the year:", 
                min = 1970, max = strtoi(format(Sys.Date(),format="%Y"))-1,
                value = 2000,
                step=1,
                width = "50%"),
    sliderInput("Year_to", "To the year:", 
                min = 1970, max = strtoi(format(Sys.Date(),format="%Y")),
                value = strtoi(format(Sys.Date(),format="%Y")),
                step=1,
                width = "50%")
  ),
  
  
  # MODIFY CODE BELOW: Create a tab layout for the dashboard
  mainPanel(
    textOutput("info"),
    br(),
    br(),
    plotlyOutput("plot_3", height = "80%"),
    br(),
    br(),
    plotlyOutput("plot_variation_box")
  )
)
