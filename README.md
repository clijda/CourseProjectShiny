CourseProjectShiny
==================
this folder contains the server.R and ui.R files of my Shiny App.

The shiny app loads a group checkbox selector that allows selecting the variables of the mtcars dataset.
The result is:
- a pairsplot is build based on the selected variables
- a regression model is calculted to predict mpg based on the selected variables
  - R² is printed
  - the intercept and multipliers for the selected variables are printed
