population <- rbind(c("Kalookan City",1489040),
                    c("Las Piñas",552573),
                    c("Makati City",529039),
                    c("Malabon",353337),
                    c("Mandaluyong",328699),
                    c("Manila",1652171),
                    c("Marikina",424150),
                    c("Muntinlupa",459941),
                    c("Navotas",249131),
                    c("Parañaque",588126),
                    c("Pasay City",392869),
                    c("Pasig City",669773),
                    c("Pateros",64147),
                    c("Quezon City",2761720),
                    c("San Juan",121430),
                    c("Taguig",644473),
                    c("Valenzuela",575356)
              )

colnames(population)<-c("city","total")
write.csv(population,file="population.csv")