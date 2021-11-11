## Flexdashboards

* <https://rmarkdown.rstudio.com/lesson-12.html>
* <https://pkgs.rstudio.com/flexdashboard/articles/examples.html>
* <https://www.htmlwidgets.org/>

Dashboards are a popular way to present data in a cohesive visual display.
How to assemble your results into a polished dashboard using the R flexdashboard package.
This can be as simple as adding a few lines of R Markdown to your existing code, or as rich as a fully interactive Shiny-powered experience

### Layout

Remember the importance of Rmd headers:
```
---
title: "Flex Dashboards"
output: 
  flexdashboard::flex_dashboard
---
```

By default all charts are appearing in a single column, but it can be customized

```
---
title: "Flex Dashboards"
author: JAT
output: 
  flexdashboard::flex_dashboard:
    orientation: column
    verical_layout: scroll
---
```


Also dropdown menus,pages tabsets columns vs rows are possible to be customized in the code.


### Plots

R default graphs can be included
but more web friendly options are:

* [Plotly](https://plotly.com/r/)

```{r}
library(plotly)
ggplotly(my_gg_plot_code)
```


* highcharter
* dygraphs
* rbokeh
* ggvis

##### html widgets

[html widgets](https://www.htmlwidgets.org/) are based on a framework that connects
R with js.

each html widget requires some learning:

* Plotly is one of them
* [Leaflet](http://rstudio.github.io/leaflet/) is another, useful for map representations with lat and log + map

```{r interactive map with markers example}
library(leaflet)

leaflet() %>%
addTiles() %>%
addMarkers(lng = data_df$longitude, lat = data_df$latitude)
```


### Tables

* Basic tables

```
library(knitr)
kable(my_data_df)
```

* Web-friendly alternative - The htmlwidget package DT:

```
library(DT)
datatable(my_data_df)
```

The [DT package](https://rstudio.github.io/DT/) allows a lot of customization, like buttons for the user to export the data.

### Text

#### Captions or notes 

appear in the bottom of the selected chart

#### Storyboards

it needs storyboard: true in the flexdashboard's header
comments are done here with ***

Story board can be included in some selected pages only, just avoid the true in the header and include {.storyboard} next to the page's name


### Shiny in flexdashboards (not a shiny app)

It provides extra interactivity, as well as complexity and hosting (or local run) is required
remember that after adding shiny to the flexdashboard, the html output its not enough to see the created web

we need in the header: runtime: shiny


user inputs are collected using shiny widgets, the same that we would use in a normal shiny app
but here the widget dont need to appear within a page layout or UI section,
here the inputs goes in a normal r chunk that goes in a flexdashboard column like any other flexdash component

reactive df are not df objects, its aw function that returns the df specified by the code

in every output that now rellies on the dynamic output of the df, we need to include the
appropiate render output function, like renderLeaflet({)}

[My examples](https://github.com/reisikei/R/tree/main/Dashboards/Flexdashboards/Examples)
