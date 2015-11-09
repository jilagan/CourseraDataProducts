library(shiny)
library(leaflet)
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Diabetes prediction"),
                sidebarPanel(
                        numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
                        submitButton('Submit'),
                        sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05),
                        checkboxGroupInput("city", "City",
                                           c("Pasig City" = "Pasig City",
                                             "Quezon City" = "Quezon City",
                                             "Makati City" = "Makati City"))
                ),
                mainPanel(
                        h3('Results of prediction'),
                        h4('You entered'),
                        verbatimTextOutput("inputValue"),
                        h4('Which resulted in a prediction of '),
                        verbatimTextOutput("prediction"),
                        plotOutput('newHist'),
                        leafletOutput("mymap")
                )
        )
)
