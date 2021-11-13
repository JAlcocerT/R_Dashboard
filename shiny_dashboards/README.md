### Intro / Reminder

Shiny is an R package that makes it easy to build highly interactive web apps directly in R. Using Shiny, data scientists can create interactive web apps that allow your team to dive in and explore your data as dashboards or visualizations.

For the dynamic content, there are 2 important functions:

* render*() function that lives in the server part
* *Output() function that lives in the UI part

Remember about <https://www.htmlwidgets.org/>, like the leaftlet package (for interactive maps) <https://rstudio.github.io/leaflet/shiny.html>

More examples <https://rstudio.github.io/shinydashboard/>

<https://www.rstudio.com/resources/webinars/introduction-to-shiny/>

```{r libraries needed}
library(flexdashboard)
library("shinydashboard")
library("shiny")
library("leaflet") #if needed
```

[My examples](https://github.com/reisikei/R/tree/main/Dashboards/Shiny_dashboards)


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

**Inputs functions** are built on the UI section of the dashboard, their ids must be unique and each of them has different needs (check it with ?checkBoxInput, for example)

There are manu **render functions** that works on the server section of the app.

**Output functions**, works on the UI of the app and are based on the render function.

Non-shiny outputs and render functions: there are packages outside shiny that provides ways to have interactivity, thanks for example, to htmlwidgets packages like DT (datatables), leaflet (maps), plotly (interactive plots), etc. that provide highly interactive outputs and can be easily integrated into Shiny apps using almost the same pattern. 

For example, you can turn a static table in a Shiny app into an interactive table using the DT package:

```
Create an interactive table using DT::datatable().
Render it using DT::renderDT().
Display it using DT::DTOutput().

#or plotly vs ggplot2
plotly::renderPlotly() #the code inside the render always with {}
plotly::plotlyOutput()
```

```{r reactive expression refresher}

## Inputs functions

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


## Render functions

# tableOutput
# plotOutput
```



Remember that the code outside the server function will be loaded only once.
The code inside the server function runs every time a new user enters the app.
The code inside the server and inside reactive function, runs with every time the user changes the inputs.

For extra optimization, look in: <https://www.rstudio.com/resources/videos/profiling-and-performance/>


### Customizing style

#### Layouts

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

CSS can be added on the same code is by saving a my_style.CSS in the same folder as the shiny dashboard (tag$link) or doing it in line in the code (tag$style)


```{r layout css 2}

library("shiny")

body <- dashboardBody(
# Update the CSS
  tags$head(
        tags$style(
            HTML('
            \\Add CSS here
            h3 {
            font-weight: bold;
            }
            ')
        )
    ),
  fluidRow(
    box(
      width = 12,
      title = "Regular Box, Row 1",
      "Star Wars, nothing but Star Wars"
    )
  ),
  fluidRow(
    column(width = 6,
      infoBox(
        width = NULL,
        title = "Regular Box, Row 2, Column 1",
        subtitle = "Gimme those Star Wars"
    )
   ),
    column(width = 6,
      infoBox(
        width = NULL,
        title = "Regular Box, Row 2, Column 2",
        subtitle = "Don't let them end"
    )
  )
 )
)

ui <- dashboardPage(
  skin = "purple",
  header = dashboardHeader(),
  sidebar = dashboardSidebar(),
  body = body)
shinyApp(ui, server)

```

#### Icons, statuses and colors

* Icons: fa --> font awsome <https://fontawesome.com/v5.15/icons?d=gallery&p=2> <https://fontawesome.com/v4.7/examples/> <https://getbootstrap.com/docs/3.3/components/>

```{r layout icons}

library("shiny") 

header <- dashboardHeader(
  dropdownMenu(
    type = "notifications",
    notificationItem(
      text = "The International Space Station is overhead!",
      icon = icon("rocket")
    )
  )
)
ui <- dashboardPage(header = header,
                    sidebar = dashboardSidebar(),
                    body = dashboardBody()
                    )
shinyApp(ui, server)


```

* Statuses: ?validStatuses

* Colors: ?validColors

```{r layout icons}

library("shiny") 

header <- dashboardHeader(
  dropdownMenu(
    type = "notifications",
    notificationItem(
      text = "The International Space Station is overhead!",
      icon = icon("rocket")
    )
  )
)
ui <- dashboardPage(header = header,
                    sidebar = dashboardSidebar(),
                    body = dashboardBody()
                    )
shinyApp(ui, server)


```




