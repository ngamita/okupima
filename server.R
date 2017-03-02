# Richard Ngamita
# ngamita@gmail.com


library(shiny);
library(datasets);
library(ggplot2)

# Originally should run mysql_connect.R 
# All secure code there for connection to local db
# Assuming everything hosted on the same server. 

# Select on Hum and Temperature. 
# TODO: Richard --> Fix this with dplyr quite slow. 
df_dh <- df[, c('description', 'value', 'timestamp')]
df_rt <- df_dh[df_dh$description %in% c('Temperature','Relative Humidity'),]

shinyServer(
  function(input,output){
    # Getting the right barplots.
    # General Barplot here for Hum and Temps. 
    output$lineplot_a <- renderPlot({
      lp_a <- ggplot(data=df_rt,
                     aes(x=as.Date(timestamp), y=value, colour=description)) +
        geom_line(size = 2)
      print(lp_a)
    })
    
    output$lineplot_n <- renderPlot({
      # Getting the right barplots.
      # General llineplot here for Hum and Temps. 
      # pull out only Noise datasets. 
      df_n <- df_dh[df_dh$description %in% c('Noise Level'),]
      lp_n <- ggplot(data=df_n,
                     aes(x=as.Date(timestamp), y=value, colour=description)) +
        geom_line(size = 2)
      print(lp_n)
    })
    
  
    output$boxplot <- renderPlot({
      # Boxplots of the data. with Outliers. 
            bp <- ggplot(df, aes(x=description, y=value, color = description)) + 
        geom_boxplot() +
        theme(legend.position = 'none')
      print(bp)
    })

    output$boxplot_o <- renderPlot({
      # Boxplots of the data.Remove Outliers. 
      bp_o <- ggplot(df_rt, aes(x=description, y=value, color = description)) + 
        geom_boxplot() +
        theme(legend.position = 'none')
      print(bp_o)
    })
    
    
    
    
    
    output$boxplot_n <- renderPlot({
      # Boxplots of the data.Remove Outliers. 
      bp_n <- ggplot(df_rt, aes(x=description, y=value, color = description)) + 
        geom_boxplot(outlier.shape = NA) +
        theme(legend.position = 'none')
      print(bp_n)
    })
    
  }
)



















