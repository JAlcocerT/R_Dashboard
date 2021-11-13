### R Dashboards

Data visualization is a key part on the discovery and sharing the insights of our investigations, this repository aims to give an overview of the typical packages used in R to build such apps, being some of them interactive.

It can be beneficial the analyses into a web application, especially when interactive exploration of the results are useful.

By executing Flexdashboard.Rmd, the content on the file Index.Rmd and _site.yml are rendered into docs.

* Plotly
* Shiny 
  - <https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/>
  - <https://rstudio.github.io/shiny/tutorial/>
  - My repo with examples <https://github.com/reisikei/R_Dashboard/tree/main/shiny_dashboards>
* RBokeh

For Shiny apps to be active, we need some computer running them, we have several options:

* Just run it locally as a test
* <https://www.shinyapps.io/> uptil 5 free
* dockerize your shiny app and deploy it in the cloud (GCP, AWS...)
