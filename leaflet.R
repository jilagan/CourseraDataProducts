library(leaflet)
library(raster)
library(rgdal)
phl <- getData('GADM', country='PHL', level=2)

#cities <- subset(phl, phl$NAME_2 %in% c(
#        "Pasig City"
#))

province.list = c("[Pp]asig","[Tt]aguig","[Mm]akati","Tagaytay") 
provinces = subset(phl, grepl(paste0(province.list,collapse="|"),phl$NAME_2))

m <- leaflet() %>%
        addTiles(urlTemplate='http://a{s}.acetate.geoiq.com/tiles/terrain/{z}/{x}/{y}.png',
                 attribution='&copy;2012 Esri & Stamen, Data from OSM and Natural Earth') %>%  
        addPolygons(data=phl, color="#d75118", weight="1", opacity="1.0", fillColor="#E76229", fillOpacity="1.0") %>%
        addPolygons(data=provinces, color="#000000", weight="1", opacity="1.0", fillColor="#000000", fillOpacity="0.5")
print(m)  # Print the map