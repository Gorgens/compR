require(lidR)
rm(list = ls())
gc()

# ===========================================
#  IMPORTAÇÃO E VISUALIZAÇÃO DE DADOS LAS/LAZ
# ===========================================

# Estrutura do arquivo - classe S4

las = readLAS("data/MixedEucaNat.laz")

las

las@data

las@header

las@header@PHB

las@header@VLR


# Visualização

plot(las)

plot(las, clear_artifacts = FALSE)

plot(las, colorPalette = terrain.colors(50))

plot(las, color = "Intensity")

plot(las, color = "Intensity", colorPalette = heat.colors(50), trim = 800)

plot(las, color = "Classification")

plot(las, color = "Withheld_flag")

las = readLAS("data/exemple_rgb.las")
plot(las)
plot(las, color = "RGB")

las = readLAS("data/MixedEucaNat.laz")

plot(las@header)


# Propriedades geográficas - LAS objects are Spatial objects from sp

projection(las)
extent(las)
proj4string(las)
bbox(las)
las$Z
las$Intensity

# Consistência dos arquivos

las = readLAS("data/MixedEucaNat_normalized.laz")

lascheck(las)

las = readLAS("data/example_corrupted.laz")
plot(las)

lascheck(las)

