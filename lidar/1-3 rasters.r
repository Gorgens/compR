library(lidR)
rm(list = ls(globalenv()))
gc()

# ================================
# LINHA DE PROCESSAMENTO - DTM/CHM
# ================================

las = readLAS("data/MixedEucaNat.laz", filter = "-keep_random_fraction 0.4", select='xyzi')
plot(las, color='Classification')
plot(las)


# segmentação de solo

?lasground
?pmf
?csf

laspmf = lasground(las, pmf(c(2,5), c(0.5, 1)))
plot(laspmf, color='Classification')

lascsf = lasground(las, csf(), F)
plot(lascsf, color='Classification')

groundpmf = lasfilterground(laspmf)
groundcsf = lasfilterground(lascsf)
plot(groundpmf)
plot(groundcsf)


# modelo digital de terreno

?grid_terrain

dtm = grid_terrain(lascsf, 1, knnidw())
plot(dtm)
plot_dtm3d(dtm, color='red')

noground = lasfilter(lascsf, Classification != 2)
gdplot = plot(noground)
add_dtm3d(gdplot, dtm, color='red')


# normalização e modelo digital de superfície de copa

?lasnormalize

lasflat = lasnormalize(lascsf, dtm)
min(lasflat$Z)

plot(lasflat)
rgl::axes3d(color='white')

# ver nuvem nas coordenadas originais
plot(las, clear_artifacts=F)
rgl::axes3d(color='white')

?grid_canopy
?p2r
?dsmtin
?pitfree

chm = grid_canopy(lasflat, 1, p2r())
plot(chm)

chmfill = grid_canopy(lasflat, 1, p2r(subcircle = 0.25))
plot(chmfill)

# extra: raster focal smoothing
chmfocal = focal(chmfill, matrix(1,3,3), mean, na.rm=T)
plot(chmfocal)

plot_dtm3d(chm, color='yellow')
plot_dtm3d(chmfill, color='green')
plot_dtm3d(chmfocal, color='forestgreen')


# exportando rasters

writeRaster(dtm, 'dtm_lidr.tif')
writeRaster(dtm, 'chm_focal_lidr.tif')
