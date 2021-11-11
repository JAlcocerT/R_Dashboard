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


{My examples)[https://github.com/reisikei/R/tree/main/Dashboards/Shiny_dashboards]


