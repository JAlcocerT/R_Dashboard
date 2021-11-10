Dashboards are a popular way to present data in a cohesive visual display.
How to assemble your results into a polished dashboard using the R flexdashboard package.
This can be as simple as adding a few lines of R Markdown to your existing code, or as rich as a fully interactive Shiny-powered experience


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

Also dropdown menus,pages tabsets columns vs rows.

R default graphs can be included
but more web friendly options are:
* plotly 

```{r}
library(plotly)
ggplotly(my_gg_plot_code)
```


* highcharter
* dygraphs
* rbokeh
* ggvis
