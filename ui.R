
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

# Your Shiny Application
# 
# Write a shiny application with associated supporting documentation. 
# The documentation should be thought of as whatever a user will need 
# to get started using your application.
# Deploy the application on Rstudio's shiny server
# Share the application link by pasting it into the text box below
# Share your server.R and ui.R code on github
# The application must include the following:
# 
# Some form of input (widget: textbox, radio button, checkbox, ...)
# Some operation on the ui input in sever.R
# Some reactive output displayed as a result of server calculations
# You must also include enough documentation so that a novice user could
# use your application.
# The documentation should be at the Shiny website itself. 
# Do not post to an external link.
# The Shiny application in question is entirely up to you. However, 
# if you're having trouble coming up with ideas, you could start from
# the simple prediction algorithm done in class and build a new algorithm
# on one of the R datasets packages. Please make the package simple for the
# end user, so that they don't need a lot of your prerequisite knowledge to
# evaluate your application. You should emphasize a simple project given the
# short time frame.  

library(shiny)
data(mtcars)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("mtcars scatterplots and regression analysis"),
  
  # Sidebar with checkboxes for variables to plot
  sidebarPanel(
    checkboxGroupInput("Predictors", "Select minimum 2 variables: ",names(mtcars),selected=c("mpg","cyl")),
    h4(helpText("How it works...")),
    helpText("The application builds a pairs plot and performs a short regression analysis based on the selected variables (at least 2) in the checkboxes."),
    helpText("The outcome of the regression is always 'mpg', whether selected or not."),
    helpText("The regression analysis consists of calculating R² and determining the estimated values of the intercept and multipliers for the selected variables.")
  ),
  
  # Show a pairsplot of the selected predictors
  mainPanel(
    plotOutput("pairsPlot"),
    h3(textOutput("x")),
    textOutput("y"),
    textOutput("z")
  )
))
