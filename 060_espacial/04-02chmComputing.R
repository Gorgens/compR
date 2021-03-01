require(lidR)
require(ForestGapR)
require(raster)

# ground classification
ctg = readLAScatalog("./zf2a_retile/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./zf2a_gndClass/NP_T-403_gndClass{ID}"
classified_ctg = classify_ground(ctg, csf())

# digital terrain model creation
ctg = readLAScatalog("./zf2a_gndClass/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./zf2a_dtm/NP_T-403_dtm{ID}"
dtm_ctg = grid_terrain(ctg, res = 1, algorithm = tin())

# normalize cloud
ctg = readLAScatalog("./zf2a_gndClass/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./zf2a_norm/NP_T-403_norm{ID}"
norm_ctg = normalize_height(ctg, dtm_ctg)

# canopy height model creation
ctg = readLAScatalog("./zf2a_norm/")
opt_chunk_buffer(ctg) = 30
opt_chunk_size(ctg) = 1000
opt_output_files(ctg) = "./zf2a_chm/NP_T-403_chm{ID}"
chm_ctg = grid_canopy(ctg, res = 0.5, p2r(0.2, na.fill = tin()))

# Extract gaps
chm_ctg = raster('zf2a_chm/grid_canopy.vrt')
gap = chm_ctg < 10
gap.vect = rasterToPolygons(gap, fun=function(x){x==1}, n=4, na.rm=TRUE, digits=12, dissolve=TRUE)

