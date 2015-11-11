library(shiny)
library(leaflet)
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("Philippines: Metro Manila Population"),
                sidebarPanel(
                        h4('Select cities to display in map on the right.'),
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
                                           selected=list("Pasig City")),
                        submitButton('Submit')
                                           
                                             
                ),
                mainPanel(
                        h4('(Loading may take a moment.)'),
                        h4('Scroll to the bottom to see a summary of cities and total population.'),
                        h5('Note: server-side computations done to center the map based on cities selected on the left.'),
                        leafletOutput("mymap",height=600),
                        dataTableOutput('table')
                )
        )
)
