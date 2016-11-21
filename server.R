library(shiny)
shinyServer(function(input, output) {
        model1 <- lm(dist ~ speed, data = cars)

        model1pred <- reactive({
                speedInput <- input$box1
                predict(model1, newdata = data.frame(speed = speedInput))
        })

        output$plot1 <- renderPlot({
                speedInput <- input$box1
                topY <- max(c(model1pred(),125))
                topX <- max(c(speedInput, 30))
                plot(cars$speed, cars$dist, xlab = "Speed, mph",
                     ylab = "Stopping distance", bty = "n", pch = 16,
                     xlim = c(0, topX), ylim = c(0, topY))
                abline(model1, col = "red", lwd = 2)
                legend(5, topY-10, c("Linear Model Prediction"), pch = 16,
                       col = c("red"), bty = "n", cex = 1.2)
                points(speedInput, model1pred(), col = "red", pch = 16, cex = 2)
        })

        output$pred1 <- renderText({
                model1pred()
        })
})
