library(shiny)
# Define UI for the air quality application
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Data Products Course's Poject: Air quality data"),
        
        # Sidebar with controls to select the dependent and independent variables
        # to plot the relationship and fit the linear model.
        sidebarLayout(
                sidebarPanel(
                        # Options to select the outcome variable between Temp 
                        # or Solar.R
                        radioButtons("yVar","Select the dependent variable",
                                     c("Temperature"="Temp",
                                       "Solar radiation" = "Solar.R"),inline = TRUE),
                        # Option to select the predictor variable
                        selectInput("variable", "Predictor Variable to fit a lineal model
                                     with the selected output:",
                                    c("Ozone" = "Ozone",
                                      "Wind" = "Wind")),
                        hr(),
                        # Explanatory notes to the app user
                        helpText("Data from New York city. Months of May to September 
                                in 1973. Use the data to fit a 
                                 linear univariate model. Select the outcome and
                                 predictor variables and check the fitted linear
                                 model")
                ),
                
                # Show the caption and plot of the requested variable against
                # temperature or Solar Radiation
                mainPanel(
                        h3(textOutput("caption")),
                        plotOutput("modPlot"),
                        h2("Summary of the linear model"),
                        verbatimTextOutput("summary")
                        
                )
        
)))