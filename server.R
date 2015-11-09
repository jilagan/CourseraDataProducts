library(shiny)
library(UsingR)
library(leaflet)
library(raster)
library(rgdal)
data(galton)
diabetesRisk <- function(glucose) glucose / 200
#phl <- getData('GADM', country='PHL', level=2)
phl <- readOGR("PHL_adm_shp/PHL_adm2.shp",
               layer = "PHL_adm2", verbose = FALSE)

#city.list = c("Pasig City","Quezon City") 
#cities = subset(phl, grepl(paste0(city.list,collapse="|"),phl$NAME_2))

shinyServer(
        function(input, output) {

                cities = reactive({
                   if(!is.null(input$city)){
                     subset(phl, grepl(paste0(input$city,collapse="|"),phl$NAME_2))
                   } else {
                     subset(phl, grepl(paste0(c("Pasig City"),collapse="|"),phl$NAME_2))
                   }
                #   subset(phl, grepl(paste0(city.list,collapse="|"),phl$NAME_2))     
                })

                # cities = subset(phl, grepl(paste0(city.list,collapse="|"),phl$NAME_2))
                output$inputValue <- renderPrint({input$glucose})
                output$prediction <- renderPrint({diabetesRisk(input$glucose)})
                output$newHist <- renderPlot({
                        hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
                        mu <- input$mu
                        lines(c(mu, mu), c(0, 200),col="red",lwd=5)
                        mse <- mean((galton$child - mu)^2)
                        text(63, 150, paste("mu = ", mu))
                        text(63, 140, paste("MSE = ", round(mse, 2)))
                })
                output$mymap <- renderLeaflet({
                        
                        leaflet() %>%
                                addTiles(urlTemplate='http://a{s}.acetate.geoiq.com/tiles/terrain/{z}/{x}/{y}.png',
                                         attribution='&copy;2012 Esri & Stamen, Data from OSM and Natural Earth')   %>%  
                                # addPolygons(data=phl, color="#d75118", weight="1", opacity="1.0", fillColor="#E76229", fillOpacity="1.0") %>%
                                addPolygons(data=subset(phl, grepl(paste0(c("Pasig City"),collapse="|"),phl$NAME_2)), color="#ffffff", weight="1", opacity="0.0", fillColor="#ffffff", fillOpacity="0.0")
                         
                        
                })
                observe({
                        proxy <- leafletProxy("mymap",data=cities()) %>%
                                clearShapes()
                        proxy %>% addPolygons(color="#000000", weight="1", opacity="1.0", fillColor="#000000", fillOpacity="0.5")
                        
                        proxy %>% setView(mean(coordinates(cities())[,1]),
                                          mean(coordinates(cities())[,2]),
                                          zoom=10)
                        #proxy %>% setMaxBounds(min(coordinates(cities())[,1]),
                        #                       min(coordinates(cities())[,2]),
                        #                       max(coordinates(cities())[,1]),
                        #                       max(coordinates(cities())[,2]))
                        
                        
                        
                })
                
        }
)