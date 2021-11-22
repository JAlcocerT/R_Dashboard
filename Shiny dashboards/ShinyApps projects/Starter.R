#https://www.youtube.com/watch?v=S8vAC3X-6wM

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

getwd()

library(shiny)
shiny::runApp('./',port=5824, host="0.0.0.0")