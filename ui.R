library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Stopping distance from car speed"),
        sidebarLayout(
                sidebarPanel(
                        numericInput("box1", "Enter speed of your car in mph:", value = 10)
                ),

                mainPanel(
                        h3("Support documentation"),
                        h5("This app uses dataset cars, which contains the speed of the cars and distances taken to stop. Based on this data, it builds a linear model of distance to stop versus speed. The app allows you to know what distance your car is likely to take to stop given its speed. Just enter a numeric value of the car speed in the sidebar input window. The corresponding linear model prediction for distance to stop will be shown both at the plot below (as a red point) and below the plot (as a number)"),
                        plotOutput("plot1"),
                        h3("Linear Model Prediction for Stopping distance:"),
                        textOutput("pred1")
                )
        )
))
