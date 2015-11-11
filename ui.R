library(shiny)
library(leaflet)
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Philippines: Metro Manila Population"),
                sidebarPanel(
                        # numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
                        submitButton('Submit'),
                        # sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05),
                        checkboxGroupInput("city", "Metropolitan Manila Cities",
                                           list("Kalookan City" = "Kalookan City",
                                             "Las Piñas" = "Las Piñas",
                                             "Makati City" = "Makati City",
                                             "Malabon" = "Malabon",
                                             "Mandaluyong" = "Mandaluyong",
                                             "Manila" = "Manila",
                                             "Marikina" = "Marikina",
                                             "Muntinlupa" = "Muntinlupa",
                                             "Navotas" = "Navotas",
                                             "Parañaque" = "Parañaque",
                                             "Pasay City" = "Pasay City",
                                             "Pasig City" = "Pasig City",
                                             "Pateros" = "Pateros",
                                             "Quezon City" = "Quezon City",
                                             "San Juan" = "San Juan",
                                             "Taguig" = "Taguig",
                                             "Valenzuela" = "Valenzuela"),
                                           selected=list("Pasig City"))
                                           
                                             
                ),
                mainPanel(
                        #h3('Results of prediction'),
                        #h4('You entered'),
                        #verbatimTextOutput("inputValue"),
                        #h4('Which resulted in a prediction of '),
                        #verbatimTextOutput("prediction"),
                        #plotOutput('newHist'),
                        h3('Results Map'),
                        h4('(Loading may take a moment.)'),                        
                        leafletOutput("mymap",height=600),
                        dataTableOutput('table')
                )
        )
)
