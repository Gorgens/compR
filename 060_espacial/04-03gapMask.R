require(lidR)
require(ForestGapR)
require(raster)

# Extract gaps
chm_ctg = raster('zf2a_chm/grid_canopy.vrt')
gap = chm_ctg < 10
writeRaster(gap, 'zf2a_raster.tif')
 
