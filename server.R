library(shiny)
library(datasets)

data(airquality)

# Define server logic required to plot the predictor variables against
# dependent variables
shinyServer(function(input, output) {

        # Compute the formula text in a reactive expression since it is
        # shared by the output$caption and output$modPlot functions
                
        formulaText1 <- reactive({
                paste(input$yVar,"~", input$variable)
        })

        # Return the formula text for printing as a caption
        output$caption <- renderText({
                paste("Lineal Model for",formulaText1())
        })

        # Generate a plot of the requested variable against temp or Solar.R.
        # Including the regression line from the linear model
        output$modPlot <-renderPlot({
                        plot(as.formula(formulaText1()),
                             data = airquality)
                        abline(lm(Temp~Ozone,data=airquality),col="blue",lwd=3)
                })
        
        # Generate a summary of the lineal model
        output$summary <- renderPrint({
                summary(lm(as.formula(formulaText1()),data=airquality))
        })
        
   
})