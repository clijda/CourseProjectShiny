
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)
data(mtcars)
shinyServer(function(input, output) {
  
  output$pairsPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    x <- ""
    for (i in 1:length(input$Predictors)){
      x <- paste(x,input$Predictors[i],sep="+")
    }
    x <- as.formula(paste0("~",x))
    
    # draw the pairs plot based on the input variables in x 
    pairs(x,mtcars, lower.panel=panel.smooth,col="red",col.smooth="blue",gap=1)
    
  })
  
  output$x <- renderText("Regression Analysis for selected predictors")
  
  output$y <- renderText({
    # construct the fit string with the predictor inputs
    y <- ""
    for (i in 1:length(input$Predictors)){
      if (input$Predictors[i] != "mpg"){
        y <- paste(y,input$Predictors[i],sep=" + ")
      } 
    }
    y <- substr(y,3,nchar(y))
    y <- paste0("mpg ~",y)
    f <- y
    fit<-lm(y,data=mtcars)
    
    # construct the output string consisting of the R² for the model
    y<-paste0("Regression model   ", f, "   ->  R² = ",format(summary(fit)$r.squared,digits=3))
    y
  })
  output$z<- renderText({
    # construct the fit string with the predictor inputs
    y <- ""
    for (i in 1:length(input$Predictors)){
      if (input$Predictors[i] != "mpg"){
        y <- paste(y,input$Predictors[i],sep=" + ")
      }
    }
    y <- substr(y,3,nchar(y))
    y <- paste0("mpg ~",y)
    fit<-lm(y,data=mtcars)
    
    # construct the output string consisting of the coefficients of the lm model
    z<-paste(rownames(summary(fit)$coef), format(summary(fit)$coef[,1],digits=4),sep=" \r  =   \r ")
    z
  })
})
