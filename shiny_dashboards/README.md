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

```{r layout}
library(shinydashboard)
#install.packages("shiny")
library("shiny")

body <- dashboardBody(
  fluidRow(
# Row 1
  box(
    width = 12,
    title = "Regular Box, Row 1",
    "Star Wars"
    )),
# Row 2
    fluidRow(box(
    width = 12,
    title = "Regular Box, Row 2",
    "Nothing but Star Wars"
    )
          )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
                    )
shinyApp(ui, server)


```

#### Layouts

* Column based layout

```{r}
library(shinydashboard)
library("shiny")

body <- dashboardBody(
  fluidRow(
# Column 1
    column(width = 6,
      infoBox(
        width = NULL,
        title = "Regular Box, Column 1",
        subtitle = "Gimme those Star Wars"
      )
    ),
# Column 2
    column(width = 6,
      infoBox(
        width = NULL,
        title = "Regular Box, Column 2",
        subtitle = "Don't let them end"
      )
    )
  )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
                    )
shinyApp(ui, server)
```


* Mixed layout

```{r layout 3 mixed}

library(shinydashboard)
library("shiny")

body <- dashboardBody(
  fluidRow(
# Row 1
  box(
    width = 12,
    title = "Regular Box, Row 1",
    "Star Wars, nothing but Star Wars"
    )
  ),
  fluidRow(
# Column 1
    column(width = 6,
        infoBox(
        width = NULL,
        title = "Regular Box, Row 2, Column 1",
        subtitle = "Gimme those Star Wars"
        )
    ),
# Column 2
    column(width = 6,
      infoBox(
          width = NULL,
          title = "Regular Box, Row 2, Column 2",
          subtitle = "Don't let them end"
          )
    )
  )
)

ui <- dashboardPage(header = dashboardHeader(),
                    sidebar = dashboardSidebar(),
                    body = body
                    )
shinyApp(ui, server)



```

#### Adding CSS




[My examples](https://github.com/reisikei/R/tree/main/Dashboards/Shiny_dashboards)


