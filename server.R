current <- function(weight,height)  weight/(height*height/10000)

delta <- function(weight,height, target)  round(((target - (weight/(height*height/10000)))*(height*height/10000)), digits = 2)

shinyServer(
        
        function(input, output) {
                output$weight <- renderText({input$weight})
                output$height <- renderText({input$height})
                output$text3 <- renderText({
                        input$goButton
                        if (input$goButton == 0) "Press the button to calculate your BMI"
                        else isolate(input$weight/(input$height*input$height/10000))
                })
                output$togo <- renderText({
                        input$goButton
                        if (input$goButton == 0) "Press the button to calculate your remaining effort"
                        else if (delta(input$weight,input$height,input$target) > 0) isolate(paste(delta(input$weight,input$height,input$target)), " kg to gain")
                        else if (delta(input$weight,input$height,input$target) == 0) isolate("Congratulations, you're there!")
                        else isolate(paste(-1*delta(input$weight,input$height,input$target)," kg to lose"))
                })
        }
)