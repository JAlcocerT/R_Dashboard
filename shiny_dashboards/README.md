### Static dashboards

```{r example 1}
#install.packages("shinydashboard")
library("shinydashboard")
        
header <- dashboardHeader()
sidebar <- dashboardSidebar()
body <- dashboardBody()


ui <- dashboardPage(header,sidebar,body)
server <- function(input, output) {}
shiny::shinyApp(ui,server)

```

#### TabBoxes

we can add boxes within each of the body's tabs (and there can be tabs within the boxes!) You can add a tabBox() directly to the dashboardBody() or place it within a tabItem()


```{r example 2}
library("shiny")
body <- dashboardBody(
  # Create a tabBox
  tabItems(
    tabItem(
      tabName = "dashboard",
      tabBox(
        title = "International Space Station Fun Facts",
        tabPanel("Fun Fact 1", "Content for the first tab"),
        tabPanel("Fun Fact 2", "Content for the second tab")
          )
    ),
    tabItem(tabName = "inputs")
  )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = sidebar,
                    body = body
                    )
shinyApp(ui, server)
```


### Dynamic dashboards


```{r reactive expression refresher}

## Inputs

# action buttons

# checkbox input

# date input

# numeric input

# radio buttons

# select input

# slider input

# text input

## Render functions: each render function normally has a corresponding output function.

#The output function lives in the UI

#render print

server <- function(input, output){
  
  output$printed_object <- renderPrint({
    "print me"
  })
}

# render text

# render table

# render datatable

# render plot

# render image

# render UI: html or a shiny tag object

```



Remember that the code outside the server function will be loaded only once.
The code inside the server function runs every time a new user enters the app.
The code inside the server and inside reactive function, runs with every time the user changes the inputs.

For extra optimization, look in: <https://www.rstudio.com/resources/videos/profiling-and-performance/>


### CUstomizing style


Shiny uses the boostrap grid layout system.

* Row based layout
* Column based layout
* Mixed layout





[My examples](https://github.com/reisikei/R/tree/main/Dashboards/Shiny_dashboards)


