# 
library(shiny);
library(datasets);
library(ggplot2)

#df<-airquality
#df <- df

test_data <-
  data.frame(
    var0 = 100 + c(0, cumsum(runif(49, -20, 20))),
    var1 = 150 + c(0, cumsum(runif(49, -10, 10))),
    date = seq(as.Date("2002-01-01"), by="1 month", length.out=100)
  )
test_data_long <- melt(test_data, id="date")  # convert to long format


shinyServer(
  function(input,output){
    output$histplot<-renderPlot({
    Selected_Variable <- test_data_long[, input$plot]
    p1 <- ggplot(test_data_long, aes(x = Selected_Variable)) + 
            geom_histogram(alpha=0.5, color="red", binwidth = 3) + 
      xlab(as.character(input$plot))
    
    print(p1)
    })
    
    output$lineplot <- renderPlot({
      #Selected_Variable <- df[, input$plot]
      #p2 <- ggplot(df, aes(x = Selected_Variable)) + 
        #geom_histogram(alpha=0.5, color="red", binwidth = 3) + 
        #xlab(as.character(input$plot))
      p2 <- ggplot(data=test_data_long,
             aes(x=date, y=value, colour=variable)) +
        geom_line()
      print(p2)
    })
    
    var2 <- subset(test_data_long, variable == "var2")[3]
    output$prediction<-renderPlot({
        var0 <- subset(test_data_long, variable == "var0")[3]
        if (input$varx == "var0") {
           p <- ggplot(data=test_data_long, aes(x=var0, y = var2) )
           p <- p + xlab("Temp") + ylab("Gas")
        }
        else {
          var1 <- subset(test_data_long, variable == "var1")[3]
           if (input$varx == "var1") {
               p <- ggplot(data=test_data_long, aes(x=var1, y = var2) )
               p <- p + xlab("Humidity") + ylab("Gas")
           }
           
        }

        p <- p + geom_jitter()
        p <- p + geom_smooth(method = "lm")
        
        print(p)
    })
    
  }
)