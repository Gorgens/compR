require(tmap)
require(raster)
require(dplyr)
require(spdep)

# importa as bases de dados
minas = shapefile("municípios de interesse com dados v2.shp")
minas@data$idh = minas@data$idh %>% as.numeric() 
minas@data$taxaDetec = minas@data$taxaDetec %>% as.numeric() 

tm_shape(minas) + tm_polygons(style = 'quantile', col = 'idh') + tm_legend(outside = TRUE, text.size = 0.8)

# definir de vizinho com base em polígonos
vizinhos = poly2nb(minas, queen=FALSE)

# definir pesos iguais para cada vizinho
vizinhosPesos <- nb2listw(vizinhos, style="W", zero.policy=TRUE)

# calcular média da vizinhança
mediaVizinhanca <- lag.listw(vizinhosPesos, minas$idh)

# calcular teste de Moran
moran.test(minas$idh,vizinhosPesos)

# leia mais em:
# https://swampthingecology.org/blog/geospatial-data-analysis-in-rstats.-part-2/
# 
