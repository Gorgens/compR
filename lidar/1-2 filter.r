library(lidR)
rm(list = ls(globalenv()))
gc()

# ============================================
#   FILTRAGEM - SELEÇÃO DE PONTOS DE INTERESSE
# ============================================

# filtragem na importação - streaming filter

las = readLAS("data/MixedEucaNat_normalized.laz")
las

las = readLAS("data/MixedEucaNat_normalized.laz", select = "xyzi")
las
plot(las)
plot(las, color='Intensity')

las = readLAS("data/MixedEucaNat_normalized.laz", select = "xyzi", filter='-drop_z_below 2')
las
plot(las)

las = readLAS("data/MixedEucaNat_normalized.laz", filter = "-drop_z_below 5 -keep_first", select = "xyz")
las
plot(las)

rlas:::lasfilterusage()


# filtragem após importação

?lasfilter
?lasfilters

las = readLAS("data/MixedEucaNat_normalized.laz")

firstreturns = lasfilter(las, ReturnNumber == 1)
firstreturns
plot(firstreturns)

firstreturnover5 = lasfilter(las, Z >= 5, ReturnNumber == 1)
plot(firstreturnover5)

surfacepoints = lasfiltersurfacepoints(las, 0.5)
plot(surfacepoints)

groundpoints = lasfilterground(las)
plot(groundpoints)


# seleção de pontos por geometria

avgX = mean(las$X)
avgY = mean(las$Y)

lasplot = lasclipCircle(las, avgX, avgY, 10)
plot(lasplot)

lasrectangle = lasclipRectangle(las, avgX - 10, avgY - 5, avgX + 15, avgY + 5)
plot(lasrectangle)

stand = shapefile("data/shapefiles/MixedEucaNat.shp")
plot(stand)

lasstand = lasclip(las, stand)
plot(lasstand)

lasmerged = lasmergespatial(las, stand, 'std')
lasmerged
plot(lasmerged, color='std')


lasplot = readLAS("data/MixedEucaNat_normalized.laz", select = "xyz", filter = "-keep_circle 203890 7358935 30")
plot(lasplot)

n = 3
x = runif(n, min(las$X), max(las$X))
y = runif(n, min(las$Y), max(las$Y))

lasplots = lasclipCircle(las, x, y, 10)

length(lasplots)
class(lasplots)
class(lasplots[[1]])
sapply(lasplots, plot)

# exercício: crie um filtro customizado

