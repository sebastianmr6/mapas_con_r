# Crearemos un mapa interactivo igual al anterior, pero esta vez los datos estarán en un archivo Excel.
# Esto beneficiará a los estudiantes cuando deban trabajar con datos almacenados en este formato y asì evitarse la tarea de digitarlos manualmente.

library(pacman)
pacman::p_load('sf', 'leaflet')

# Este código permite seleccionar un archivo Excel desde el explorador de archivos ¡Se abrirá una ventana que le preguntará la ubicación del archivo!
archivo_excel <- file.choose()

df <- read_excel(archivo_excel, sheet = "Medellín")

points <- st_as_sf(df, coords = c("lon", "lat"), crs = 4326)

leaflet(points) %>% 
    addTiles() %>% 
    addMarkers(popup = ~place) %>% 
    addControl("<h1>Mi primer mapa 🗺️</h1>", position = "topright")
