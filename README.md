### R Dashboards

Data visualization is a key part on the discovery and sharing the insights of our investigations, this repository aims to give an overview of the typical packages used in R to build such apps, being some of them interactive.

It can be beneficial the analyses into a web application, especially when interactive exploration of the results are useful.

By executing Flexdashboard.Rmd, the content on the file Index.Rmd and _site.yml are rendered into docs.

* Plotly (interactive)
* Shiny (hosted, UI interactive)
  - <https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/>
  - <https://rstudio.github.io/shiny/tutorial/>
  - My repo with examples <https://github.com/reisikei/R_Dashboard/tree/main/shiny_dashboards>
* RBokeh
* Dash (R) <https://dashr.plotly.com/>

For Shiny apps to be active, we need some computer running them, we have several options:

* Just run it locally as a test
* <https://www.shinyapps.io/> uptil 5 free
* dockerize your shiny app and deploy it in the cloud (GCP, AWS...)


#### Data sources

Population Census:
<https://www.nber.org/research/data?page=1&perPage=100&q=population>
<https://www.census.gov/programs-surveys/popest.html>

Maps shapefiles:

Look for 'census gob shape files' and go to TIGER/Line shapefiles, the link might be different over time: <https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html>

Editor for maps data: <https://mapshaper.org/>
