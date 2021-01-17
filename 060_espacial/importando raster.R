require(raster)
require(sf)
require(rgdal)
require(tidyverse)
require(tmap)
require(gridExtra)
require(factoextra) 
require(maptools)

## Importa shapefile de limites ---------------------------
amaz = shapefile('./data/amazbioma.shp')
amaz = spTransform(amaz, CRS("+proj=longlat +datum=WGS84"))

## Importa raster de velocidade do vento ---------------------------
uspeed = abs(raster('./data/uspeed.tif'))
uspeed = setMinMax(uspeed)
ref = abs(uspeed)

## Importa raster de taxa de raios ---------------------------
lightning = raster('./data/lightning.tif') %>% crop(ref)
lightning = raster(vals=values(lightning),
                   ext=extent(ref), 
                   nrows=dim(ref)[1],
                   ncols=dim(ref)[2])
lightning = setMinMax(lightning)

map = tm_shape(lightning) + 
  tm_raster(n = 15,
            palette = colorRampPalette( c("blue","yellow", "red"))(12),
            legend.hist = TRUE) +
  tm_legend(outside = TRUE, hist.width = 2)
print(map)
tmap_save(map, "./plot/lightning_image.png", width = 1920, height = 1080)

## Importa raster de FAPAR ---------------------------
fapar = raster('./data/fapar.tif') %>% crop(ref)
summary(getValues(fapar))
tm_shape(fapar) + tm_raster(n = 10)

fill.na <- function(x) {
  center = 0.5 + (width*width/2) 
  if( is.na(x)[center] ) {
    return( median(x, na.rm=TRUE) )
  } else {
    return( x[center] )
  }
} 
 
fapar2 = faparteste
before = summary(getValues(fapar2))[7]
print(before)
for(i in seq(1, 10, 1)){
  width = 9
  fapar2 = focal(fapar2, w = matrix(1,width,width), fun = fill.na, pad = TRUE, na.rm = FALSE) %>% crop(ref)
  after = summary(getValues(fapar2))[7]
  print(after)
}

fapar2 = raster(vals=values(fapar2),
                ext=extent(ref), 
                nrows=dim(ref)[1],
                ncols=dim(ref)[2])
fapar2 = setMinMax(fapar2)

writeRaster(fapar2, "./data/faparProcessed.tif", overwrite=TRUE)

tm_shape(fapar2) + tm_raster(n = 10)

fapar = raster('./data/fapar.tif') %>% crop(ref)

fapar = raster(vals=values(fapar),
               ext=extent(ref), 
               nrows=dim(ref)[1],
               ncols=dim(ref)[2])
fapar = setMinMax(fapar)

map = tm_shape(fapar) + 
  tm_raster(n = 15,
            palette = colorRampPalette( c("blue","yellow", "red"))(12),
            legend.hist = TRUE) +
  tm_legend(outside = TRUE, hist.width = 2)
print(map)
tmap_save(map, "./plot/fapar_image.png", width = 1920, height = 1080)

fapar2 = raster('./data/faparProcessed.tif') %>% crop(ref)

fapar2 = raster(vals=values(fapar2),
                ext=extent(ref), 
                nrows=dim(ref)[1],
                ncols=dim(ref)[2])
fapar2 = setMinMax(fapar2)



## Stack das variáveis ambientais ---------------------------
layers = stack(fapar,
               fapar2, 
               uspeed, 
               lightning)

save(layers, 
    file = 'C:/Users/gorge/Documents/GIS DataBase/amazon maximum height extras/objects/layers2estimate.Rdata')

# atualiza nome das camadas
names(layers) = c("fapar", 
                  "fapar2",
                  "uspeed", 
                  "lightning")


## Cliping stack by maximum height location ---------------------------
maximas = sf::as_Spatial(st_read(dsn = './data/maximum height 200321.gpkg', layer = 'pontos_wgs84'))
maximas@data = maximas@data['altura_cop']

tm_shape(amaz) + tm_polygons() + 
  tm_shape(maximas) + tm_dots("altura_cop", size = 0.2, palette = "RdYlGn")

# extrai valor das variáveis ambientais para cada altura máxima mapeada
explanatoryVariables = raster::extract(layers, maximas)                        

# adiciona no shapefile das alturas máximas os valores das variáveis ambientais extraídas
maximas@data = cbind(maximas@data, explanatoryVariables)                       

# salva shapefile com os atributos clipados dos rasters
writeSpatialShape(maximas, "./data/maximasAndFactors")                        
