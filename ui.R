shinyUI(pageWithSidebar(
        headerPanel("Calculate your current BMI"),
        sidebarPanel(
                numericInput(inputId="weight", label = "Your weight (in kg)", 75),
                numericInput(inputId="height", label = "Your length (in cm)", 175),
                numericInput(inputId="target", label = "Your target BMI", 22.5),
                actionButton("goButton", "Calculate!")
        ),
        mainPanel(
                p('Your weight'),
                textOutput('weight'),
                p('Your length'),
                textOutput('height'),
                p('Your BMI'),
                textOutput('text3'),
                p(''),
                p('Until target'),
                textOutput('togo')
        )
))