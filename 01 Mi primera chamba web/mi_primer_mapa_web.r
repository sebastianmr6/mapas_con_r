# Importa la librería 'pacman' para poder usar la función 'pacman' que permite instalar paquetes de R.
# Esta se encargará de instalar los paquetes 'sf' y 'leaflet' si no están instalados y luego de cargarlos al proyecto.
library(pacman)
pacman::p_load('sf', 'leaflet')

# Define tres vectores (listas) con las coordenadas de tres puntos en Medellín, Colombia.
# Cada vector contiene las coordenadas de un punto en particular de manera ordenada.
# Recuerde que el separador decimal en R es el punto (.) y no la coma (,).
lat <- c(6.245368, 6.293770, 6.264823)
lon <- c(-75.551109, -75.569000, -75.569444)
place <- c("ITM Fraternidad", "ITM Castilla", "Universidad de Antioquia")

# Crea un data frame (es como una tabla) con los vectores anteriores.
df <- data.frame(lat, lon, place, stringAsFactors = FALSE)

# Convierte el data frame en un objeto de tipo 'sf' (simple feature) que contiene los puntos.
# Podríamos decir algo como que vamos a convertir el texto dentro del dataframe en un objeto geográfico.
# La función 'st_as_sf' convierte el data frame en un objeto de tipo 'sf' y la función 'coords' indica las columnas que contienen las coordenadas.
points <- st_as_sf(df, coords = c("lon", "lat"), crs = 4326)

# Crea un mapa interactivo con los puntos anteriores.
leaflet(points) %>% 
    addTiles() %>% 
    addMarkers(popup = ~place) %>% 
    addControl("<h1>Mi primer mapa 🗺️</h1>", position = "topright")
