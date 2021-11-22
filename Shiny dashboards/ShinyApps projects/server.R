library(shiny)
library(shinythemes)
library(shinyWidgets)

library(ggplot2)
library(plotly)

require(scales)
library("readxl")
library(dtplyr)
library(tidyverse)


library(priceR) #adjust_for_inflation()
library(BatchGetSymbols) #get.clean.data()



months_start <- function(df)
{
  
  df1 <- data.frame(df$price.close,df$ref.date)
  names(df1)[1] <- "Index"
  names(df1)[2] <- "Dates"
  
  df1 <- df1 %>% 
    mutate(dates = as.Date(Dates)) %>% 
    mutate(yr_mnth = format(Dates, '%Y-%m')) %>% 
    group_by(yr_mnth) %>% 
    filter(Dates == min(Dates)) #    filter(Dates == max(Dates)) to have the last day
  
  
  return(df1)
}



percentage_difference <- function(my_df,column_name)
{
  
  percentage_difference=rep(0,nrow(my_df))
  percentage_difference[1] <- 0
  
  for(i in 2:nrow(my_df)){
    percentage_difference[i] <- 100*(my_df[i,column_name]-my_df[i-1,column_name])/my_df[i-1,column_name]
  }
  
  my_df["percentage_differenced"] <- unlist(percentage_difference)
  
  return(my_df)
}





Index_df <- get.clean.data('^GSPC',
                           first.date = as.Date('1970-01-01'),
                           last.date = Sys.Date())

Index_df <- months_start(Index_df)
names(Index_df)[1] <- "SP500"

Index_df["real_SP500"] <- adjust_for_inflation(Index_df$SP500, format(Index_df$Dates, format = "%Y"), "US", to_date = 2020)
Index_df<- percentage_difference (Index_df,"SP500")    


Index_df["decades"] <- strtoi(format(Index_df$Dates,format="%Y")) - strtoi(format(Index_df$Dates,format="%Y")) %% 10







a<-(Index_df$real_SP500[nrow(Index_df)]/Index_df$real_SP500[1])
b<-strtoi(format(Index_df$Dates[nrow(Index_df)],format="%Y"))-strtoi(format(Index_df$Dates[1],format="%Y"))  
anualized_real_growth <- (a^(1/b)-1)*100

a<-(Index_df$SP500[nrow(Index_df)]/Index_df$SP500[1])
b<-strtoi(format(Index_df$Dates[nrow(Index_df)],format="%Y"))-strtoi(format(Index_df$Dates[1],format="%Y"))
anualized_nominal_growth <- (a^(1/b)-1)*100









function(input, output) {
  
  
  ## DF
  
  data_frame <- reactive({
    
    e <- Index_df %>% filter( strtoi(format(Dates,format="%Y")) >= input$Year_from && strtoi(format(Dates,format="%Y")) <= input$Year_to)
    
  })
  
  ## Graph
  
  
  output$plot_variation_box <- renderPlotly({
    
    data_frame() %>%  plot_ly(x = ~decades, y = ~percentage_differenced, type = "box") %>%   
      layout(title = 'Monthly index variation percentages by decade', 
             xaxis = list(title = 'Decade'), 
             yaxis = list(title = 'Variation (Monthly %)'))
    
    
  })
  
  
  
  output$plot_3 <- renderPlotly({
    
    data_frame() %>% 
      ungroup() %>%
      plot_ly(x = ~Dates, y = ~real_SP500, name = 'SP500 inflation corrected', type = 'scatter', mode = 'lines')  %>% 
      add_trace(y = ~SP500, name = 'SP500 value', mode = 'lines') %>%   
      layout(title = 'SP500 trend',
             xaxis = list(title = 'Year'),
             yaxis = list(title = 'SP500 (Real vs nominal $)'))
    
  })
  
  
  
  ## Text
  output$info <- renderText({
    
    
    a<-(data_frame()$real_SP500[nrow(data_frame())]/data_frame()$real_SP500[1])
    b<-strtoi(format(data_frame()$Dates[nrow(data_frame())],format="%Y"))-strtoi(format(data_frame()$Dates[1],format="%Y"))  
    anualized_real_growth <- (a^(1/b)-1)*100
    
    a<-(data_frame()$SP500[nrow(data_frame())]/data_frame()$SP500[1])
    b<-strtoi(format(data_frame()$Dates[nrow(data_frame())],format="%Y"))-strtoi(format(data_frame()$Dates[1],format="%Y"))
    anualized_nominal_growth <- (a^(1/b)-1)*100
    
    
    
    paste("In the selected period, there was an anualized nominal growth rate of: ",
          formatC(anualized_nominal_growth, format = "f", digits = 2),
          "% and a anualized real growth rate of: ",
          formatC(anualized_real_growth, format = "f", digits = 2),
          "%")
    
  })
  
}

  
  
